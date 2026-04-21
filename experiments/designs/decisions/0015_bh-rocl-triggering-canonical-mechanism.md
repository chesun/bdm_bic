# 0015: Canonical Brown & Healy ROCL-triggering mechanism for the list/separated format distinction

- **Date:** 2026-04-17
- **Status:** Decided
- **Scope:** IC foundation
- **Supersedes:** #0014
- **Data quality:** Full context

## Context

ADR-0014 (2026-04-15) anchored the theoretical framing on "mechanism invariance + strategy-space restriction" and described separated format as "restricting the subject's strategy space in a way that forces observed behavior to be consistent with monotonicity." That exposition was developed further in `strategy_space_restriction_intuition.md` (now renamed to `bh_rocl_intuition.md`).

On 2026-04-17, Christina reviewed the intuition doc against Brown & Healy's verbatim conjecture:

> "Why does the list presentation cause the RPS mechanism to fail? We conjecture that it induces subjects to treat the list of decisions as one large decision. In doing so, subjects' choices become more consistent with the reduction of compound lotteries. It is well known that if a subject satisfies reduction but violates expected utility, then they must violate the axiom of monotonicity. Azrieli et al. (2016) show that, theoretically, monotonicity is crucial for the RPS mechanism to be incentive compatible. So if any of our subjects have non-expected utility preferences but were induced to satisfy reduction because of the list presentation, then they would have generated the differences across treatments that we observed. The separated presentation may prevent reduction from being satisfied, in which case violations of expected utility have no consequence for the (theoretical) incentive compatibility of the RPS mechanism." (Brown & Healy 2018)

The two framings are not equivalent. They differ on which quantity is primitive and which is derived:

| Framing | Treats as primitive | Treats as derived | Pivot |
|---|---|---|---|
| Strategy-space restriction (ADR-0014) | Non-monotone act-preferences | The *feasible set* of acts the subject can reach given the format | What acts are implementable |
| Canonical ROCL (B&H 2018) | Non-EU preferences over simple lotteries | Monotonicity violation at the act level (emerges from ROCL + non-EU by theorem) | Whether ROCL is triggered as a cognitive procedure |

Under B&H's canonical story, the feasible set of acts is identical in list and separated formats — subjects can in principle pick any pattern of row-choices in either. What differs is whether they *apply ROCL* when evaluating their choice. List format makes the compound RPS lottery salient and triggers ROCL; separated format does not, so non-EU preferences stay "local" to each row and produce monotone observed patterns.

The "strategy-space restriction" framing was an idiosyncratic alternative that treated monotonicity violation as a preference primitive and invoked feasibility-set shrinkage as the design principle. That is not B&H's argument, is not how the field understands the result, and produces a weaker defense of separated format. It is retired.

## Decision

Anchor the theoretical exposition on two things:

1. **Mechanism invariance (MI) is the identifying assumption (IA).** Outcome-preferences are stable across payment mechanisms. Being told "we'll pay via RPS" vs. "we'll pay row 14 only" does not shift the subject's taste for money. MI is what makes any observed difference in row-14 choice between Framed Control and RPS attributable to something other than a preference shift.

2. **B&H's ROCL-triggering conjecture is the mechanism we cite.** Specifically, the four-step causal chain:
    - List format → compound-structure salience → subject treats the list as one large decision.
    - One-large-decision framing → subject applies ROCL to evaluate their choice (the cognitive trigger).
    - ROCL + non-EU ⇒ monotonicity violation (theorem — Segal 1990 and related results).
    - Monotonicity violation ⇒ IC failure (Azrieli, Chambers & Healy 2018 result for RPS, ADR-0012).

    Separated format blocks step 1 (no compound-structure salience) → step 2 not triggered → non-EU preferences have no mechanism-level consequence → observed monotonicity restored.

3. **The theorem is the pivot, not ROCL alone.** ROCL is a cognitive axiom the subject may or may not apply. It is not a preference primitive. Non-EU preferences are a preference primitive but do not by themselves produce monotonicity violation — they do so only when *combined with* the ROCL step. This is why separated format works: it removes the ROCL step without changing the subject's underlying preferences.

The acts-vs-outcomes distinction (MPL analysis doc §3.1), the definition of mechanism invariance (§3.2), and the "row-14 action can differ across mechanisms even under MI" observation (§3.3) all remain load-bearing. Only the *explanation for why format matters* changes: from strategy-space restriction (retired) to ROCL triggering (adopted).

## Consequences

- **Commits us to:** citing Brown & Healy (2018) for the conjecture and the empirical result; citing Segal (1990) or a Karni–Safra-type result for the "ROCL + non-EU ⇒ monotonicity violation" theorem; citing Azrieli, Chambers & Healy (2018) for the monotonicity-is-required-for-IC result (ADR-0012).
- **Commits us to:** distinguishing *cross-row* from *within-row* paths to observed non-monotonicity. The ROCL-triggering mechanism addresses the cross-row path only. Within-row non-monotonicity (e.g., ambiguity aversion between the event bet and the r-lottery in belief MPL) is a separate design problem not addressed by format selection.
- **Opens:** the belief-elicitation transfer question remains open (ADR-0005) but is now sharpened. Under the ROCL framing, the question is: does list-format belief MPL trigger ROCL the same way list-format risk MPL does? The auxiliary B&H-transfer arm (MPL analysis doc §8) would answer this directly at the cross-row level.
- **Opens:** a belief-specific within-row concern — the event bet is ambiguous even at induced π, which creates an ambiguity-aversion path to non-monotone choices at the single-row level that neither ROCL-triggering nor format selection closes.
- **Rules out:** framing separated format as "restricting the feasible act set" or "preventing subjects from implementing portfolio strategies." These framings misattribute the mechanism.
- **Rules out:** treating ROCL as optional in the theoretical story. B&H's conjecture has ROCL at its center; mechanism invariance alone does not explain *why* format matters.
- **Does NOT commit us to:** any particular MPL format. Format selection is still an open Pending decision.
- **Preserves from ADR-0014:** the acts-vs-outcomes exposition; the mechanism-invariance definition; the observation that "row-14 action can differ across mechanisms even under MI"; the explicit decoupling of theoretical framing from format selection.
- **Removes from ADR-0014:** the "mechanism invariance + strategy-space restriction" joint framing; the claim that ROCL is "one candidate mechanism" (as if optional); the feasibility-set argument for why separated format restores monotonicity.

## Sources

- `quality_reports/bh_rocl_intuition.md` (renamed from `strategy_space_restriction_intuition.md` on 2026-04-17; revised to use the canonical B&H ROCL framing with two worked examples: §3 shows ROCL triggering in list format, §4 shows non-triggering in separated format)
- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (revised 2026-04-17 to reflect ROCL framing in §3.3, §3.4, §3.5)
- `quality_reports/session_logs/2026-04-17_rocl-canonical-framing-correction.md` :: session log recording the review, the decision to supersede ADR-0014, and the downstream cascade (file rename, §3 rewrite, cross-ref updates)
- Brown & Healy (2018), *AEJ: Micro* — verbatim conjecture, empirical result (list p = 0.041, separated p = 0.697)
- Segal (1990), *Two-stage lotteries without the reduction axiom* — the ROCL + non-EU + monotonicity joint-inconsistency result
- Azrieli, Chambers & Healy (2018) — the monotonicity-is-required-for-IC result for RPS (ADR-0012)
- ADR-0014 (Superseded by this entry)
- ADR-0005 (cross-reference updated from "strategy-space-restriction argument" to "ROCL-triggering argument")
