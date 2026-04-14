# Session Report — BDM Incentive Compatibility

## 2026-04-13 22:00 — MPL Format Decision Analysis

**Operations:**

- Created `quality_reports/mpl_format_decision_analysis.md` — 13 sections on format trilemma, multi-switching, B&H transfer, acts-vs-outcomes foundation, accuracy metrics, format options, decision criteria
- Added new Section 3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" mid-session; renumbered all downstream sections and internal cross-references
- Updated `TODO.md` with MPL format decision as new active item; added Condition 2 operationalization to Up Next
- Created `quality_reports/session_logs/2026-04-13_mpl-format-decision.md`

**Decisions:**

- Tentative format: coarse separated (15-20 rows, random order) — preserves monotonicity per Brown & Healy; burden tolerable; 5pp precision sufficient for BIC test
- Tentative accuracy metric: M3 hybrid with success rate as primary; multi-switchers coded as failures symmetric to BDM subjects who report far from π
- Correct identification of B&H's IA: mechanism invariance (not reduction of compound lotteries). Reduction is a mechanism, not an assumption

**Results:**

- Points 2 and 3 of April 7 decision list now have a dedicated analysis document
- New problem surfaced and addressed: multi-switching in separated-format MPL threatens H2 interpretability
- Conceptual foundation (acts vs. outcomes, mechanism invariance, strategy-space restriction) documented for downstream design defense

**Commits:** None this session — session is in-progress drafting.

**Status:**

- Done: Analysis doc with acts-vs-outcomes foundation; session log; TODO update
- Pending: Christina reviews Section 10 of analysis doc and commits to seven decision criteria; Condition 2 operationalization (Point 6); CS Comments for papers 3, 4, 5, 7, 9, 11, 12
