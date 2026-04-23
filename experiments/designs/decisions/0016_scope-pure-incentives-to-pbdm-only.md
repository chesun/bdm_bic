# 0016: Scope the pure-incentives test to p-BDM only; MPL-side pure-incentives test is future work

- **Date:** 2026-04-22
- **Status:** Decided
- **Scope:** Experimental design
- **Data quality:** Full context

## Context

ADR-0011 (2026-04-14) committed to designing a p-BDM pure-incentives test from scratch, and listed "MPL counterpart" as an open design dimension ("run an incentive-only test for the MPL mechanism too? This is potentially the most novel contribution if DVW's WP does not already include it.").

The 2026-04-17 design-space synthesis (`quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md`) fleshed this out as "Proposal C: Parallel BDM + MPL incentive-only test" — a between-subject design with N = 600 that would test both mechanisms under pure-incentives conditions in parallel. The synthesis doc framed C as "the most novel contribution" because the MPL pure-incentives result is absent from DVW 2024 JEP.

On 2026-04-22, Christina reviewed the advisor-meeting deck (frames 10, 11, 12 of `04_slides.tex`) and concluded that Proposal C is out of scope for this project. Reasoning:

- The paper's central contribution is a behavioral incentive compatibility (BIC) test of **p-BDM**. The BIC framework as summarized by Danz, Vesterlund & Wilson (2024) in the *JEP* review distinguishes two direct-test types — an info/no-info test and an incentives-only test — each of which is needed to establish BIC failure for a given mechanism.
- Running a pure-incentives test for MPL without its matching info/no-info test produces an isolated data point about MPL, not a BIC test of MPL. A full BIC test for MPL is a separate study — distinct hypotheses, distinct arm structure, distinct sample.
- The H2 claim "MPL achieves better behavioral IC than single-report BDM" is tested at the belief-elicitation level by the main experiment (T1 vs. T2 in the design table). It does not require a pure-incentives comparison at the H1b level to be identifiable.
- Sample-size and logistics savings: N drops from 600 (with C) to 300 (with A or B). One set of instructions rather than two.

## Decision

**Scope the pure-incentives test to p-BDM only.** Keep Proposals A and B on the table as alternatives (strict DVW-replication A; native-framing B). Drop Proposal C (parallel BDM + MPL pure-incentives test) from the current design space.

Implications:

- The advisor meeting's Q2 becomes "A, B, or both within-subject" rather than "A, B, or C."
- The H1b pure-incentives test serves only the p-BDM BIC diagnosis; it does not double as an H2-style comparison at the pure-incentives layer.
- The question of whether MPL subjects can identify the uniquely justifiable action in a pure-incentives setting — which would require a dedicated info/no-info and pure-incentives arm structure for MPL — is noted as potential future work.

## Consequences

- **Commits us to:** an advisor-meeting question frame with two proposals (A, B) plus the option to run both. The "MPL pure-incentives rate" prediction is no longer part of this study's identification.
- **Commits us to:** removing the former Frame 10 ("Proposal C: Example at θ = 0.2, MPL side") and rewriting the summary table and Question 2 frames in `04_slides.tex`. Edits applied 2026-04-22.
- **Opens (as future work):** a dedicated MPL BIC study with its own info/no-info arm, its own pure-incentives arm, and a sample appropriate to detect an MPL BIC failure. Sample-size and design questions for that study are not resolved here.
- **Preserves from ADR-0011:** the p-BDM pure-incentives test remains a committed element of the current design (H1b), designed from scratch because the methodology for the DVW p-BDM pure-incentives test is not public.
- **Does NOT supersede ADR-0011.** ADR-0011 left the MPL counterpart open; this ADR resolves that dimension by scoping it out of the current study. No prior ADR committed to running Proposal C.
- **Preserves the H2 test.** H2 is tested at the belief-elicitation level (T1 Single-report BDM vs. T2 Belief MPL in the main design). Dropping Proposal C does not weaken H2's identification.

## Sources

- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` :: §4 Proposal C (retired as the recommended design for this study; preserved as a reference for the future-work MPL BIC study).
- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` :: frames 10–12 edited 2026-04-22 to reflect the scoping decision (former Frame 10 removed; Frame 11 retitled "Two ways to run the test"; Frame 12 retitled "Question 2: A, B, or both?").
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` :: records this decision.
- ADR-0011 (MPL counterpart listed as open design dimension; resolved by scoping out).
- `master_supporting_docs/literature/reading_notes/bdm_bic_2026-03.md#1` — notes on Danz, Vesterlund & Wilson (2024, *JEP*): BIC framework summary, info/no-info and incentives-only test distinction.
- Discussion: 2026-04-22 with Christina — "we are doing BIC test for p-BDM, not MPL."
