# 0011: p-BDM incentive-only test — design from scratch (DVW methodology not public)

- **Date:** 2026-04-14
- **Status:** Proposed
- **Data quality:** Reconstructed — partial context

> **Reconstructed — partial context.** The decision to design our own version is firmly sourced. The specific menu structure, payoff display, induced-θ values, integration approach, and sample size remain as explicit open design questions in `mpl_format_decision_analysis.md` §12.3. This ADR captures the commitment to design from scratch; the actual design decisions will each get their own ADRs as they are made.

## Context

Danz, Vesterlund & Wilson (2024, *JEP*) describe the incentives-only methodology *in detail for the Binarized Scoring Rule*. Table 1 (p. 145) shows an 11-option menu (A–K) corresponding to implied reports q ∈ {0.0, 0.1, …, 1.0}, each displayed as a pair of event-contingent winning probabilities. Subjects pick an option; the implied-q column is hidden. For induced belief θ, the maximizer is the option with q = θ.

For the **p-BDM**, the JEP reports only two substantive sentences (pp. 148–149):

1. "Danz, Vesterlund, and Wilson (2024) show in an incentives-only test of the probabilistic Becker-DeGroot-Marschak mechanism that the vast majority of participants prefer choices that differ from the intended maximizer, indeed 69 percent of participants opt for the event-independent choice corresponding to reporting q = 0.0."
2. At induced θ = 0.2: no-info treatment has 7% of reports that are both distant and toward zero; info treatment has 21%.

The full methodology for the p-BDM incentive-only test — menu structure, payoff display, induced-θ values beyond 0.2, sample details — is **not** in the JEP. The underlying working paper ("The Pure-Incentives Test: Applications to Proper Scoring Rules, Auctions, and Matching Markets") is listed on David Danz's website in "Work in Progress" with no draft attached and no public URL (verified via deep search across authors' pages, SSRN, NBER, RePEc, and citation trails on 2026-04-14).

The 69% result is the direct analog of DVW 2022's center-bias finding for BSR. Under both mechanisms, subjects prefer the option whose winning probability is *event-independent*: q = 0.5 (centered) for BSR, q = 0.0 (extreme) for p-BDM. The failure mechanism is the same but manifests at opposite ends of the report space. This points to a more fundamental pattern — preference for event-independent payoffs per se — rather than mechanism-specific "center bias" or "extremeness aversion."

## Decision

Because DVW's p-BDM incentive-only methodology is not publicly available, **design our own p-BDM incentive-only test from scratch**. This is H1b of the current hypothesis structure (see ADR-0006 for the operationalization decision on Options A/D) — a parallel but distinct part of the project from the MPL format decision.

## Consequences

- **Commits us to:** a dedicated design task with its own open questions (recorded in `mpl_format_decision_analysis.md` §12.3):
    - Menu structure — discrete (11 options à la BSR Table 1) vs. continuous (slider)?
    - Payoff display — event-contingent winning-probability pairs (Table 1 style) vs. p-BDM's native lottery structure (event bet vs. r-lottery)?
    - Induced-θ values — DVW reports only θ = 0.2; covering 0.2 / 0.4 / 0.6 / 0.8 (matching B&W 2018) is a natural extension.
    - Integration — within-subject with main BDM arm, or between-subject?
    - MPL counterpart — run an incentive-only test for the MPL mechanism too? This is potentially the most novel contribution if DVW's WP does not already include it.
    - Sample size — anchor on DVW's 69% at θ = 0.2.
- **Opens:** each resolved design question above will get its own ADR as it is made.
- **External dependency:** email to David Danz was scheduled for 2026-04-15 requesting the working-paper draft; regardless of reply, designing our own is the committed path.
- **Rules out:** waiting indefinitely for DVW's working paper to circulate before doing our own design work. The "why" question (ADR-0001) remains open regardless of what DVW's WP contains.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §12 "Related Design Note: p-BDM Incentive-Only Test" (lines 395–430), especially §12.3 "What Our Project Needs to Design"
- `quality_reports/session_logs/2026-04-14_mpl-format-decision-continued.md` :: Incremental Work Log and Next Steps
- Danz, Vesterlund & Wilson (2024, *JEP* 38(4), pp. 144–149)
- Git commit: `66f2f43` ("MPL format decision: Section 10 criteria 1-3 resolved; p-BDM incentive-only gap flagged")
