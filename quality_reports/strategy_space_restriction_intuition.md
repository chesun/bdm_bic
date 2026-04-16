# Intuition: Why Separated Random-Order Format Restricts the Strategy Space

**Purpose:** Deep exposition of the claim in Section 3.5 of `mpl_format_decision_analysis.md` — that separated format does not change subjects' preferences but *restricts the strategy space* so non-monotone preferences cannot be expressed in observed behavior. The claim is load-bearing for any IC defense built on separated-format MPL (ADR-0014); it is worth making sure we actually understand it rather than accepting it as shorthand.

**Status:** Draft for Christina's interrogation. Written 2026-04-15 in response to the request "think more deeply about why separated format restricts strategy space so non-monotone preferences cannot be expressed."

---

## 1. The claim, precisely

Two statements that are easy to blur together:

- **(A) Weak claim.** Separated random-order format prevents subjects from *observationally* violating monotonicity. Their revealed acts look monotone even if their underlying preferences are not.
- **(B) Strong claim.** Separated format makes subjects' underlying preferences monotone.

Only (A) is defended here. (B) is false and we do not need it. The argument is entirely about *what acts the subject can reach* given the decision problem's information structure — not about what preferences the subject holds over those acts.

## 2. What monotonicity violation requires at the preference level

Recall the acts/outcomes distinction (MPL analysis doc §3.1):

- An **outcome** is a terminal consequence ("win the event bet," "win \$15").
- An **act** is a mapping from states of the world to outcomes — a complete contingent plan. "Choose risky at row 1, safe at row 2, …, safe at row 20" is an act over 20 rows.
- **Monotonicity** (Azrieli et al. 2018) is a restriction on *how act-preferences relate to outcome-preferences*: improving any state's outcome (weakly) improves the act.

A subject whose preferences *violate* monotonicity prefers some act **a** over some act **a'**, where **a'** is obtained from **a** by replacing one row's outcome with a weakly preferred outcome. Concretely: there exists a *portfolio-level* preference pattern that cannot be built from row-by-row outcome comparisons.

**The operational fact:** to *act on* such a preference, the subject must pick an act — not an outcome. They must commit to a complete contingent plan across rows. Their non-monotone preference over acts has to translate into a non-monotone sequence of row-level choices.

## 3. Portfolio strategies require two things to be implementable

To implement a portfolio-level strategy — e.g., "risky at rows 1–7, safe at rows 8–14, risky at 15–20" as a hedge against compound-lottery variance — a subject needs:

1. **Information:** knowledge of which rows exist, what decision each row asks, and (in general) what they've already decided on earlier rows. Without this, they cannot tell which row they're currently on in the portfolio.
2. **Coordination across rows:** the ability to treat the 20 decisions as a single joint optimization rather than 20 independent problems. The joint optimization is what makes the portfolio pattern coherent.

A portfolio strategy is a mapping from *row-index* to *action*. Implementing it requires the subject to be *able to track the row index*, *able to condition on it*, and *able to anticipate what comes next* (or at least to know the set of upcoming rows).

## 4. How list format provides both

In list format (Holt-Smith, Holt-Laury):

- All 20 rows are visible on a single screen.
- Rows are presented in a fixed order (typically monotone in one parameter).
- The subject can scan the whole list before committing.
- The subject can revise earlier choices before submitting.

This gives subjects:

- **Complete information** about the structure of the decision problem.
- **Full coordination** across rows — they can see their full response vector and evaluate it as a portfolio.

A subject with non-monotone preferences can *implement* their preferred portfolio: if they want the hedge pattern "risky–safe–risky" with switching at rows 5 and 15, they simply fill out the list that way. The list format makes the portfolio-level act directly selectable.

## 5. How separated random-order format denies both

In separated random-order format:

- Exactly one row is shown per screen.
- The order is randomized (and not disclosed to the subject in advance).
- The subject cannot see previous rows' choices once submitted.
- The subject cannot revise after submitting.

At the moment of decision on any single screen, the subject knows:

- Which row they are *currently* on (content of the current row).
- That there are other rows, but *not which one comes next*.
- Not what they've done on past rows (no display), and not what comes on future ones.

**The subject can still have** whatever non-monotone preference they had before. What they *cannot do* is act on it strategically, because:

- They cannot condition current action on row index (index is scrambled).
- They cannot condition on past or future rows (not observable).
- They cannot coordinate — there is no place to write down a full portfolio plan and execute it in pieces, because the execution order is not controlled by the subject.

