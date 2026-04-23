#!/usr/bin/env python3
"""
Primary-Source-First Enforcement Hook.

Blocks Edit/Write to load-bearing files when the new content cites a paper
whose PDF is in the repo but for which no reading-notes file exists.

Rule: `.claude/rules/primary-source-first.md`
Install (in .claude/settings.json, PreToolUse block with matcher "Edit|Write"):
    python3 "$CLAUDE_PROJECT_DIR"/.claude/hooks/primary-source-check.py

Fail-open on any internal exception — never block Claude due to a hook bug.
"""

from __future__ import annotations

import json
import os
import re
import sys
from pathlib import Path


# File paths where primary-source enforcement applies.
ENFORCEABLE_PATTERNS = [
    r"experiments/designs/decisions/.*\.md$",
    r"bdm_bic_paper/paper/.*\.tex$",
    r"quality_reports/advisor_meeting_[^/]+/.*\.(tex|md)$",
    r"quality_reports/session_logs/.*\.md$",
    r"quality_reports/plans/.*\.md$",
    r"quality_reports/[^/]+_analysis\.md$",
]

# Project-specific surname allowlist for citation detection. Claude's regex
# otherwise catches too many false positives (e.g., "Section 2.1 (2024)").
KNOWN_SURNAMES = {
    "chakraborty", "kendall",
    "danz", "vesterlund", "wilson",
    "brown", "healy", "leo",
    "karni", "azrieli", "chambers",
    "tsakas", "li", "troyan", "segal",
    "snowberg", "yariv", "niederle",
    "burfurd", "wilkening",
    "holt", "smith", "laury",
    "hao", "houser",
    "benoit", "dubra", "romagnoli",
    "martin", "munoz-rodriguez",
    "burdea", "woon",
    "gneezy", "rustichini",
    "becker", "degroot", "marschak",
    "ellsberg",
    "grether",
    "gillen", "hoel", "rabin",
    "chapman", "fisher",
    "brodeur",
    "moffatt",
    "koszegi", "rabin",
    "dustan", "koutout",
    "duCharme", "donnell",
    "grapow",
    "leo", "stelnicki",
    "ersoy",
    "gonzalez-fernandez", "bosch-rosa", "meissner",
    "brocas", "carrillo",
}

# Author-Year regex. Matches things like:
#   Chakraborty and Kendall (2025)
#   Chakraborty & Kendall 2025
#   Danz, Vesterlund, and Wilson (2024)
#   DVW (2024)      -> not caught (initialism; handle separately if needed)
#   Karni (2009)
#   Brown et al. (2025)
AUTHOR_YEAR = re.compile(
    r"""
    \b
    (?P<first>[A-Z][A-Za-z\-']+)                  # First surname
    (?:\s*(?:,|and|&)\s*(?P<second>[A-Z][A-Za-z\-']+))?     # Optional second surname
    (?:\s*(?:,\s*and|&)\s*(?P<third>[A-Z][A-Za-z\-']+))?    # Optional third surname
    (?:\s+et\s+al\.?)?                            # Optional "et al."
    \s*\(?(?P<year>(?:19|20)\d{2})[a-z]?\)?        # Year, optionally in parens
    """,
    re.VERBOSE,
)

# Escape hatch comment format:
#   <!-- primary-source-ok: stem1, stem2 -->
ESCAPE_HATCH = re.compile(
    r"<!--\s*primary-source-ok:\s*(?P<stems>[^-]+)-->",
    re.IGNORECASE,
)


def is_enforceable(rel_path: str) -> bool:
    return any(re.search(p, rel_path) for p in ENFORCEABLE_PATTERNS)


def extract_delta(tool_name: str, tool_input: dict) -> str:
    if tool_name == "Write":
        return tool_input.get("content", "") or ""
    if tool_name == "Edit":
        return tool_input.get("new_string", "") or ""
    return ""


def extract_citations(text: str) -> list[tuple[str, str]]:
    """Return list of (citation_stem, display_form) tuples."""
    citations = []
    seen = set()
    for match in AUTHOR_YEAR.finditer(text):
        first = match.group("first") or ""
        second = match.group("second") or ""
        third = match.group("third") or ""
        year = match.group("year") or ""

        # Require at least the first surname to be in the known allowlist.
        # This filters out false positives like "Section 2 (2024)" or "Table
        # 1 (ibid)" where the captured "first" token is not a real surname.
        if first.lower() not in KNOWN_SURNAMES:
            continue

        surnames = [s for s in [first, second, third] if s and s.lower() in KNOWN_SURNAMES]
        if not surnames:
            continue

        stem = "_".join(s.lower() for s in surnames) + "_" + year
        display = " ".join(surnames) + f" ({year})"

        if stem not in seen:
            seen.add(stem)
            citations.append((stem, display))
    return citations


def extract_escaped_stems(text: str) -> set[str]:
    escaped = set()
    for match in ESCAPE_HATCH.finditer(text):
        raw = match.group("stems")
        for stem in (s.strip().lower() for s in raw.split(",")):
            if stem:
                escaped.add(stem)
    return escaped


