# Point 4 Deep-Dive: Does pBDM IC require probabilistic sophistication?

**Date:** 2026-04-23
**Companion to:** `01_feedback-capture.md`
**Scope:** Unpacks Anujit's Point 4, ties it to Point 1, and lays out the resolution plan.
**Status:** Open question. Do not treat the reconciliation below as committed. The primary-source re-reads and an ADR supersedes-or-scopes-0012 decision come first.

<!-- primary-source-ok: karni_2009, azrieli_chambers_healy_2018, healy_leo_2025, machina_schmeidler_1992, dustan_koutout_leo_2023, chakraborty_kendall_2025, danz_vesterlund_wilson_2022, vesterlund_wilson_2022, danz_vesterlund_wilson_2024 -->

---

## 1. The apparent contradiction

Anujit's Point 4 says:

> pBDM IC requires monotonicity AND probabilistic sophistication. If people are ambiguity averse but satisfy monotonicity, BDM still will not be incentive compatible because they will not have probabilities in their heads.

ADR-0012 says the opposite:

> Adopt Azrieli-Chambers-Healy (2018) statewise monotonicity as the theoretical IC foundation. Requires only: improving any state's outcome (weakly) improves the subject's preference over the act. No assumption of expected utility. No assumption of reduction of compound lotteries. No assumption of probabilistic sophistication.

Both cannot be right as stated. The resolution is that "IC" means different things in the two claims.

## 2. The reconciliation: mechanism IC vs. belief IC

There are two distinct properties to keep separate.

**Mechanism IC (what Azrieli gives us).** For every admissible preference relation the subject might hold, the mechanism rewards the subject for truthful reporting of their preference over the alternatives in each binary decision. This is a property of the mechanism + the preference relation, and it is what ACH 2018 establishes under statewise monotonicity alone. No probabilistic sophistication is needed, because the argument does not assume the subject has a probability — it only assumes they have a preference over the acts.

**Belief IC (what is needed to interpret the elicited report as a belief).** For the subject's truthful report to be interpretable as their probability of event E, the subject must *have* a single probability of event E. Probabilistic sophistication in the Machina-Schmeidler sense is exactly that: the subject's preferences over acts can be represented as expected utility with respect to a single subjective probability measure. Without this, the subject may have beliefs that are richer than a single probability (a set of priors; a capacity; something else), and the mechanism will elicit a preference that does not correspond to any single probability.

On this reading, Anujit is right about the interpretive requirement for belief elicitation and ADR-0012 is right about the minimal assumption for mechanism IC. The two claims are not in conflict; they answer different questions.

But: ADR-0012 uses the phrase "IC foundation" without qualification. A reader of the paper will reasonably interpret that as "the conditions under which the mechanism elicits the subject's true belief." Under that reading, ADR-0012 is incomplete. The fix is either to scope ADR-0012 explicitly to mechanism IC and add a separate ADR on what is required for the interpretation, or to supersede ADR-0012 with a single ADR that names both requirements.

## 3. What an ambiguity-averse subject does in pBDM

This is the load-bearing technical question. It has to be worked out directly, not inferred, before the ADR update.

Consider a subject who is ambiguity averse about event E, with a set of priors P and maxmin preferences:
- Each prior p ∈ P assigns a probability to E; call this p_E.
- The subject's valuation of "bet on E" under maxmin is the minimum p_E over p ∈ P — call it p_min.

Under pBDM, the subject reports r; a random q is drawn; if r ≥ q, the subject plays the bet on E (wins the prize with probability p_E under prior p), else plays the known lottery paying prize with probability q.

For each q, the binary choice between (bet on E) and (known-q lottery) is a preference question. Under maxmin, the subject prefers (known-q lottery) to (bet on E) iff q > p_min. Under statewise monotonicity over the joint mechanism, the subject's optimal report is the switching point: r* = p_min.

So pBDM elicits p_min from a maxmin-ambiguity-averse subject. That is *a* coherent number, but it is not "the subject's probability of E" — it is the infimum of the prior set. The mechanism is behaving correctly given the subject's preferences; the *interpretation* of the report as a belief is what breaks down.

