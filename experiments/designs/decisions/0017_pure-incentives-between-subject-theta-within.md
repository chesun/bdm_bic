# 0017: Pure-incentives test is between-subject (separate arm); θ variation is within-subject; θ values left open

- **Date:** 2026-04-22
- **Status:** Decided
- **Scope:** Experimental design
- **Data quality:** Full context

## Context

ADR-0011 (2026-04-14) committed to designing a p-BDM pure-incentives test from scratch and listed "Integration with main arm" and "Induced-θ values" as open dimensions. The 2026-04-17 design-space synthesis proposed within-subject integration with the main BDM arm (Proposal A: "immediately after main BDM"; Proposal B: "before main BDM") and within-subject variation across θ ∈ {0.2, 0.4, 0.6, 0.8}. These were working assumptions, not committed decisions.

On 2026-04-22, Christina asked whether DVW 2022 ran their incentives-only test within- or between-subject with the main belief-elicitation treatments. Reading the DVW 2022 Online Appendix §C.4 (pp. 45–48) directly:

- The incentives-only module was attached to a *separate* study (a public-good provision study), **not** to the main BSR belief-elicitation study. Quote (p. 45): "These instructions were attached as module following a strategic study of public-good provision with two previous tasks."
- Within the module itself, each subject made **two** choices at **two** θ values (0.3 and 0.2), with one randomly selected for payment.

So DVW's incentives-only test was between-subject relative to their main belief-elicitation study and within-subject across two θ values.

Our Proposal A's current description ("within-subject, immediately after main BDM arm") was therefore a departure from strict DVW replication, not a replication.

## Decision

The p-BDM pure-incentives test is structured as:

1. **Between-subject relative to the main BDM/MPL arms.** The pure-incentives test uses a separate subject sample, recruited independently from the main belief-elicitation experiment. Subjects in the pure-incentives arm do not complete the main BDM or MPL tasks. This matches DVW 2022's methodology and preserves a clean comparison to their headline results.

2. **Within-subject variation across θ.** Each pure-incentives subject sees multiple θ values within the module. This preserves statistical power across θ and enables a within-subject test of whether the failure pattern (event-independent option preference) is θ-invariant — a sharper identification than a between-θ design.

3. **θ values are left as an open design decision.** Candidate sets discussed:
   - Two values {0.2, 0.3}, matching strict DVW 2022 replication.
   - Four values {0.2, 0.4, 0.6, 0.8}, matching Burfurd & Wilkening (2018).
   - Other sets to discuss with Anujit.
   The θ set affects burden, power, and the θ-pattern discrimination of UJS vs. ambiguity aversion accounts (sharper with more θ values; simpler replication with two). This is a remaining open design question for the advisor meeting or follow-up, not resolved here.

This applies to Proposals A and B (the two remaining proposals after ADR-0016 scoped out Proposal C).

## Consequences

- **Commits us to:** a separate sample for the pure-incentives arm. Budget implications: the pure-incentives arm does not double-dip on the main-arm budget; N for this arm is additive. Current working number is 300 per proposal.
- **Commits us to:** instructions and comprehension checks that stand alone (not appended to the main BDM or MPL instructions). Since subjects have not seen the main BDM arm, the instructions introduce the menu-choice task as a standalone decision, following DVW 2022's template (see `master_supporting_docs/literature/reading_notes/danz_vesterlund_wilson_2022.md`, §C.4 verbatim).
- **Preserves from DVW 2022:** the between-subject-relative-to-main structure and the within-subject θ variation. Makes our design directly comparable to DVW's headline finding.
- **Rules out:** within-subject integration of pure-incentives with main BDM/MPL for the *same* subjects. That design would confound the incentives-only test with prior exposure to the mechanism.
- **Rules out:** an A-vs-B between-subject mechanism arm structure that also happened to share subjects with the main experiment.
- **Leaves open:** exact θ values (see Decision item 3), A-vs-B choice (per ADR-0016's "A, B, or both within-subject" framing; decision sought from Anujit).
- **Updates ADR-0011:** resolves two of ADR-0011's open dimensions (Integration: between-subject; θ variation: within-subject). Does not supersede ADR-0011; ADR-0011 still covers the "design from scratch" commitment and the remaining open dimensions (menu structure — settled as 11-option discrete per DVW; payoff display — A vs. B choice open; MPL counterpart — resolved by ADR-0016).
- **Deck edit applied (2026-04-22):** `04_slides.tex` Frame 11 ("Two ways to run the test") updated — "Arm: separate (between-subject)" and "θ variation: within-subject; values TBD" replace the earlier "Integration: within-subject" and "{0.2, 0.4, 0.6, 0.8}" rows.

## Sources

- `master_supporting_docs/literature/reading_notes/danz_vesterlund_wilson_2022.md` — reading notes including verbatim instructions from DVW 2022 Online Appendix §C.4 (integration statement, p. 45; Decision Task 3 Choices 1 and 2, pp. 46–47).
- `master_supporting_docs/literature/papers/Danz_Vesterlund_Wilson_BSR_Online_Appendix.pdf` (pp. 45–48) — primary source consulted 2026-04-22.
- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` §4 (Proposal A and B integration claims — superseded by this ADR; §5.2–§5.3 screen mockups remain valid).
- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` Frame 11 — reflects this decision.
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` — records the discussion.
- ADR-0011 — resolves integration and θ-variation dimensions; leaves θ-set and A-vs-B open.
- Discussion: 2026-04-22 with Christina — "between subject for the treatment but within subject variation of theta values. leave the exact choice of theta values as an open design decision."
