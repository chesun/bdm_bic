# Session Log: 2026-04-13 — MPL Format Decision Analysis

**Status:** COMPLETED

## Objective

Resume from April 8 session. Unblock Points 2 and 3 of the April 7 research direction discussion (MPL format choice, Brown & Healy monotonicity transfer). Produce a deeper analysis document capturing the trilemma, the multi-switching problem, and the conceptual foundation behind the format decision.

## Changes Made

| File | Change | Reason | Quality Score |
|------|--------|--------|---|
| `quality_reports/mpl_format_decision_analysis.md` | Created. 13 sections covering stakes, trilemma, acts-vs-outcomes foundation, multi-switching, accuracy metrics, B&H transfer, format options, auxiliary experiment, paper commitments, decision criteria, tentative recommendation, open items, cross-references. | Point 2/3 of April 7 discussion were open; surfaced new multi-switching problem; needed conceptual foundation for downstream decisions. | N/A (draft) |
| `TODO.md` | Added MPL format decision as active item; added Condition 2 operationalization (Point 6) to Up Next. | Reflect current state of the decision stack. | N/A |

## Design Decisions

| Decision | Alternatives Considered | Rationale |
|----------|------------------------|-----------|
| Tentative format: coarse separated (15-20 rows) | Full list, Holt & Smith LC, Burfurd & Wilkening titration, full separated (100 rows), hybrid with revise screen, two-stage separated | Preserves monotonicity per Brown & Healy; burden tolerable; 5pp precision sufficient for BIC test (no point-belief recovery needed). |
| Tentative accuracy metric: M3 (hybrid) with success rate as primary | M1 (distance, condition on success) and M2 (binary, multi-switch = failure) | M3 is most defensible against selection-on-success objection; M2-style primary codes multi-switchers symmetrically to BDM failures. |
| Mechanism invariance as the correct framing for B&H's IA | Earlier (mistaken) claim that violation "boils down to ROCL" | Reduction is one route to violation, not the IA. Mechanism invariance is the actual B&H assumption; the test is robust to why monotonicity fails. |

## Incremental Work Log

- Session resumption: read last session log, TODO, April 7 discussion doc. Summarized state of 7-point decision list.
- Christina flagged concern: separated-format multi-switching may break data interpretability (threatens H2).
- Drafted `mpl_format_decision_analysis.md` in initial form (12 sections).
- Christina questioned "MPL multi-switching = evidence for H3" claim. Conceded point: multi-switching in MPL threatens H2, does not support H3.
- Extended discussion: B&H's identifying assumption. Christina observed reduction is not in B&H's IA section. Clarified: IA is mechanism invariance; reduction is a candidate mechanism for the violation, not an assumption.
- Christina asked: if mechanism invariance holds, how can row-14 choice differ across mechanisms? Produced concrete explainer with ambiguity-aversion example showing acts vs. outcomes distinction.
- Added new Section 3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" to the analysis doc. Renumbered downstream sections 3-12 → 4-13 with all cross-references updated.

## Learnings & Corrections

- [LEARN:theory] Brown & Healy's IA is *mechanism invariance* (the mechanism itself does not alter outcome-preferences), not reduction of compound lotteries. Reduction is one of several preference-level routes to monotonicity violation; the test is robust to which route operates.
- [LEARN:theory] The acts-vs-outcomes distinction is load-bearing for defending any separated-format design. Mechanism invariance pins down outcome-preferences; monotonicity is a restriction on how act-preferences relate to outcome-preferences. Non-monotone subjects can have stable outcome-preferences and still make different row-14 choices under RPS vs. Framed Control because the decision problem differs.
- [LEARN:design] Separated format does not alter subjects' preferences — it restricts the strategy space so non-monotone preferences cannot be expressed. This is the design principle behind the format recommendation.
- [LEARN:correction] Earlier framing "multi-switching in MPL supports H3" was wrong. Multi-switching in MPL threatens H2 (MPL > BDM); H3 is about contingent reasoning failure in BDM specifically.

## Verification Results

| Check | Result | Status |
|-------|--------|--------|
| `mpl_format_decision_analysis.md` sections renumber cleanly (3→4, ..., 12→13) | All internal cross-references updated (Section 4→5, 9→10; 6.6→7.6; 6.7→7.7; Section 7→8) | PASS |
| TODO.md reflects current decision stack | Active = MPL format decision; Up Next = Condition 2 operationalization | PASS |

## Open Questions / Blockers

- [ ] Section 10 of analysis doc: seven decision criteria needing Christina's commitment (multi-switching tolerance, accuracy metric, ε, B&H auxiliary, revise screen, burden budget, precision)
- [ ] Pilot coarse separated format before committing?
- [ ] Condition 2 operationalization for BDM (Point 6 of April 7 discussion) — still unresolved

## Next Steps

- [ ] Christina reviews `mpl_format_decision_analysis.md` and commits to Section 10 criteria
- [ ] Revisit Condition 2 operationalization for BDM (options A-E in April 7 discussion doc)
- [ ] CS Comments for papers 3, 4, 5, 7, 9, 11, 12
- [ ] Pressure-test research directions via `/discover interview`