Under other models of ambiguity (multiple priors + α-maxmin, smooth ambiguity with ambiguity aversion, rank-dependent utility, etc.), the elicited switching point is some other function of the prior set — still not a single probability.

Under probabilistic sophistication (single subjective probability p), the mechanism elicits p directly. That is the only case in which "the subject's report is the subject's probability of E" holds cleanly.

## 4. Why this matters for the Bayesian-updating arm specifically

The induced-probability arm (ball-urn) is safe. ADR-0021 committed to a physical ball-urn that delivers an objective probability. Under an objective probability, probabilistic sophistication is automatic in the relevant sense: the subject does not need to hold a single subjective probability, because the probability is given exogenously. Any reasonable preference over the bet behaves as if EU with respect to the objective probability (this is the standard argument for why objective risk is different from ambiguity).

The Bayesian-updating arm is not safe. Subjects observe data and must form a posterior belief about a composition of unknowns. The posterior is only a single probability if the subject:
1. Treats the likelihood as known and non-ambiguous.
2. Computes the Bayesian update correctly (or at least arrives at a point belief, even if incorrect).
3. Does not have residual ambiguity about the parameters of the problem.

Empirically, each of these fails for meaningful subsets of subjects. Subjects who treat the Bayesian problem as ambiguous will not have a single posterior in the Machina-Schmeidler sense. Their pBDM report will elicit some function of their belief representation — for maxmin types, the infimum of their posterior set — which we will record as their "belief" but which is not really a probability.

This affects the experiment's core identification:
- H1/H1b (BDM fails BIC even with objective probabilities): unaffected. The induced-probability arm is safe.
- H3 (gap widens under "complexity"): interpretation is contaminated. If the Bayesian arm's gap is larger than the induced-probability arm's gap, we cannot attribute the difference cleanly to complexity — part of the difference is that the IC interpretation itself is weaker in the Bayesian arm.

This is exactly the Point 1 concern reformulated: "complexity" is not the only thing changing across the within-subject contrast. Probabilistic sophistication is also changing.

## 5. What the literature might offer (to verify, not to cite)

Rather than listing what specific papers say (which requires primary-source reads we have not done), here are the threads to pull on:

- **Karni (2009)** is the BDM-for-beliefs paper ADR-0012 mentions. The IC argument in Karni works through a dominance argument that does appear to invoke probabilistic sophistication in the *interpretation* of the mechanism's output, even if the dominance argument itself is about acts. Re-read needed to pin this down.
- **Azrieli, Chambers, Healy (2018)** is the general RPS monotonicity result. Their footnote 16 on BDM for probabilities is the bridge to belief elicitation. The question is whether their IC property (which is defined over preferences, not beliefs) carries the same content as "the mechanism elicits the subject's belief" once we try to use the elicited report as a belief. Re-read needed.
- **Healy & Leo (2025)** handbook chapter is our summary reference for the IC hierarchy. Their Axiom 5 is statewise monotonicity; they argue BDM is IC under it. Whether they separately require probabilistic sophistication for belief *interpretation* (as opposed to mechanism IC) is what we need to check.
- **Machina & Schmeidler (1992)** on probabilistic sophistication: the foundational definition. Useful for formalizing exactly what Anujit means by "has probabilities in their heads."
- **Dustan, Koutout, Leo (2023)** — the ROCL paper per Point 2. Their "only 30% are consistent reducers" finding does not speak directly to probabilistic sophistication, but their setup may implicitly rely on it.
- **Danz, Vesterlund, and Wilson (2022 BSR; 2024 JEP)** — the original "BDM fails BIC" result. It was conducted under induced objective probabilities. The IC argument there may have been scoped to the objective-probability case. Worth re-checking whether they explicitly discuss what happens under subjective beliefs.

## 6. Points 1, 2, 3, 4 together: concrete action plan

Priority is set by load-bearingness and sequencing.

### P0 (before any paper or design changes)