Any attempt to implement a portfolio strategy would require the subject to *guess* the row order and *remember* past choices. Both are possible in principle but hard in practice (see §9 on limits). In the limiting case of perfect randomization and zero memory, the only implementable strategy is:

> At each row, choose the action that is best for *this row alone*, based on outcome-preferences for the two options on this row.

That strategy is, by definition, monotone. Row-local optimization on outcome-preferences yields a monotone sequence because each row's choice is determined by the same outcome-preference relation applied independently.

## 6. The formal shape of the restriction

Let 𝒜_list be the set of acts achievable in list format, and 𝒜_sep the set achievable in separated random-order format. Both are subsets of the abstract space of 2²⁰ possible response patterns.

**Claim.**

1. 𝒜_list = {all 2²⁰ response patterns} — the subject can implement anything.
2. 𝒜_sep ⊂ {response patterns consistent with row-local optimization on stable outcome-preferences} — the subject can only implement monotone patterns.
3. Therefore 𝒜_sep ⊊ 𝒜_list, and the difference is exactly the non-monotone patterns.

The subject's *preferences* over 𝒜_list are unchanged between the two formats. What changes is the **feasible set**. Restricting the feasible set from 𝒜_list to 𝒜_sep mechanically forces observed behavior into the monotone subset.

This is a pure *decision-problem* argument, not a preference argument. It is analogous to: "A subject who loves fresh fruit still loves fresh fruit in a convenience store that sells none, but their observed purchases will be chips." Preferences are unchanged; the choice set is restricted; the observed behavior changes accordingly.

## 7. Worked example — an ambiguity-averse subject

Imagine a subject whose preferences are compound-lottery averse. Given the choice between two acts:

- **Act A:** risky at every row (compound lottery with high variance across rows).
- **Act B:** alternating risky/safe (compound lottery with lower variance).

The subject strictly prefers **Act B** to **Act A**, even though at some individual rows, Act A's row-choice is weakly outcome-preferred to Act B's row-choice. This is a textbook monotonicity violation driven by ambiguity aversion.

**In list format.** Subject sees all 20 rows. Recognizes that the payment rule (RPS) induces a compound lottery. Prefers the hedged portfolio. Fills in the alternating pattern. Observed behavior = Act B. Non-monotone.

**In separated random-order format.** Subject sees row 7 first (say). Compares risky vs. safe at row 7 on outcome-preferences alone (they have no information about what other rows exist in what order). The row-7-local optimum is risky. Submits risky. Then row 14: row-14-local optimum is safe. Submits safe. Etc. Observed behavior = whichever pattern row-by-row outcome-preference produces. That pattern is monotone by construction.

The subject's *underlying* preference for hedging is unchanged. They simply cannot execute the hedge because the decision structure doesn't let them see or coordinate the 20 rows as a portfolio.

## 8. What this argument does NOT claim

To keep the defense clean, the claim is narrow. It does **not** assert:

- That subjects' preferences are monotone. They may not be. We just cannot observe the violation.
- That every non-monotone preference disappears from observed behavior. Within-row non-monotonicity (§9) can still produce non-monotone observed patterns.
- That separated format "solves" the IC problem in some absolute sense. It closes one empirical loophole (the observational expression of portfolio-level non-monotonicity). It does not guarantee that subjects pick the UJS-justifiable action at each row — that is a separate question (ADR-0013 on UJS).
- That preferences become monotone *when* RPS applies (the strong version (B) from §1). RPS is still a compound lottery under the hood; the subject's compound-lottery preferences are whatever they were.

## 9. Limits and loopholes

The argument has several known weak points, ordered roughly from least to most consequential.

**9a. Memory.** Subjects can, in principle, remember past choices. Over 15–20 random-order choices with short gaps between screens, perfect recall is plausible for a determined subject. A subject who tries to reconstruct their full response vector in working memory could partially restore portfolio awareness and implement (imperfectly) non-monotone strategies. In B&H's 2018 data, separated-format monotonicity violation was statistically indistinguishable from zero (p=0.697), suggesting the memory loophole is small in practice, but it is not theoretically closed.

**9b. Predictable order.** If row order is not sufficiently randomized, subjects can guess the next row and plan portfolio-wise. True uniform random ordering per subject is required; pseudo-random or blocked randomization weakens the restriction. This is a testable implementation detail.

