# Intuition: Why Separated Random-Order Format Restores Incentive Compatibility — The Brown & Healy ROCL Story

**Purpose:** Deep exposition of the mechanism Brown & Healy (2018) propose for why list format breaks the incentive compatibility of the random-problem-selection (RPS) mechanism while separated random-order format does not. The claim is load-bearing for any IC defense built on separated-format MPL (ADR-0015, supersedes #0014); it is worth making sure we actually understand the mechanism rather than accepting it as shorthand.

**File history:** Renamed from `strategy_space_restriction_intuition.md` on 2026-04-17 when the earlier strategy-space-restriction framing was retired. Now named `bh_rocl_intuition.md` to match its content.

**Status:** Revised 2026-04-17. An earlier draft framed the mechanism as "separated format restricts the feasible strategy space"; Christina flagged on 2026-04-17 (while reviewing against B&H's verbatim text) that this did not match B&H's actual conjecture (quoted in full in §1). The canonical story is about whether the *reduction of compound lotteries* (ROCL) is applied, not about what acts are implementable. This version uses only the canonical B&H mechanism.

---

## 1. Brown & Healy's conjecture, verbatim

> "Why does the list presentation cause the RPS mechanism to fail? We conjecture that it induces subjects to treat the list of decisions as one large decision. In doing so, subjects' choices become more consistent with the reduction of compound lotteries. It is well known that if a subject satisfies reduction but violates expected utility, then they must violate the axiom of monotonicity. Azrieli et al. (2016) show that, theoretically, monotonicity is crucial for the RPS mechanism to be incentive compatible. So if any of our subjects have non-expected utility preferences but were induced to satisfy reduction because of the list presentation, then they would have generated the differences across treatments that we observed. The separated presentation may prevent reduction from being satisfied, in which case violations of expected utility have no consequence for the (theoretical) incentive compatibility of the RPS mechanism. Indeed, we find that, empirically, incentive compatibility is restored with the separated presentation." (Brown & Healy 2018)

The mechanism has four linked steps:

1. **Format → portfolio framing.** List presentation makes the compound structure of RPS salient; subjects come to treat the 20 rows as one joint decision.
2. **Portfolio framing → ROCL applied.** Once the compound structure is salient, subjects evaluate their choice by reducing the compound lottery to its simple-lottery equivalent.
3. **ROCL + non-EU → monotonicity violation (theorem).** A known result: if preferences over simple lotteries are non-EU and the subject applies ROCL to compound lotteries, the induced preferences over acts must violate monotonicity.
4. **Monotonicity violation → IC failure.** Azrieli et al.'s (2016, 2018) IC result for RPS requires monotonicity. Once monotonicity breaks, the mechanism is no longer IC.

In separated random-order format, step 1 fails — the compound structure is not salient, so step 2 is not triggered, so the subject's non-EU preferences over simple lotteries have no mechanism-level consequences. IC is restored.

## 2. Preliminaries: compound lotteries, ROCL, and the theorem

### 2.1 Simple and compound lotteries

A **simple lottery** is a probability distribution directly over final outcomes, e.g., `L = (30% $15, 70% $0)`.

A **compound lottery** is a lottery over lotteries, e.g., `C = (1/2) L₁ + (1/2) L₂` where each L_i is itself a simple lottery. RPS with 20 rows is a compound lottery: with probability 1/20, the subject's row-i choice is resolved.

### 2.2 Reduction of compound lotteries (ROCL)

ROCL is the axiom (or cognitive procedure) that says: a compound lottery should be evaluated identically to its reduced simple-lottery equivalent. Concretely, `C = (1/2) L₁ + (1/2) L₂` reduces to the simple lottery formed by mixing the outcome probabilities — if `L₁ = (30% $15, 70% $0)` and `L₂ = (50% $10, 50% $0)`, then C reduces to `(15% $15, 25% $10, 60% $0)`.

ROCL is a *cognitive axiom the subject may or may not apply*. It is not a property of preferences over simple lotteries.

### 2.3 The theorem: ROCL + non-EU ⇒ monotonicity violation

Known result (related to Segal 1990, and to various Karni–Safra-type corollaries): if a subject's preferences over *simple* lotteries violate expected utility, and the subject applies ROCL to compound lotteries, then the subject's induced preferences over compound *acts* in an RPS must violate monotonicity.

**Intuition:** EU is the unique preference structure that is simultaneously monotone, continuous, and respects the independence axiom. If you drop independence (non-EU), but you impose ROCL and continuity, you must give up monotonicity. Something has to break — which axiom depends on which you insist on.

In the RPS context, this means: the subject who is non-EU over simple lotteries and applies ROCL will, for some pair of acts a and a' where a' differs from a only by replacing one row's outcome with a preferred outcome, strictly prefer a over a'. That is the formal definition of a monotonicity violation.

## 3. What "satisfying ROCL" means in list format — worked example

Consider a subject with prospect-theoretic preferences exhibiting the **certainty effect**: they strictly prefer certain $10 to the lottery `(55% $20, 45% $0)`, even though the latter has higher expected value ($11).

- L₁ = certain $10
- L₂ = (55% $20, 45% $0)
- Row-local preference: L₁ ≻ L₂ (certainty effect)

Now embed this as row 14 in a 20-row RPS. To keep the example clean, suppose the other 19 rows each present a reference lottery `L₀ = (50% $10, 50% $0)`, which the subject is obliged to take (no choice).

**In Framed Control** (only row 14 is paid): the subject compares L₁ vs. L₂ directly, chooses L₁.

**In list-format RPS**, all 20 rows are visible on one screen. The compound structure is salient. The subject reframes the problem:

> "My payoff comes from one of 20 rows, selected uniformly at random. What I'm really picking is the *compound* lottery formed by my 20 choices."

If the subject applies ROCL, they evaluate their options at the reduced level:

- **Pick L₁ at row 14:** compound = (1/20) L₁ + (19/20) L₀ reduces to `(52.5% $10, 47.5% $0)`.
- **Pick L₂ at row 14:** compound = (1/20) L₂ + (19/20) L₀ reduces to `(2.75% $20, 47.5% $10, 49.75% $0)`.

At the reduced level, *neither compound has a certain outcome*. The certainty effect — which was driving L₁ ≻ L₂ row-locally — does not carry through reduction, because the reduced compound lotteries have no certain outcome to pivot on.

Under most prospect-theoretic parameters, the subject now evaluates these by their probability-weighted outcomes. The L₂-compound has a positive chance of $20 and a higher EV ($5.80 vs. $5.25); the L₁-compound has a higher chance of the middle outcome $10. Whether L₂-compound or L₁-compound is preferred depends on the specific non-EU functional, but *the ranking does not track the row-local ranking L₁ ≻ L₂*.

If the subject now prefers the L₂-compound, their row-14 choice in list RPS is L₂ — the opposite of Framed Control.

**That is a monotonicity violation.** Moving from act "L₂ at row 14, L₀ elsewhere" to act "L₁ at row 14, L₀ elsewhere" replaces row 14's outcome with a strictly preferred outcome (L₁ ≻ L₂ row-locally). Monotonicity says this should make the subject weakly better off. But the subject's (ROCL-reduced, non-EU-evaluated) ranking says the L₂ version is strictly preferred. Contradiction.

**This is what "satisfying ROCL" produces in list format:** the subject's row-local preference (certainty effect, L₁ ≻ L₂) is overridden by the portfolio-level evaluation of the reduced compound lottery. The mechanism is no longer IC because row-by-row truthful reporting is not the subject's best response.

## 4. Why ROCL is not triggered in separated format — worked example

Same subject, same preferences. Now run the 20 rows in *separated random-order format*: each row is presented on its own screen, the order is randomized per subject, the subject cannot see the full list, cannot revise past choices, and cannot anticipate what row comes next.

The subject's screen on row 14 shows:

> "Choose between: $10 for sure, or 55% chance of $20 / 45% chance of $0."

What information is available to the subject at this moment?

- The current row's two options (L₁ and L₂), fully specified.
- General knowledge that there are other rows and one will be paid (mentioned in instructions).
- No view of which rows exist, in what order, with what content.
- No view of past or future rows' content.

**Can the subject apply ROCL?** ROCL requires mentally constructing the compound lottery formed by their choices across all rows. This requires knowing the full set of row-content (to know what L_i to mix) and the probability of each row being selected. In separated format, the subject has only partial information (current row's content) and would have to hold in memory the content of every past row and infer future rows' content.

Empirically, this cognitive load is too high to execute in real time across 15–20 rows. B&H's result (p = 0.697 for separated-format violation) is consistent with subjects *defaulting to row-local evaluation* — they treat each screen as a standalone binary choice and apply their simple-lottery preferences directly.

**The operational mechanism:** at row 14, with only L₁ vs. L₂ visible and no portfolio context, the subject compares them on their own terms. The certainty effect applies: L₁ ≻ L₂. They choose L₁. Same choice as Framed Control. No monotonicity violation.

**Why is the certainty effect back?** Because the subject is now evaluating *simple lotteries* L₁ and L₂ directly, not compound lotteries. The certainty effect is a property of how they evaluate simple lotteries when one has a certain outcome — exactly the situation on this screen. The whole ROCL step — which earlier wiped out the certainty effect by reducing to a compound with no certain outcome — is simply not invoked.

**Key point:** the subject's non-EU preferences are unchanged. What changed is *whether they evaluate the choice as a simple-lottery comparison (row-local) or as a compound-lottery comparison (portfolio-level)*. Format determines which evaluation the subject performs.

## 5. Relation to B&H's empirical result

B&H find population-level monotonicity violation in list format (p = 0.041) and no violation in separated format (p = 0.697), for risk-preference RPS.

Under the canonical ROCL-triggering story, this pattern has a clean interpretation:

- **List format:** subjects with non-EU preferences apply ROCL, producing compound-lottery-level evaluations that violate monotonicity relative to row-local preferences. Population-level signal emerges.
- **Separated format:** ROCL not applied (no cognitive trigger), subjects evaluate row-locally, non-EU preferences over simple lotteries produce monotone patterns across rows. No population-level signal.

Critically, B&H's separated-format null *does not* mean their subjects became EU. It means their non-EU preferences stopped having mechanism-level consequences once ROCL was taken off the table.

## 6. What the argument does NOT claim

To keep the defense clean, the claim is narrow. It does **not** assert:

- **That preferences change across formats.** The subject has the same non-EU preferences over simple lotteries in both formats. Only the cognitive evaluation procedure (with or without ROCL) differs.
- **That the separated-format subject is behaving as if EU.** They are behaving as if row-local non-EU — which coincides with monotone act-choice across rows but does not coincide with EU at the simple-lottery level.
- **That IC is theoretically restored.** What is restored is the *observable* signature of IC. A separated-format subject who, for some reason, does apply ROCL (see §7) would still produce monotonicity violations. Azrieli et al.'s IC result assumes monotonicity; separated format makes that assumption *empirically safer*, not *guaranteed*.
- **That non-EU preferences are a problem.** They are a primitive. The problem is the interaction of non-EU with ROCL in a compound-lottery mechanism. Removing either (make ROCL not apply via format; or make preferences EU via selection/instruction) resolves the mechanism-level issue.

## 7. Limits and loopholes

Ordered roughly from least to most consequential for our design.

**7a. Instructions that flag the portfolio structure.** If the experiment's instructions describe the RPS mechanism in a way that emphasizes "you are choosing across all 20 rows simultaneously" or displays the compound structure abstractly, subjects may apply ROCL even in separated format. Mitigating via instruction design is possible but requires discipline — the subject should be told they face individual binary choices, with the payment mechanism mentioned but not elaborated as a compound object.

**7b. Memory and reconstruction.** A determined subject can in principle remember each row as it is shown and mentally reconstruct the compound lottery across all rows. B&H's separated-format null (p = 0.697) upper-bounds this effect in their data, but it is not theoretically closed and may be more or less important depending on task length, complexity, and pacing.

**7c. Sophisticated subjects who model the mechanism.** A subject who has explicit beliefs about the experimental design — e.g., "I bet they're showing rows one at a time so I won't reduce" — may try to compensate by pre-committing to a portfolio strategy executed row-by-row. In B&H's and C&K's subject pools this seems rare; the memory and cognitive requirements make it hard even for sophisticated subjects.

**7d. Within-row non-monotonicity.** The ROCL-triggering story is entirely about *cross-row* monotonicity — the compound lottery across 20 rows. Format does not address non-monotonicities that live *within* a single row (see §8). Separated format's null result in B&H 2018 is evidence against cross-row ROCL-driven violation; it is silent on within-row channels.

**7e. Preferences that violate monotonicity independently of ROCL.** The theorem in §2.3 says ROCL + non-EU forces monotonicity violation. The converse is not true. A subject whose preferences over acts directly violate monotonicity — e.g., because of bounded rationality, stochastic errors, or genuine act-level source preference — will produce non-monotone observed patterns regardless of format. Format addresses the ROCL path; other paths remain open.

## 8. The belief-elicitation wrinkle

B&H's experiment is over *risk preferences* with fully specified lotteries in each row. Our setting is *belief elicitation* with one ambiguous option per row (the event bet, whose winning probability is the subject's subjective belief π, even if π is induced by the experimenter).

Two questions arise:

### 8.1 Does the B&H result transfer to beliefs at the cross-row level?

The formal structure of the RPS is identical — both are RPS mechanisms with binary choices across rows and random-round payment. Azrieli et al.'s (2018) monotonicity is defined at the act level and does not depend on whether outcomes are monetary or probability-based. The ROCL-triggering mechanism should transfer cleanly: list format for belief MPL should make the portfolio salient; ROCL + non-EU subjects should violate monotonicity; separated format should close this channel.

Whether this transfer actually holds empirically is an open question (see ADR-0005 and the auxiliary-arm discussion in MPL analysis doc §8).

### 8.2 Is there a *within-row* non-monotonicity channel specific to beliefs?

The cross-row ROCL story does not address non-monotonicity that lives within a single row. In belief MPL, a single row compares:

- **Event bet:** pays $H if E occurs; winning probability π (subjective belief about E).
- **r-lottery:** pays $H with objective probability r.

Even at the single-row level, the subject faces a comparison between an ambiguous-probability option (the event bet) and an unambiguous-probability option (the r-lottery). An ambiguity-averse subject may systematically prefer the r-lottery over the event bet even when their belief π exceeds r — a within-row non-monotonicity that produces multi-switching in the observed MPL pattern regardless of format.

B&H's result does not speak to this. Their subjects compared known-probability lotteries row-by-row; there was no ambiguous option in either row. The ROCL-triggering mechanism addresses cross-row portfolio thinking, not within-row source preference.

For our design, this matters: separated format (via the B&H mechanism) closes the cross-row path to observed monotonicity violation. The within-row path from ambiguity aversion or source preference remains open and must be addressed separately — either by instruction design (emphasizing the objective basis of the induced belief), by explicit controls (e.g., screens that fix the subject's understanding of π before elicitation), or by measuring and controlling for ambiguity aversion directly.

## 9. Implications for our design

Three takeaways:

1. **Separated format is the right choice for cross-row IC defense.** Not because it makes preferences monotone, but because it prevents the ROCL-triggering pathway that would otherwise convert subjects' non-EU preferences into observed monotonicity violations. This is B&H's finding, and it is the canonical mechanism we cite.

2. **Randomization quality and instruction discipline matter.** The ROCL-triggering pathway can be re-opened by instruction choices (emphasizing the compound structure) or by predictable row orderings (letting subjects anticipate and reconstruct the portfolio). Both are implementation requirements, not theoretical side-notes.

3. **Within-row non-monotonicity is a separate design problem.** The B&H mechanism does nothing about ambiguity aversion or source preference at the row level, which is a real concern for belief elicitation (event bet vs. r-lottery). If this matters for our inference, it needs a separate mitigation — likely in instruction design, belief-induction mechanics (urn draw transparency), or an auxiliary control for ambiguity preference.

## 10. Open questions

Questions this argument does not settle, worth flagging if we go further:

- **Empirical transfer to beliefs.** B&H's p = 0.697 null is a risk-preference result. Does separated format produce the same null for belief MPL? An auxiliary within-subject list-vs-separated arm (MPL analysis doc §8) would answer directly.
- **Within-row ambiguity channel.** How much of the observed multi-switching in belief MPLs (C&K 2025: 29.7% attentive, 43.7% full sample) is attributable to within-row ambiguity vs. within-row attention/comprehension error? Process data (response time, navigation pattern) might help partition.
- **Instruction variants and ROCL triggering.** Do HH-style instructions (chips-in-a-bag analogy, per ADR-0010) suppress portfolio framing more effectively than HS-style enumerated-case instructions? Plausible but untested.

---

## 11. Cross-references

- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (the shorter exposition this doc elaborates)
- `quality_reports/mpl_format_decision_analysis.md` :: §6 "Does Brown & Healy Transfer to Beliefs?" (the belief-specific transfer question — §8 above)
- `experiments/designs/decisions/0014_mechanism-invariance-framing-only.md` (the decision this doc grounds)
- `experiments/designs/decisions/0005_bh-monotonicity-belief-transfer.md` (the assumption the design rests on)
- Brown & Healy (2018), *AEJ: Micro* — the empirical basis and the verbatim conjecture in §1
- Azrieli, Chambers & Healy (2018) — the formal monotonicity definition and IC result for RPS
- Segal (1990) — the theoretical background on ROCL + non-EU + monotonicity joint inconsistency
