# Proposal: Primary-Source-First Rule (Enforceable)

**Status:** DRAFT — awaiting user approval
**Date:** 2026-04-22
**Author:** Claude
**Motivated by:** 2026-04-22 incident where Claude propagated UJS-as-separate-from-CR framing through ADR-0013, the 2026-04-20 identification analysis, and the 2026-04-22 slide review without ever opening `Chakraborty_Kendall_2025_UJS_elicitation.pdf` in the repo.

---

## 1. Failure taxonomy

The failure was not a one-off. It has a reproducible shape worth naming:

1. A **load-bearing external paper** lives in `master_supporting_docs/literature/papers/`.
2. A **derivative doc** (ADR, session log, design memo, reading-notes, paper section) makes a framing claim about that paper.
3. Claude reads the derivative doc, accepts its framing, and makes **downstream claims** (in new ADRs, session logs, hypotheses, slides, referee responses) that propagate the derivative's framing.
4. The original paper is never re-opened. Errors or compressions in the derivative doc compound silently across sessions.

Three things make this pattern insidious:

- Derivative docs are usually *correct* — they were written by Christina, and she has read the paper. The problem is that compressed paraphrases are lossy, and downstream uses can slide the meaning.
- Claude's own outputs *become* derivative docs (session logs, LEARN entries). Future sessions treat Claude's prior framing claims as authoritative.
- Rules alone don't fix it — the project already has `no-assumptions.md` and an ADR protocol, and the UJS error happened anyway.

## 2. Design constraints for any fix

1. **Must enforce, not merely remind.** A line in `CLAUDE.md` saying "read the paper" is not sufficient. The current session had dozens of rules in context and the failure still happened.
2. **Must be deterministic.** The check should not depend on Claude "noticing" it should check.
3. **Must not false-block legitimate work.** Many edits (fixing typos, renumbering figures) touch files with citations without making framing claims. A hook that blocks every edit containing a citation is unusable.
4. **Must survive across sessions.** Reading a paper in session A should count as evidence when working in session B. Reading artifacts need persistence.
5. **Must be low-maintenance.** A rule that requires a human to manually update a list of papers for every edit is dead on arrival.

## 3. Options considered

### Option A — Plain project rule file

Add `.claude/rules/primary-source-first.md` stating the principle. Rely on Claude reading rules at session start and applying them.

**Verdict:** Insufficient. Fails constraint 1. This is what we already have the moral equivalent of for other principles, and the UJS error happened anyway. Useful as a *supporting* element but not sufficient on its own.

### Option B — PreToolUse hook that blocks Write/Edit based on citation detection in content

A shell hook that runs before every Write/Edit. For designated file paths (ADRs, paper main.tex, meeting slides, hypothesis files), the hook scans the new content for citation patterns (Author-YYYY regex plus a curated list of key surnames for this project). For each citation detected, the hook checks whether a corresponding reading-notes file exists and blocks if not.

**Verdict:** Strong enforcement but complex to write well. False positives on bibliography sections and on edits that merely edit around existing citations. Regex over Author-YYYY is noisy.

### Option C — Reading-notes directory as the contract, with hook check

Variant of B that narrows the enforcement. Every paper in `master_supporting_docs/literature/papers/` that Claude intends to cite must have a corresponding file in `master_supporting_docs/literature/reading_notes/`. The hook checks only the *delta* (the new content being added) for citations, not the whole file. If a new citation appears in the delta and no reading-notes file exists for it, block.

**Verdict:** The strongest minimal-viable option. Addresses false-positive concern by checking only new content. Reading-notes files are independently useful artifacts that survive sessions.

### Option D — Orchestrator-level check in the agent pipeline

Have the orchestrator require a `primary-sources-verified` gate before worker-critic pairs can dispatch on content that cites external papers. Enforced at dispatch time.

**Verdict:** Elegant but heavyweight, and only fires in full-pipeline mode. Standalone skill invocations would bypass it. Not sufficient as the primary mechanism.

### Option E — Stop hook that audits framing claims after the fact

