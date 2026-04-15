# 0012: Azrieli et al. (2018) monotonicity as theoretical IC foundation for p-BDM and MPL

- **Date:** 2026-04-15
- **Status:** Decided
- **Scope:** IC foundation
- **Data quality:** Full context

## Context

The paper has two theoretical jobs that were conflated in ADR-0004:

1. **Theoretical IC foundation** — under what assumption is truth-telling the dominant strategy for p-BDM (and MPL)? This is the *minimal sufficient* condition that justifies the mechanism's IC claim at all.
2. **Behavioral failure theory** — why do subjects fail to play the dominant strategy in practice?

These require different frameworks. ADR-0004 named UJS (Chakraborty & Kendall 2025) as "primary theoretical framework" without distinguishing the two jobs. UJS is a strong behavioral/cognitive refinement — useful for explaining why BDM fails, but *heavier* than the minimal IC assumption and not the right foundation for the "why it should work in theory" story.

The options for the theoretical IC foundation:

- **Subjective expected utility (Karni 2009).** Classical. Requires EU + probabilistic sophistication. Strong.
- **Reduction of compound lotteries (ROCL).** Often invoked. Violated empirically (Dustan et al. 2023: 70% of subjects).
- **Statewise monotonicity (Azrieli, Chambers & Healy 2018).** Minimal sufficient condition for RPS-based mechanisms. Requires only that improving any state's outcome (weakly) improves the act. No EU, no ROCL, no probabilistic sophistication needed.
- **T-statewise monotonicity (Healy & Leo 2025).** A refinement tailored to lottery-based elicitation; essentially a relaxation of ACH monotonicity specific to mechanisms where outcomes are lotteries indexed by reports.

Because we want the IC claim to be robust to realistic preferences (non-EU, ambiguity-averse, non-ROCL), the *lightest* sufficient assumption is preferable. Everything stronger introduces confounds between "IC assumption fails" and "subjects have non-standard preferences."

## Decision

Adopt **Azrieli, Chambers & Healy (2018) statewise monotonicity** as the theoretical IC foundation for both single-report p-BDM and the belief MPL. Cite Healy & Leo (2025) T-statewise monotonicity as a refinement specific to lottery-based elicitation.

This is *the minimal sufficient condition*:

- No assumption of expected utility.
- No assumption of reduction of compound lotteries.
- No assumption of probabilistic sophistication.
- Requires only: improving any state's outcome (weakly) improves the subject's preference over the act.

Both p-BDM and MPL are IC under this assumption. The distinction between them — H2 of the paper — is therefore *not* about the IC assumption differing across mechanisms; it is about how format interacts with the assumption holding empirically (ADR-0005, ADR-0007) and about behavioral compliance with IC in practice (ADR-0013, UJS scope).

## Consequences

- **Commits us to:** the paper's IC-defense section building on Azrieli et al. 2018 (and Healy & Leo 2025 as refinement), not Karni (2009) EU or ROCL.
- **Commits us to:** citing Azrieli et al. (2018) and Healy & Leo (2025) as the load-bearing IC references.
- **Separates cleanly from behavioral framework:** ADR-0013 (UJS as behavioral theory) is distinct. Monotonicity is about *whether the mechanism is IC in theory*; UJS is about *whether subjects can identify and play the dominant strategy in practice*. Do not conflate in the paper's exposition.
- **Anchors the monotonicity-format question:** ADR-0005 (B&H belief transfer) and ADR-0007 (mechanism invariance as format anchor) are about *when monotonicity holds empirically*. They operate inside the Azrieli framework, not outside it.
- **Robust to common failures:** because we do not assume EU or ROCL, violations of those assumptions do not threaten the IC claim. Only violations of monotonicity itself do.
- **Rules out:** an IC-defense section that invokes EU, probabilistic sophistication, or ROCL as load-bearing assumptions. If we ever need to, that would be a separate decision.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §1 "Why This Decision Is Load-Bearing" (IC assumption language — "Azrieli-style monotonicity (or T-statewise monotonicity per Healy & Leo 2025)")
- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (monotonicity vs. ROCL distinction)
- `master_supporting_docs/literature/reading_notes/` :: Azrieli, Chambers & Healy (2018); Healy & Leo (2025); Karni (2009)
- Discussion: 2026-04-15 — clarification that "primary theoretical framework" in ADR-0004 was too broad; IC foundation and behavioral theory are distinct components