1. **Primary-source re-read of Karni (2009) and Azrieli, Chambers, Healy (2018) with the question "does the IC derivation implicitly assume probabilistic sophistication?"** Produce per-paper reading notes under `master_supporting_docs/literature/reading_notes/` per the README template. Existing compiled-notes summaries are not close enough reads to resolve this.
2. **Primary-source read of Dustan, Koutout, Leo (2023)** with the specific question "does the ROCL argument in that paper apply to BQSR only, or also to BDM?" Produce per-paper reading notes. This closes Point 2.
3. **Primary-source read of Machina & Schmeidler (1992)** on probabilistic sophistication. We do not need a deep read — we need the definition and the characterization result. This grounds the deep-dive above on firmer footing.

### P1 (after the re-reads)

4. **ADR on the IC-foundation question.** Either scopes ADR-0012 (mechanism IC only) and adds a new ADR on belief-interpretation requirements, or supersedes ADR-0012 with a single combined ADR. The choice depends on what the re-reads show. Include an explicit discussion of what is elicited from an ambiguity-averse subject.
5. **ADR on precision matching across mechanisms.** Commits pBDM to 5pp, commits to discretized or continuous q, commits to display mode. Single ADR covering the three tightly-coupled decisions.
6. **Revised hypothesis on "complexity."** Decide whether to (a) rename H3 to something more precise ("endogenous belief formation"; "Bayesian-posterior elicitation"), (b) add auxiliary measures that isolate cognitive burden from belief-formation ability, (c) drop the Bayesian-updating arm and restrict to induced probabilities. New ADR for the decision.

### P2 (after the IC-foundation ADR is in place)

7. **Update the paper's theory section** to match whatever ADR lands on. Make the mechanism-IC vs. belief-IC distinction explicit. Be explicit about what pBDM elicits from an ambiguity-averse subject (probably a sentence or two in the theory section — the result itself is not surprising, but we should not hide it).
8. **Update the deck.** The Tier-1 Q1 frame ("overall design") and the complexity frame (H3) both need rewriting to reflect the revised hypothesis framing.

### P3 (downstream)

9. **Revisit ADR-0005 (B&H belief transfer) and ADR-0015 (B&H ROCL canonical)** in light of the Point 2 ROCL-for-BDM question. If BDM is confirmed not to require ROCL, these ADRs stand. If somehow it does, both are affected.
10. **Check whether the design of the Bayesian-updating arm can be modified to preserve probabilistic sophistication.** For example, if we present subjects with a finite set of hypotheses and show them the Bayes-rule computation for each, we can reduce the ambiguity the subject has about their own posterior. This is a design-modification question, not just a reframing.

## 7. Signals to watch when reading the primary sources

- **In Karni (2009):** does the dominance argument appeal to "the subject's probability of E" anywhere, or only to "the subject's preference over the act that pays iff E"? If the latter, Karni is safe for mechanism IC without probabilistic sophistication. If the former, Anujit's claim is exactly Karni's claim.
- **In ACH (2018):** is footnote 16 (on belief BDM) framed as "the subject has a probability and the mechanism elicits it," or "the mechanism elicits the subject's preference over the bet, which may or may not admit a probabilistic interpretation"?
- **In Healy & Leo (2025):** the IC hierarchy (Axiom 5 < Axiom 6 < EU) is stated as a property of the mechanism. Is there a parallel hierarchy for what it takes to *interpret* the output as a belief?
- **In Dustan, Koutout, Leo (2023):** the "reducers vs. non-reducers" split is about preferences over compound lotteries, not about probabilistic sophistication. But if the authors implicitly assume probabilistic sophistication for the belief-report interpretation, our "BDM does not require reduction" claim may still leave open "BDM requires probabilistic sophistication."

## 8. What Christina should take away

- Point 4 is not confusion. It is a real gap between what we claimed in ADR-0012 and what Anujit knows about the field. The gap is about "mechanism IC" vs. "belief IC."
- The induced-probability arm is safe. The Bayesian-updating arm is not, because it conflates cognitive burden with whether the subject has a single probability.
- Points 1 and 4 are the same underlying issue. Both should be resolved together.
- Resolution path is: primary-source re-reads (P0) → ADR updates (P1) → paper and deck updates (P2+).
- No design or paper changes until the re-reads are done. The ADR-0012 supersedes-or-scopes decision should be made on the basis of the primary sources, not on my reconciliation attempt above.
