---
citation: Karni, E. (2009). A Mechanism for Eliciting Probabilities. *Econometrica*, 77(2), 603–606. DOI: 10.3982/ECTA7833
bibtex_key: karni_2009
primary_source: master_supporting_docs/literature/papers/Karni_2009.pdf
date_read: 2026-04-23
reader: Claude
session_log: quality_reports/session_logs/2026-04-23_advisor-meeting-anujit.md
---

# Karni (2009) — A Mechanism for Eliciting Probabilities

**Reading mandate for this session.** Close-read with one specific question: *Does Karni's IC derivation for the belief-BDM mechanism require probabilistic sophistication, or does monotonicity/dominance alone suffice?* Anujit flagged on 2026-04-23 that pBDM IC requires monotonicity AND probabilistic sophistication; ADR-0012 commits to the opposite position (Azrieli monotonicity alone). The answer determines whether ADR-0012 gets scoped or superseded.

**Short answer.** Karni's IC proof requires probabilistic sophistication explicitly. PS is named as an assumption in §2 ("Suppose that the agent's preference relation ≽ on D displays probabilistic sophistication and dominance"), and it is used at a load-bearing step in the IC argument — specifically, to establish that ℓ(r,x,y) ≻ β when r > π(E) — a step that cannot go through without PS. The paper's concluding remarks (p. 606) further confirm this: Karni himself writes that the mechanism fails when PS fails (no-stake condition → PS holds; stake in the event → PS fails → mechanism fails). Anujit's Point 4 is correct as a statement about Karni's proof.

## Summary

Short 4-page Econometrica Note introducing a direct revelation mechanism for eliciting subjective probabilities. The mechanism (what we now call pBDM) selects r uniformly from [0,1], asks the agent for a report μ, pays the bet x_E y if μ ≥ r, and pays the lottery ℓ(r,x,y) if μ < r. Karni proves that truthful reporting of π(E) is the unique dominant strategy, under the assumption that the agent's preferences satisfy probabilistic sophistication and dominance over lotteries. An equivalent auction version is given. The concluding remarks argue the mechanism outperforms scoring rules (which confound probabilities and marginal utilities under risk aversion) and flag the no-stake condition as a critical requirement.

## Core claims this paper makes

- The mechanism: draw r uniform on [0,1], solicit report μ ∈ [0,1], pay β := x_E y if μ ≥ r, pay lottery ℓ(r,x,y) if μ < r. (p. 604, §2)
- **Truthful reporting μ = π(E) is the unique dominant strategy *under* probabilistic sophistication and dominance.** (p. 604, IC proof)
- The mechanism is equivalent to a continuous-bid auction between the agent and a dummy bidder. (p. 604–605)
- The mechanism outperforms scoring rules: scoring rules confound subjective probabilities with marginal utilities unless the agent is risk-neutral (p. 605–606, eq. 1–2). To get unbiased elicitation from a scoring rule, r must tend to 0, which kills incentives.
- The no-stake condition is critical: if the agent has a stake in E, the mechanism fails because payoffs become event-dependent and the preference no longer exhibits probabilistic sophistication. (p. 606)

## Definitions I should cite verbatim

**Probabilistic sophistication (p. 604):**
> A preference relation ≽ on D that restricted to the set of finite acts is said to exhibit probabilistic sophistication if it ranks acts or lotteries solely on the basis of their implied probability distributions over outcomes (see Machina and Schmeidler (1995)). In particular, if π is the probability measure implicit in ≽, then probabilistic sophistication implies that, for all acts f and lotteries ℓ(p,x,y) = [x,p; y,(1−p)], p ∈ [0,1], π(f⁻¹(x)) = p implies x_{f⁻¹(x)} y ∼ ℓ(p,x,y).