A Stop hook that scans outputs from the session and flags framing claims for which no primary-source Read is evidenced in the transcript.

**Verdict:** Too late. The claim is already made; a hook that fires at session end is an audit log, not enforcement. Useful as a secondary check.

## 4. Recommendation

**A layered approach: C (primary enforcement) + A (supporting rule) + E (audit).**

### 4.1 Layer 1 — Reading-notes contract (PreToolUse hook)

Create `.claude/hooks/primary-source-check.py`. On PreToolUse for `Write|Edit` tools, the hook:

1. **Fast path:** if the target file path does not match the enforceable patterns, exit 0 immediately.

   Enforceable patterns (project-specific):
   - `experiments/designs/decisions/*.md`
   - `bdm_bic_paper/paper/main.tex`
   - `quality_reports/advisor_meeting_*/*.tex`
   - `quality_reports/advisor_meeting_*/*.md`
   - `quality_reports/session_logs/*.md`
   - `quality_reports/*_analysis.md`
   - `quality_reports/plans/*.md`

2. **Extract the delta.** For `Edit`, the delta is `new_string`. For `Write`, the delta is the full content.

3. **Detect citation patterns.** Regex for Author-YYYY patterns: `\b[A-Z][a-z]+(?:\s+(?:and|&|,)\s+[A-Z][a-z]+)?(?:\s+et\s+al\.?)?\s+\(?(19|20)\d{2}[a-z]?\)?`. Plus a project-specific surname allowlist (Chakraborty, Kendall, Danz, Vesterlund, Wilson, Brown, Healy, Karni, Azrieli, Tsakas, Snowberg, Yariv, Niederle, Burfurd, Wilkening, Holt, Smith, Hao, Houser, Li, Troyan, Segal).

4. **For each detected citation** (e.g., "Chakraborty and Kendall 2025"):
   - Compute a citation stem by lowercasing and concatenating surnames with the year: `chakraborty_kendall_2025`.
   - Check whether a reading-notes file exists matching the stem: `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` (or any file starting with `chakraborty_kendall_2025`).
   - Check whether a PDF exists matching the stem in `master_supporting_docs/literature/papers/`.