**9c. Within-row non-monotonicity.** The separated-format argument only addresses *between-row* non-monotonicity (portfolio strategies). A subject can still be non-monotone within a single row — e.g., prefer the 40%-lottery to the event bet even when the event bet has higher winning probability, due to source preference or ambiguity aversion. Separated format does nothing about this. This is relevant for our design because the belief MPL's row-level comparison involves the event bet (ambiguous to some subjects) vs. the r-lottery (fully specified). Ambiguity aversion could tilt row-local choices regardless of format.

**9d. Mixed strategies / random play.** A subject who doesn't know what to do and randomizes gets behavior that is neither consistently monotone nor consistently non-monotone; separated format doesn't distinguish "strategic non-monotonicity" from "noise non-monotonicity." Both look like multi-switching. This is why ADR-0008 frames multi-switching as a descriptive outcome rather than an invalidation threshold.

**9e. Sophisticated subjects who model the mechanism.** A subject who has explicit beliefs about the structure of the experiment (e.g., "I bet they're showing me these one at a time to prevent me from hedging") could try to implement a pre-committed portfolio strategy anyway, playing their internally-calculated row's role at each screen. Realistically this is rare but not impossible. Mitigating via explicit instruction design (e.g., do not tell subjects the rows are related to a portfolio) is an implementation choice, not a theoretical closure.

## 10. Relation to B&H's empirical result

Brown & Healy (2018) show population-level monotonicity violation in list format (p=0.041) but not in separated format (p=0.697), for risk preferences. The theoretical argument above predicts this: separated format restricts the feasible set to monotone patterns, so population-level violation should disappear (up to noise and the loopholes in §9). The p=0.697 result is consistent with "the strategy-space restriction works," not with "subjects' preferences changed."

One subtle point: B&H's result is about *population-level* violation, not individual-level. A population of subjects with heterogeneous non-monotone preferences will show more violation in list format (because each can implement their own non-monotonicity) than in separated format (because none can). But an individual subject might still have non-monotone preferences in separated format that we simply cannot detect.

For our H2 test, this is fine. We are testing whether *observed* belief MPL reports are closer to induced π than *observed* BDM reports. What matters is whether the MPL arm's observed data are consistent with subjects having identified the UJS-justifiable action at each row. Strategy-space restriction in separated format helps with this by eliminating one path to observed deviation (portfolio non-monotonicity).

## 11. Why this matters for our design

Three takeaways:

1. **Do not oversell.** If we defend a separated-format MPL choice on the grounds that "it makes the IC assumption hold," we are overclaiming. The honest defense is "it prevents the IC assumption's violation from expressing in observable behavior, which is what we need for the H2 comparison."
2. **Randomization quality matters.** The restriction only works if row order is genuinely unpredictable to the subject. This is an implementation requirement for the Qualtrics survey, not just a theoretical side-note.
3. **Within-row non-monotonicity is a separate design problem.** The strategy-space argument does not address ambiguity aversion or source preference at the row level. If these matter for our inference, we need a separate mitigation (e.g., stake-size calibration, framing, BDM comparison arm — which inherits the same within-row issue so the comparison is at least consistent).

## 12. Open questions

Questions this argument does not settle, worth flagging if we go further:

- **Quantifying the memory loophole.** Is there an empirical estimate of how much portfolio awareness subjects retain across ~20 random-order screens? B&H 2018 gives one upper bound (p=0.697 null); more targeted evidence would help.
- **Coarse vs. full separated.** Both are separated; the coarser version has fewer rows (and thus less memory demand), so the strategy-space restriction should be *stronger* in coarse separated (paradoxically). This is an argument *for* coarse over full separated that the Section 11 tentative recommendation has not emphasized.
- **Does the restriction extend to belief elicitation specifically?** The strategy-space argument is format-general. The question of whether belief-specific features (§6.3 of MPL analysis doc — subjective uncertainty, the "what should I report" problem) create a *within-row* path to non-monotonicity that separated format doesn't address is open.

---

## 13. Cross-references

- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (the shorter exposition this doc elaborates)
- `quality_reports/mpl_format_decision_analysis.md` :: §6 "Does Brown & Healy Transfer to Beliefs?" (the belief-specific transfer question)
- `experiments/designs/decisions/0014_mechanism-invariance-framing-only.md` (the decision this doc grounds)
- `experiments/designs/decisions/0005_bh-monotonicity-belief-transfer.md` (the assumption the design rests on)
- Brown & Healy (2018) reading notes :: the empirical basis
- Azrieli, Chambers & Healy (2018) reading notes :: the formal monotonicity definition