**Dominance (p. 604):**
> ℓ(p,x,y) ≽ ℓ(p',x,y) for all x > y if and only if p ≥ p'.

Note: "dominance" in Karni's sense is a property of preferences over lotteries — higher-probability-of-the-better-prize is weakly preferred. It is not "statewise monotonicity over acts" in the Azrieli sense; it is a weaker condition defined only on the lottery space.

**The mechanism (p. 604):**
> The elicitation mechanism selects a random number r from a uniform distribution on [0,1] and requires the agent to submit a report, μ ∈ [0,1], of his subjective probability assessment of the event E. The mechanism awards the agent the payoff β := x_E y if μ ≥ r and the lottery ℓ(r,x,y) if μ < r.

**The concluding remark that directly answers Anujit's question (p. 606):**
> The accuracy of the elicitation procedures described here depends critically on the agent having no stake in the event of interest. If he does have a stake in the event, the evaluations of the payoffs of the bet and the lotteries that figure in the mechanism are event dependent, and the preference relation does not exhibit probabilistic sophistication.

## The IC proof — where PS enters

The proof is on p. 604, one paragraph. Here is the full structure with the load-bearing PS steps annotated.

**Setup.** Assume the agent reports μ > π(E) (the μ < π(E) case is symmetric).

**Case 1: r ≤ π(E).** Then r ≤ π(E) < μ. Both reports μ and π(E) trigger "μ ≥ r" (equivalently, π(E) ≥ r), so the agent gets β regardless. Same payoff. No PS needed here.

**Case 2: r ≥ μ.** Then π(E) < μ ≤ r, so both reports give the lottery ℓ(r,x,y). Same payoff. No PS needed.

**Case 3: r ∈ (π(E), μ).** This is the critical case.
- Reporting μ: μ > r ⇒ agent gets β.
- Reporting π(E): π(E) < r ⇒ agent gets ℓ(r,x,y).
- Karni concludes: "But r > π(E), which, by probabilistic sophistication and dominance, implies ℓ(r,x,y) ≻ β."

**Why PS is load-bearing at this step.** The comparison is between an act β = x_E y (state-contingent payoff) and a lottery ℓ(r,x,y) (objective probability r of x, else y). Without PS, there is no way to rank an act against a lottery using the scalar π(E). PS supplies exactly the translation:
1. PS ⇒ β ∼ ℓ(π(E), x, y). (The act β induces probability distribution [x with π(E); y with 1−π(E)]; PS says the agent is indifferent between this act and the corresponding lottery.)
2. Dominance ⇒ ℓ(r,x,y) ≻ ℓ(π(E),x,y) whenever r > π(E).
3. Transitivity of ≻ and ∼ ⇒ ℓ(r,x,y) ≻ β.

Step 1 is the PS step. Remove PS, and step 1 does not hold — the agent may not even have a well-defined probability π(E) of E, let alone treat β as equivalent to ℓ(π(E),x,y). The proof fails.

**The agent's subjective probability π(E) is itself a PS-derived object.** Karni defines π(E) as "the probability the agent assigns to the event E" (p. 604, just before the mechanism definition). This is coherent only if the agent's preferences admit a probability measure, which is PS.

## What this paper is NOT claiming (common misreadings)

- **Misreading:** Karni's IC result holds under monotonicity alone, and PS is just a convenience for interpretation.
  **Correction:** PS is a load-bearing assumption in the IC proof itself (p. 604). It is used to rank β against ℓ(r,x,y). Without PS, the mechanism does not elicit π(E) — indeed, there may be no π(E) to elicit. Karni's own concluding remark (p. 606) reinforces this: when the no-stake condition fails, PS fails, and the mechanism fails.

- **Misreading:** "Azrieli monotonicity is strictly weaker than Karni's PS + dominance for the same IC property."
  **Correction:** Azrieli monotonicity (ACH 2018) is weaker *for a different property*. ACH gives mechanism IC: the subject's truthful revelation of preference over each binary choice is weakly dominant. Karni gives belief IC: the subject's truthful report equals their subjective probability π(E). These are different outputs. Karni's stronger assumption (PS) is doing the extra work of connecting "revealed preference over the bet" to "subjective probability of E." ACH's weaker assumption does not and cannot do that connection. The deck's Frame 4 statement ("Azrieli's monotonicity is strictly weaker — the minimal sufficient assumption for IC") is misleading as written, because it does not distinguish the two IC notions.

- **Misreading:** Karni's mechanism is BDM-for-value generalized to probabilities.
  **Correction:** The mechanism is formally distinct from the value BDM. Becker-DeGroot-Marschak (1964) elicits willingness-to-pay for an object by asking the subject to report a price and comparing to a random draw. Karni's mechanism elicits a probability report and compares to a uniform draw r. The two share a structural similarity (binary choice menu indexed by the random draw), but Karni is the one doing belief elicitation; citing "BDM" generically conflates them.

- **Misreading:** Karni's concluding remarks about the no-stake condition are a side comment.
  **Correction:** They are a direct statement of the IC requirement. "If he does have a stake in the event, the evaluations of the payoffs of the bet and the lotteries that figure in the mechanism are event dependent, and the preference relation does not exhibit probabilistic sophistication" (p. 606) is a necessary-condition statement: PS is what makes the mechanism work, and PS fails when the agent has a stake. This is the same logic Anujit invoked for ambiguity aversion — any preference violation that breaks PS breaks the mechanism.

## Method

Theoretical. One mechanism, one proof. No data.

## Key numerical results

None.

## Relevance to our project

### For ADR-0012 (Azrieli monotonicity as IC foundation)

ADR-0012 quotes: "No assumption of expected utility. No assumption of reduction of compound lotteries. No assumption of probabilistic sophistication." The last clause conflates two distinct IC notions:

- **Mechanism IC** (ACH 2018): the mechanism weakly-dominates untruthful revelation of preference over each binary choice in the menu. Monotonicity suffices.
- **Belief IC** (Karni 2009): the mechanism elicits the agent's subjective probability π(E). This is what we want when we say "belief elicitation." PS + dominance over lotteries is the sufficient condition Karni establishes.

Karni's paper does not show that belief IC holds under monotonicity alone. Nothing in Karni refutes ACH's result on mechanism IC — because they answer different questions. But ADR-0012's phrasing treats them as answering the same question, which is an error.

**Action:** ADR-0012 should be scoped to mechanism IC (or superseded with a combined ADR that separates the two notions). The Bayesian-updating arm's interpretation of "BDM fails behavioral IC" is contaminated wherever PS may fail for subjects; the induced-probability ball-urn arm is safe because the probability is objective (ADR-0021).

### For the deck (Frame 4)

Frame 4 of `04_slides.tex` currently presents Karni and Azrieli as alternative IC foundations with Azrieli "strictly weaker." After this reading, that framing is incorrect — the two results are about different IC notions, not about the same notion under weaker vs. stronger assumptions. Frame 4 needs rewriting to distinguish mechanism IC from belief IC.

### For H3 ("complexity" hypothesis)

Karni's no-stake condition is a reminder that PS fails whenever the agent's payoffs become event-dependent in ways the agent cares about. In the Bayesian-updating arm, the agent is forming a posterior from data. If the agent has any residual ambiguity about the likelihood, the parameter space, or their own computational ability, PS may fail. This is exactly the confound Anujit's Point 1 and Point 4 together identify: "complexity" in the Bayesian arm varies cognitive burden *and* whether PS holds. Karni confirms that when PS fails, the mechanism does not elicit π(E) even in principle.

### For the paper's theory section

Karni (2009) is the right citation for **belief-elicitation IC with PS**. ACH (2018) is the right citation for **mechanism IC under monotonicity**. The paper's IC-defense section needs both, with the two notions kept explicitly distinct. A single-sentence elision ("BDM is IC under weak conditions") is not defensible; which IC notion matters depends on what we want to do with the elicited report.

## Open questions flagged by this paper (for our work)

- **Is there an intermediate result between Karni and ACH?** Specifically, does the literature offer a "belief IC under monotonicity + something weaker than PS" result? If yes, we should cite that. If no, we face a stark binary: PS or bust for belief interpretation.
- **What does pBDM elicit from an ambiguity-averse subject (maxmin or otherwise)?** The deep-dive in `quality_reports/advisor_meeting_2026-04-23/02_point-4-probabilistic-sophistication-deep-dive.md` argued it elicits p_min (infimum of prior set) under maxmin. This is consistent with Karni's framework — the switching point exists; it just isn't a probability in the PS sense. Worth making this explicit in the paper.
- **How should the paper handle subjects who fail PS behaviorally (not theoretically)?** The ball-urn arm (objective probability) satisfies PS trivially. The Bayesian arm does not. Do we: (a) frame the Bayesian-arm results as "conditional on PS holding, the gap widens with complexity," (b) measure PS-violation at the subject level and condition, or (c) drop the arm? The answer to this depends on the ADR-0012 supersession decision.

## Passages worth quoting

p. 604: "A preference relation ≽ on D that restricted to the set of finite acts is said to exhibit probabilistic sophistication if it ranks acts or lotteries solely on the basis of their implied probability distributions over outcomes (see Machina and Schmeidler (1995))."

p. 604: "Suppose that the agent's preference relation ≽ on D displays probabilistic sophistication and dominance in the sense that ℓ(p,x,y) ≽ ℓ(p',x,y) for all x > y if and only if p ≥ p'. Denote by π(E) the probability the agent assigns to the event E."

p. 604: "But r > π(E), which, by probabilistic sophistication and dominance, implies ℓ(r,x,y) ≻ β. Thus the agent is worse off reporting μ instead of π(E)."

p. 606: "The accuracy of the elicitation procedures described here depends critically on the agent having no stake in the event of interest. If he does have a stake in the event, the evaluations of the payoffs of the bet and the lotteries that figure in the mechanism are event dependent, and the preference relation does not exhibit probabilistic sophistication."