5. **Decision logic:**
   - If reading-notes file exists → allow (it has been read, notes persist across sessions).
   - If no reading-notes file AND no PDF → allow (paper not in repo yet; cannot enforce reading something that's not there; flag as a warning for later).
   - If no reading-notes file AND PDF exists → **BLOCK** with message:
     > Claim references [citation] but no reading-notes file exists at `master_supporting_docs/literature/reading_notes/[stem].md`. The primary source is at `master_supporting_docs/literature/papers/[pdf]`. Read it (use the `pdf-learnings` skill for token efficiency) and produce a notes file before making this claim.

6. **Escape hatch.** Respect an override comment that I include in the new content: `<!-- primary-source-ok: citation1, citation2 -->`. This lets me intentionally acknowledge "I'm editing around this citation without making a new framing claim about it." The hook reads these and skips those citations for the current call. Abuse of the escape hatch is auditable via grep.

### 4.2 Layer 2 — Project rule file

Create `.claude/rules/primary-source-first.md`. Short — the substantive content is enforced by the hook; the rule file explains the principle, the reading-notes contract, and how to use the escape hatch. Adds rule to the context so worker and critic agents know the norm.

### 4.3 Layer 3 — Audit (Stop hook extension or standalone skill)

Add a lightweight audit to the existing Stop hook or as a new skill `/audit-sources`:

- Scan the session transcript for the Author-YYYY patterns Claude emitted.
- Cross-reference against files Read in the session and against `reading_notes/` files.
- Produce a short report: "Session cited: [N] papers. [M] had reading-notes evidence. [K] did not."
- Append to session log.

This doesn't block — it leaves a paper trail so the blocking hook's false-negatives (e.g., claims in prose that don't go to tool calls) are visible after the fact.

### 4.4 Reading-notes file format (standard)

To make Layer 1 work, reading-notes files need a minimal required structure. Propose `master_supporting_docs/literature/reading_notes/README.md` specifying:

```markdown
---
citation: [Full citation]
bibtex_key: [key]
primary_source: [relative path to PDF]
date_read: YYYY-MM-DD
reader: [human or Claude]
---

## Claims this paper makes
- ...

## Definitions I should cite verbatim
- ...

## What this paper is NOT claiming (common misreadings)
- ...

## Passages worth quoting
- ...
```

The "What this paper is NOT claiming" section is specifically designed to catch the UJS-style failure mode: the derivative misreading ("UJS is a formal property distinct from CR") would be explicitly ruled out in the notes file.

## 5. What this does NOT fix

- **Claims in prose, not tool calls.** If Claude says "UJS is a formal property distinct from CR" in chat text without Writing or Editing anything, the PreToolUse hook doesn't fire. Layer 3 (audit) catches this after the fact but doesn't block in real time. This is a limitation of the hook model; live-text interception isn't possible.
- **Claims that cite a paper not in the repo.** If Claude cites a paper that has never been added to `literature/papers/`, the hook allows it. Solution: a separate process for ingesting new papers. Out of scope for this proposal.
- **Wrong claims with reading-notes in place.** If a reading-notes file itself is wrong, the hook allows claims that propagate the wrong notes. Partial mitigation: require that reading-notes files be produced by actually reading the PDF (use `pdf-learnings` skill), which creates a direct audit trail.

## 6. Recommended implementation order

1. **Write the rule file** (`.claude/rules/primary-source-first.md`) — 5 minutes.
2. **Write the hook** (`.claude/hooks/primary-source-check.py`) with the enforceable file patterns and the Author-YYYY regex — 30–45 minutes.
3. **Write the reading-notes README** (`master_supporting_docs/literature/reading_notes/README.md`) with the template — 10 minutes.
4. **Backfill** reading-notes files for the project's load-bearing papers:
   - Chakraborty & Kendall (2025)
   - Danz, Vesterlund & Wilson (2022 AER, 2024 JEP)
   - Brown & Healy (2018)
   - Azrieli, Chambers & Healy (2018)
   - Karni (2009)
   - Tsakas (2019)
   - Any others Christina flags as load-bearing.

   Use the `pdf-learnings` skill for each. 20–40 minutes per paper; can be parallelized and/or deferred.

5. **Register the hook** in `.claude/settings.json`.

6. **Test** by attempting an edit that references a paper without a reading-notes file. Verify it blocks.

7. **Ship** the rule, hook, and README as one commit. Backfill reading-notes as separate commits.

## 7. Cost / benefit

**Cost:** ~1–2 hours to implement rule + hook + README. Plus ongoing reading-notes production (which is work that produces a useful artifact on its own).

**Benefit:** Deterministic prevention of the UJS-class failure. Forces primary-source contact before framing claims. Produces reading-notes artifacts that persist across sessions and serve as verifiable evidence of paper familiarity. Catches the issue *before* the claim enters a load-bearing doc, not after.

## 8. Alternative proposal you might prefer

If the layered approach is heavier than you want right now, the minimal viable version is:

- **Layer 2 (rule file) only** for the meeting-prep window.
- **Implement Layer 1 (hook) after the meeting.**
- Backfill reading-notes incrementally.

This gets the principle stated immediately without spending implementation time this week.

## 9. Ask

Choose:

1. **Full layered implementation** (recommended). I'll build Layer 1 + Layer 2 + Layer 3 + the reading-notes README now. Start backfilling notes for C&K 2025 tonight so tomorrow's meeting has a verified reference.
2. **Minimal now, full later.** Just Layer 2 (rule file) now, defer the hook and audit. Backfill C&K 2025 notes only, for tomorrow's meeting.
3. **Different scope.** You have a different take — tell me what.

I lean toward (1). The hook is the piece that actually makes this enforceable, and it's not that much harder than a rule file. But (2) is defensible if you want to keep the meeting prep time clear.
