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

## 2026-04-14 — MPL Format Decision (continued)

**Operations:**

- Section 2 trilemma table restructured — split into 4 format columns, separated cognitive vs. navigation burden
- Section 7.2 and 7.7 renamed for LIST/SEPARATED legibility; Section 7.3 updated to credit Trautmann & van de Kuilen (2015, *EJ*) as TK origin; new Section 7.8 added on HH instruction format (B&W 2018)
- Section 10 criteria 1-3 resolved (multi-switching as descriptive outcome, accuracy metric subsumed by criterion 1, Danz 2022 dual-metric ε adopted)
- Section 4 reframed ("Descriptive Outcome, Not a Threat"); Section 11 tentative recommendation cleaned up
- New Section 12 added: "Related Design Note: p-BDM Incentive-Only Test" — records JEP 2024 content gap, design questions for our own version
- Azrieli et al. definitional clarification on monotonicity (≽ on X → ≽* on P(X); acts framing is correct in their setup)
- Deep web search for DVW's forthcoming "Pure-Incentives Test" paper — confirmed not publicly available; email to Danz drafted and scheduled for 2026-04-15
- TODO updated: p-BDM incentive-only test design added as Up Next (subsumes Point 6 of April 7 discussion)

**Decisions:**

- Criterion 1 (multi-switching): report as descriptive outcome, not invalidation threshold. Follow Chakraborty & Kendall 2025 precedent (29.7% / 43.7% benchmarks)
- Criterion 2 (accuracy metric): subsumed by criterion 1 framing. Compare on % within ε margin. Asymmetry between MPL (3-way) and BDM (2-way + focal diagnostic) handled explicitly
- Criterion 3 (ε): Danz 2022 dual metric — false reports (ε = 0) and distant reports (ε = 5pp) in parallel
- Instruction format: use HH-style (Hao-Houser "chips-in-a-bag") regardless of presentation format
- Framing throughout: separated format preserves monotonicity by restricting strategy space, not preferences

**Results:**

- Analysis doc now 14 sections, internally consistent, with new p-BDM incentive-only test section as bridge to separate design work
- Three of seven Section 10 criteria locked in
- Email drafted and scheduled for Danz 2026-04-15

**Commits:** (pending end-of-session commit)

**Status:**

- Done: Section 10 criteria 1-3 resolved; p-BDM incentive-only test gap flagged; Danz email drafted
- Pending: Section 10 criteria 4-7 (B&H auxiliary, revise screen, burden budget, precision); p-BDM incentive-only test design work (new); Danz email reply; TvdK 2015 read; CS Comments backlog