def reading_notes_exists_for(stem: str, reading_notes_dir: Path) -> bool:
    """Return True if a reading-notes file or dedicated section exists for the
    citation stem.

    Two ways to match:
    1. A file in reading_notes/ whose basename starts with the citation stem
       (case-insensitive).
    2. A dedicated markdown section header inside any reading_notes/*.md file
       that names all the stem's surnames AND the year. Casual in-text
       references don't count — only actual section headers (lines starting
       with #) or citation metadata lines (lines starting with `**Citation:**`).
    """
    if not reading_notes_dir.is_dir():
        return False

    stem_lower = stem.lower()

    # 1. Direct filename match.
    for f in reading_notes_dir.glob("*.md"):
        if f.name.lower().startswith(stem_lower):
            return True

    # 2. Section-header match inside compiled files.
    parts = stem_lower.split("_")
    if len(parts) < 2:
        return False
    year = parts[-1]
    surnames = parts[:-1]

    surname_pattern = r"\b" + r"\b.*\b".join(re.escape(s) for s in surnames) + r"\b"
    section_pattern = re.compile(
        surname_pattern + r".*" + re.escape(year),
        re.IGNORECASE,
    )

    # Only count markdown section headers (lines starting with #) or
    # citation-metadata lines (lines starting with **Citation:**). Casual
    # in-text references to the paper do not constitute reading-notes
    # evidence.
    header_line = re.compile(r"^\s*#{1,6}\s+")
    citation_line = re.compile(r"^\s*\*\*Citation", re.IGNORECASE)

    for f in reading_notes_dir.glob("*.md"):
        try:
            text = f.read_text(encoding="utf-8", errors="ignore")
        except OSError:
            continue
        for line in text.splitlines():
            if not (header_line.match(line) or citation_line.match(line)):
                continue
            if section_pattern.search(line):
                return True
    return False


def paper_pdf_exists_for(stem: str, papers_dir: Path) -> bool:
    """Return True if a PDF matching the citation stem is in the papers dir."""
    if not papers_dir.is_dir():
        return False

    stem_lower = stem.lower()
    parts = stem_lower.split("_")
    if len(parts) < 2:
        return False
    year = parts[-1]
    surnames = parts[:-1]

    surname_pattern = r"\b" + r".*\b".join(re.escape(s) for s in surnames) + r"\b"
    name_pattern = re.compile(
        surname_pattern + r".*" + re.escape(year),
        re.IGNORECASE,
    )

    for f in papers_dir.glob("*.pdf"):
        if name_pattern.search(f.name):
            return True
    return False


def main() -> None:
    try:
        hook_input = json.load(sys.stdin)
    except (json.JSONDecodeError, EOFError):
        sys.exit(0)

    tool_name = hook_input.get("tool_name", "")
    if tool_name not in {"Edit", "Write"}:
        sys.exit(0)

    tool_input = hook_input.get("tool_input", {}) or {}
    file_path = tool_input.get("file_path", "") or ""
    if not file_path:
        sys.exit(0)

    project_dir = os.environ.get("CLAUDE_PROJECT_DIR", hook_input.get("cwd", ""))
    if not project_dir:
        sys.exit(0)

    project_root = Path(project_dir)
    try:
        rel_path = str(Path(file_path).resolve().relative_to(project_root.resolve()))
    except (ValueError, OSError):
        sys.exit(0)

    if not is_enforceable(rel_path):
        sys.exit(0)

    delta = extract_delta(tool_name, tool_input)
    if not delta.strip():
        sys.exit(0)

    citations = extract_citations(delta)
    if not citations:
        sys.exit(0)

    escaped = extract_escaped_stems(delta)

    reading_notes_dir = project_root / "master_supporting_docs" / "literature" / "reading_notes"
    papers_dir = project_root / "master_supporting_docs" / "literature" / "papers"

    missing = []
    for stem, display in citations:
        if stem in escaped:
            continue
        if reading_notes_exists_for(stem, reading_notes_dir):
            continue
        if not paper_pdf_exists_for(stem, papers_dir):
            # Paper not in repo — cannot enforce. Allow silently.
            continue
        missing.append((stem, display))

    if not missing:
        sys.exit(0)

    lines = [
        "PRIMARY-SOURCE-FIRST: blocking edit.",
        "",
        f"You are writing to a load-bearing file: {rel_path}",
        "",
        "The following cited papers have PDFs in master_supporting_docs/literature/papers/",
        "but no corresponding reading-notes file in master_supporting_docs/literature/reading_notes/:",
        "",
    ]
    for stem, display in missing:
        lines.append(f"  - {display}  (expected notes stem: {stem})")
    lines.extend(
        [
            "",
            "Fix: read each primary source (use the pdf-learnings skill for long papers),",
            "then produce a reading-notes file following the template in",
            "master_supporting_docs/literature/reading_notes/README.md",
            "",
            "Alternative (only if editing around an existing citation without making a new",
            "framing claim about it): add an escape comment to the delta, e.g.",
            "    <!-- primary-source-ok: chakraborty_kendall_2025 -->",
            "",
            "Rule: .claude/rules/primary-source-first.md",
        ]
    )

    output = {"decision": "block", "reason": "\n".join(lines)}
    json.dump(output, sys.stdout)
    sys.exit(0)


if __name__ == "__main__":
    try:
        main()
    except Exception:
        # Fail open — never block Claude due to a hook bug.
        sys.exit(0)
