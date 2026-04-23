# Primary-Source-First

**Scope:** `experiments/designs/decisions/**`, `bdm_bic_paper/paper/**`, `quality_reports/advisor_meeting_*/**`, `quality_reports/session_logs/**`, `quality_reports/plans/**`, `quality_reports/*_analysis.md`
**Enforcement:** PreToolUse hook at `.claude/hooks/primary-source-check.py` (blocks Edit/Write)

Before making a framing claim about an external paper in any of the scoped files, read the primary source. Derivative docs (ADRs, session logs, analysis memos, other reading notes) can compress or misstate the original — downstream claims then propagate the error silently.

## Mechanism

A PreToolUse hook watches Edit/Write to the scoped file patterns. It scans the delta (the new content being written) for Author–Year citation patterns. For each citation:

- If a reading-notes file exists for the paper in `master_supporting_docs/literature/reading_notes/` → allow.
- If no reading-notes file AND the PDF is NOT in `master_supporting_docs/literature/papers/` → allow (paper not yet in the repo; nothing to enforce).
- If no reading-notes file AND the PDF IS in `master_supporting_docs/literature/papers/` → **block**.

The remediation on a block: open the PDF (use the `pdf-learnings` skill for token-efficient extraction on long papers), produce a notes file following the template in `master_supporting_docs/literature/reading_notes/README.md`, then re-run the edit.

## What counts as a reading-notes file

Either form is accepted by the hook:

1. A **per-paper file** named with the citation stem: `chakraborty_kendall_2025.md`, `danz_vesterlund_wilson_2024.md`, etc.
2. A **section inside a compiled reading-notes file** where a line matches the paper's author–year pattern (existing `bdm_bic_2026-03.md` uses this form with `## N. Author Year — Title` headers).

Per-paper files are preferred for load-bearing references. Compiled files are acceptable for batch reading sprints.

## Required sections in a reading-notes file

The `README.md` template specifies the canonical structure. The load-bearing section for preventing the UJS-class failure is:

> **What this paper is NOT claiming (common misreadings)**

Use this section to head off future conflation errors. For UJS specifically: "UJS is not a formal mechanism property independent of contingent reasoning — it is a formalization of CR via the set of CR paths that can justify each action."

## Escape hatch

If you need to edit a file that references a cited paper *without* making a new framing claim (e.g., fixing a typo in an existing sentence that happens to cite the paper), include an override in the delta:

```
<!-- primary-source-ok: chakraborty_kendall_2025, danz_vesterlund_wilson_2024 -->
```

The hook parses this comment and skips the named citation stems for this call only. Abuse is auditable: grep `master_supporting_docs/` and `quality_reports/` for `primary-source-ok` to see where the hatch has been used.

## Why this exists

2026-04-22: Claude propagated "UJS is a formal property distinct from CR" through ADR-0013, the 2026-04-20 identification analysis, the 2026-04-22 slide review, and multiple session logs — without ever opening `Chakraborty_Kendall_2025_UJS_elicitation.pdf`, which has sat in `master_supporting_docs/literature/papers/` the whole time. C&K define UJS *via* contingent reasoning ("a novel approach to eliminating the need for contingent reasoning"); the "independent property" framing came from derivative docs. The rule exists to make this failure mode deterministically catchable.

## Intended behavior

When I am about to write or edit content in a scoped file and the content makes a claim about a cited paper, the hook either:

- Allows the edit (reading notes exist; paper has been engaged with).
- Blocks the edit with a clear remediation path (read the PDF, produce notes, re-run).

The rule is not a suggestion. It fires on the tool call; the only way through without notes is the escape hatch, which is auditable.
