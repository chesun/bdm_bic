# Primary-Source-First

**Scope (file-level):** `experiments/designs/decisions/**`, `bdm_bic_paper/paper/**`, `quality_reports/advisor_meeting_*/**`, `quality_reports/session_logs/**`, `quality_reports/plans/**`, `quality_reports/*_analysis.md`
**Scope (prose):** all assistant conversation text in the session
**Enforcement:**
- `.claude/hooks/primary-source-check.py` (PreToolUse, Edit|Write) — blocks edits to scoped files
- `.claude/hooks/primary-source-audit.py` (Stop) — blocks turn-end when session prose makes un-grounded claims

Before making a framing claim about an external paper — in a file edit OR in conversation text — consult the primary source. Derivative docs and paraphrases lose precision; downstream claims propagate the error silently.

## Three enforced failure modes

1. **Notes don't exist AND the PDF is in the repo.** Blocks with "read the PDF, write notes." The remediation is to use the `pdf-learnings` skill on long papers or the `Read` tool with `pages=` on short ones, then produce a notes file per `master_supporting_docs/literature/reading_notes/README.md`.

2. **Notes don't exist AND the PDF is NOT in the repo.** Blocks with "add the PDF first." A citation you cannot ground in a primary source does not belong in a load-bearing artifact. The remediation is to add the PDF to `master_supporting_docs/literature/papers/` (naming it with the surname-year convention so the hook can find it), then produce notes.

3. **Notes exist but were not touched in this session.** Blocks with "Read the notes file before citing." This is the guard against working from cached context. Touching (Read / Write / Edit) a notes file in the current session is the evidence; a prior session's Read does not persist — sessions are fresh contexts.

## Where the two hooks apply

- **PreToolUse hook** — scans the *delta* (new_string for Edit, content for Write) of every Edit/Write to a scoped file path. Fires on each tool call; blocks the call.
- **Stop hook** — scans *all assistant prose* in the session transcript at turn-end. Fires on Stop; blocks the turn-end. Catches claims made in conversation that never went to a tool call. Respects `stop_hook_active` to avoid loops (blocks at most once per turn).

Both hooks share citation-detection and notes-verification logic in `.claude/hooks/primary_source_lib.py`.

## What counts as a reading-notes file

Either form is accepted by the hook:

1. A **per-paper file** named with the citation stem: `chakraborty_kendall_2025.md`, `danz_vesterlund_wilson_2024.md`, etc.
2. A **section inside a compiled reading-notes file** that includes a `**Citation:** ...` metadata line naming the paper's authors and year. Existing `bdm_bic_2026-03.md` uses this form — each paper has a section header *and* a citation-metadata line; the hook matches on the citation line specifically.

Per-paper files are preferred for load-bearing references. Compiled files are acceptable for batch reading sprints.

**Why citation-line-only (not section-header) matching:** documents like the reading-notes README or conceptual memos may mention a paper in a header without being notes about it. The `**Citation:** Author (Year)...` line is the reliable signal that "this section is reading notes for this paper."

## Required sections in a reading-notes file

The `README.md` template specifies the canonical structure. The load-bearing section for preventing the UJS-class failure is:

> **What this paper is NOT claiming (common misreadings)**

Use this section to head off future conflation errors. For UJS specifically: "UJS is not a formal mechanism property independent of contingent reasoning — it is a formalization of CR via the set of CR paths that can justify each action."

## Escape hatch

If you need to cite a paper *without* making a new framing claim (e.g., fixing a typo in an existing sentence that happens to cite the paper; referring to a paper as a test case or example without claiming anything about its content), include an override comment:

```
<!-- primary-source-ok: chakraborty_kendall_2025, danz_vesterlund_wilson_2024 -->
```

- For PreToolUse (file edits): include the comment in the delta.
- For the Stop audit (conversation prose): include the comment in the same assistant message as the citation.

The comment only applies to the scope where it appears — it is not session-wide. Abuse is auditable: `grep -R "primary-source-ok" master_supporting_docs/ quality_reports/ bdm_bic_paper/` surfaces every use.

## Why this exists

2026-04-22: Claude propagated "UJS is a formal property distinct from CR" through ADR-0013, the 2026-04-20 identification analysis, the 2026-04-22 slide review, and multiple session logs — without ever opening `Chakraborty_Kendall_2025_UJS_elicitation.pdf`, which has sat in `master_supporting_docs/literature/papers/` the whole time. C&K define UJS *via* contingent reasoning ("a novel approach to eliminating the need for contingent reasoning"); the "independent property" framing came from derivative docs. The rule exists to make this failure mode deterministically catchable.

## Intended behavior

When content cites a paper — whether in a file edit or in conversation prose — the hooks either:

- Allow (notes exist AND were consulted this session).
- Block with a clear remediation path: read the PDF (or add it first if missing), produce notes, touch the notes file in this session, re-run.

The rule is not a suggestion. It fires deterministically. The only way through without notes is the escape hatch, which is auditable.

## Why this exists (expanded)

On 2026-04-22, Claude propagated the claim "UJS is a formal property distinct from contingent reasoning" through ADR-0013, a session log, the 2026-04-20 identification analysis, and the 2026-04-22 slide review — never opening `Chakraborty_Kendall_2025_UJS_elicitation.pdf` despite it being in the repo, and never opening the existing compiled reading notes at `bdm_bic_2026-03.md#9` despite those notes having the framing correct. The error originated in a paraphrase and got amplified across four docs. The three failure modes above — missing notes with PDF present, missing notes with no PDF, and existing notes not consulted in-session — are each paths the original failure could have been caught; the hooks make all three deterministically blocking.
