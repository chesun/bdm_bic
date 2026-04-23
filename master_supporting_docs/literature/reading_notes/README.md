# Reading Notes — Canonical Structure

**Purpose.** Reading-notes files are the project's record of primary-source engagement. The PreToolUse hook at `.claude/hooks/primary-source-check.py` checks this directory before allowing edits to load-bearing files that cite external papers. Having a notes file = the paper has been read. No notes file + PDF in repo = edit blocked.

**Rule:** `.claude/rules/primary-source-first.md`.

## Two accepted formats

### 1. Per-paper file (preferred for load-bearing references)

Filename: `{surname1}_{surname2}_{year}.md`, lowercase, underscore-separated. Examples:

- `chakraborty_kendall_2025.md`
- `danz_vesterlund_wilson_2024.md`
- `karni_2009.md`
- `azrieli_chambers_healy_2018.md`

### 2. Compiled batch file (acceptable for reading sprints)

A single `.md` file containing multiple papers, each introduced by a markdown section header that names the surnames and year:

```markdown
## 9. Chakraborty & Kendall (2025) — Uniquely Justifiable Strategies
...
## 18. Azrieli, Chambers & Healy (2018) — Incentives in Experiments
```

Existing compiled file: `bdm_bic_2026-03.md` (23 papers from the March 2026 literature sprint).

## Required sections (per-paper file template)

```markdown
---
citation: [Full citation with journal, volume, pages]
bibtex_key: [key used in references.bib]
primary_source: master_supporting_docs/literature/papers/[filename].pdf
date_read: YYYY-MM-DD
reader: [Christina | Claude | librarian]
---

# [Authors] ([Year]) — [Short title]

## Summary

One paragraph. What does the paper do?

## Core claims this paper makes

Bulleted list. Each claim in its own bullet, concrete enough to cite.

## Definitions I should cite verbatim

Direct quotes of the paper's key definitions. Load-bearing in downstream work — paraphrasing loses precision.

## What this paper is NOT claiming (common misreadings)

**This section is load-bearing for preventing derivative-doc drift.**

Anticipate or record ways the paper gets misread. If downstream docs (ADRs, analysis memos, hypotheses, session logs) have previously misframed the paper, record the correction here. Future readers should see the misreading and the corrected reading side-by-side.

Example for Chakraborty & Kendall 2025:
- *Misreading:* UJS is a formal mechanism property distinct from contingent reasoning.
- *Correction:* UJS is a *formalization* of contingent reasoning. A mechanism is UJS iff the dominant action is the unique action that survives quantification over all payoff-relevant CR paths.

## Method

Experimental design, data, identification strategy. One paragraph.

## Key numerical results

Bulleted. Direction, size, confidence bounds if reported.

## Relevance to our project

Which hypotheses / design decisions / ADRs does this paper bear on? Cite ADR numbers.

## Open questions flagged by this paper (for our work)

Bulleted.

## Passages worth quoting

Direct quotes with page numbers. Use when the paraphrase risks losing precision.
```

## Filling in for Claude-read papers

If Claude reads a paper in-session (e.g., via the `pdf-learnings` skill), the output should land here with `reader: Claude` and the session-log reference in the frontmatter. A Claude-produced notes file is no lower-status than a Christina-produced one — both count toward the hook's check.

## When a paper is superseded or revised

Keep the original notes file. If a newer version changes the claims, write a new notes file with the updated citation date (`chakraborty_kendall_2025.md` supersedes `chakraborty_kendall_2022.md`). Both remain readable.

## Escape hatch

If you need to edit around an existing citation without making a new framing claim (e.g., typo fix, renumbering), include an escape comment in the delta:

```
<!-- primary-source-ok: chakraborty_kendall_2025 -->
```

Abuse of the escape hatch is auditable: `grep -R "primary-source-ok" quality_reports/ experiments/ bdm_bic_paper/`.
