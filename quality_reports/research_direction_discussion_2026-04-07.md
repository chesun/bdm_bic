# Research Direction Discussion — April 7, 2026

**Context:** After reading 23 papers and building the mechanism taxonomy, we reformulated the research hypotheses (Section 6 of `research_ideas_bdm_bic.md`). Christina raised 7 substantive corrections/questions. This document records the discussion and tracks open issues.

---

## Point 1: The "three sub-mechanisms" of comprehension failure

**Christina's correction:** The three sub-mechanisms I listed — contingent reasoning failure, game-form misconception, payoff function opacity — are not really three distinct things.

**Resolution:**

- **Payoff function opacity = contingent reasoning failure.** If you can't evaluate what happens at each possible random number r, that IS contingent reasoning failure, described from the payoff side. Collapse into one.
- **Game-form misconception has no known belief analog.** In value BDM, subjects confuse it with a first-price auction (shade your bid). For belief BDM, there is no equivalent — there is no "first-price auction for beliefs." Whether subjects confuse belief BDM with some other game form is an open empirical question, but no paper has identified a specific misconception.
- **Updated framing:** The comprehension failure for belief BDM is primarily **contingent reasoning failure** — the inability to reason through the threshold structure (if p ≥ r, event bet; if p < r, r-lottery) across all possible r simultaneously. The UJS framework (Chakraborty & Kendall 2025) and the "not obviously dominant" result (Tsakas 2019) both formalize this same bottleneck from different angles.

**Status:** RESOLVED. Use "contingent reasoning failure" as the single comprehension mechanism.

---

## Point 2: MPL implementation choices for beliefs

**Christina's point:** There are multiple ways to implement MPL for beliefs, each with different implications. The Holt & Smith LC is two-stage (coarse → fine). You can also do all rows at once, or one row at a time (separated, per Brown & Healy 2018).

**Options identified:**

| Implementation | Description | Pros | Cons |
|---|---|---|---|
| **Full 100-row list** (one screen) | All rows visible simultaneously | Complete information; closest to theoretical MPL | Impractical; fatigue; Brown & Healy (2018) show list format may violate monotonicity |
| **Holt & Smith LC** (two-stage) | Coarse grid (11 rows, 10% increments) → fine grid (~10 rows, 1% increments) | Efficient (~20 choices); proven in value domain; 1% precision | Single crossover enforced (inflates consistency); IC caveat on row selection (must randomize from full grid per Healy & Leo 2025 Section 6.1.3) |
| **Burfurd & Wilkening TK** (two-stage titration) | Similar to LC with different interface | Tested for SBDM belief elicitation specifically | Slowest per period (40s); 17% "reverse reports" |
| **Separated** (one row per screen, random order) | Each binary choice shown independently, random order | Brown & Healy (2018): preserves monotonicity; closest to UJS ideal (each choice independently justifiable) | Very slow (100 screens); order effects; subjects may not realize choices are connected |
| **Coarse separated** (10-20 rows, one per screen, random order) | Random subset of comparisons, each shown independently | Faster; preserves separated format benefits | Coarser precision (5pp); subjects don't see the switching structure |

**Key tension:** The separated format is theoretically ideal (UJS, preserves monotonicity) but impractical for 100 rows. The LC is the proven practical compromise but uses a list format that Brown & Healy show can violate monotonicity (for risk preferences — see Point 3).

**One design option:** A coarse separated MPL — show 10-20 rows one at a time in random order (every 5th percentage point). Gets separated-format benefits while remaining practical. Precision is coarser (5pp) but sufficient for detecting BIC failures.

**Status:** OPEN. Design decision depends on how we resolve Point 3 (does Brown & Healy's monotonicity finding transfer to beliefs?).

---

## Point 3: Brown & Healy (2018) and monotonicity in belief elicitation

**Christina's point:** Brown & Healy study monotonicity for risk preference elicitation using an MPL over lotteries. That is materially different from belief elicitation. How does monotonicity translate?

**Analysis:**

**In Brown & Healy's setup:** Subjects choose between lottery pairs across 20 rows. Monotonicity means: getting your preferred lottery at one randomly-selected row, while holding all other rows fixed, is weakly preferred. Violated in list format (p=0.041), not in separated format (p=0.697).

**In belief elicitation:** The "rows" are comparisons between the event bet (pays \$H if E occurs) and objective lotteries at different probabilities (pays \$H with probability r). Monotonicity means: getting your preferred option at one randomly-selected comparison (event bet vs. r-lottery), while holding all other comparisons fixed, is weakly preferred.

**The structural parallel is exact** — in both cases, multiple binary choices with random selection for payment. The formal definition of monotonicity (Azrieli et al. 2018, Definition 2) applies identically.

**However, a key difference:** In risk preference elicitation, both options in each row have known probabilities (subjects compare two known lotteries). In belief elicitation, one option (the event bet) has a probability determined by the subject's belief — which may be uncertain or imprecise. This additional uncertainty could affect whether subjects treat rows as independent decisions. A subject who is unsure about their belief might look across rows to "figure out" their belief from the comparison structure, violating the independence needed for monotonicity.

**Bottom line:** We should note that Brown & Healy's finding is for risk preferences and the translation to beliefs is an assumption worth testing. If we use a list-format MPL, we should at minimum acknowledge this caveat. Using separated format (one row per screen) is the conservative choice that avoids the issue.

**Connection to Point 2:** If we use separated format, we avoid the Brown & Healy monotonicity concern. If we use the Holt & Smith LC (list format), we inherit the concern but can't resolve it without a separate test.

**Status:** OPEN. Affects the MPL implementation choice (Point 2).

---

## Point 4: Preference for control — the stronger within-mechanism argument

**Christina's point:** Even if preference for control somehow operates for objective events, because we're doing a direct test (same mechanism, varying incentive information), the control motive is constant across treatments and cannot confound the test.

**Formalized:**

**Argument 1 (design-level):** Urn draws are objective events — subjects have no agency, personal stake, or domain expertise. Control motives should not operate. (Based on Benoit et al. 2022, who show control operates specifically for self-beliefs about own performance.)

**Argument 2 (within-mechanism, STRONGER):** The Danz et al. BIC test structure neutralizes control even if it exists:
- **Condition 1 (info test):** BDM-full-info vs. BDM-minimal-info. Same mechanism, same event, same event bet. Any control motive is constant across both treatments — it affects the *level* of reports but not the *difference* between info and no-info. Control cannot confound the info test.
- **Condition 2 (pure-incentives test):** Subjects evaluate the incentive structure at specific contingencies. Any control motive would bias *uniformly* toward the event bet, but the test asks whether subjects *switch at the right threshold*. A uniform bias shifts the switch point but doesn't explain inability to identify the payoff-maximizing option.

**The combined argument:** (a) urn draws eliminate control by design, AND (b) even if residual control exists, it's constant across the treatment comparison and cannot confound either BIC condition. This is a much stronger statement than either argument alone.

**Status:** RESOLVED. Use both arguments in the paper. The within-mechanism argument (Argument 2) is the stronger and more novel contribution.

---

## Point 5: Tsakas OSP and the relationship to UJS

**Christina's point:** Point 6 under "what we now know" (Tsakas 2019, static BDM lacks obvious dominance) overlaps with the comprehension failure point. Also need to think carefully about OSP vs. UJS.

**Resolution:**

Both OSP and UJS formalize "BDM is cognitively hard" but from different angles:

| Property | What it means | BDM | MPL | Relevant for us? |
|---|---|---|---|---|
| **OSP** | Worst-case from dominant strategy ≥ best-case from deviation, at every info set | NO (Tsakas 2019) | Not tested | Less relevant — OSP requires dynamic format (clock) |
| **UJS** | Dominant strategy is the *only* justifiable action at each decision point | NO (C&K 2025) | YES | More relevant — explains MPL's advantage directly |

**Key fact:** OSP and UJS are **mutually exclusive** for binary allocation with 3+ types (C&K 2025, Proposition 2). No mechanism can be both.

**For our paper:** UJS is the more relevant concept because it directly explains the BDM-MPL comparison. In MPL, truth-telling is the only justifiable action at each row. In BDM, many non-truthful reports are justifiable. We cite Tsakas (2019) for the specific result that static BDM lacks obvious dominance (another angle on the same problem), and Chakraborty & Kendall (2025) for the UJS framework that explains why MPL helps.

**Updated framing for the paper:** Collapse the OSP/UJS discussion into the comprehension/contingent-reasoning section. The theoretical grounding is: BDM requires simultaneous contingent reasoning because (a) the dominant strategy is not obviously dominant (Tsakas 2019) and (b) many non-dominant actions are justifiable (C&K 2025 — BDM is not UJS). The MPL solves this by making each contingency a separate, independently justifiable binary choice (UJS).

**Status:** RESOLVED. Use UJS as the primary framework; cite Tsakas as supporting evidence.

---

## Point 6: H1 via Danz et al.'s two weak BIC conditions

**Christina's point:** H1 should be tested using the direct tests from Danz et al. (2024 JEP). BIC requires two weak conditions: (1) revealing incentives should lead to more accurate reports, and (2) when presented as a pure choice over incentives, subjects should choose the theoretical maximizer. We need to design around these, and Condition 2 is hard to operationalize for BDM.

**The two conditions:**

**Condition 1 (info/no-info test):** Straightforward. BDM-full-info vs. BDM-minimal-info (between-subjects). If providing incentive information does NOT increase accuracy (or decreases it), Condition 1 fails. This is what was previously H5 — now incorporated as H1a.

**Condition 2 (pure-incentives test / incentives-only test):** This is the hard one. For BQSR, Danz et al. strip away the belief and present the scoring rule's payoff as a pure choice between winning probabilities. For BDM, what is the analog?

### Options for operationalizing Condition 2 for BDM:

**Option A: Induced-probability scenario questions.**
Tell subjects: "The probability of Event E is exactly 70%." Then present specific contingencies:
- "The random number is 45%. You reported 70%, so you get the event bet (70% chance of \$H). If you had reported 40%, you'd get the 45% lottery. Which payoff do you prefer?"
- "The random number is 85%. You reported 70%, so you get the 85% lottery. If you had reported 90%, you'd get the event bet (70% chance). Which do you prefer?"

This tests whether subjects can identify the payoff-maximizing report at specific contingencies. Multiple scenarios needed to cover both sides of the threshold.

**Pros:** Directly tests understanding of BDM's incentive structure. Close to Danz et al.'s approach.
**Cons:** Each scenario is one contingency — doesn't test whether subjects can aggregate across contingencies. May be too easy (subjects can compare 70% vs. 45% without understanding the mechanism).

**Option B: The MPL as a decomposed Condition 2 test.**
Present the belief MPL with induced probabilities. Each row asks: "Event bet (70% chance) or X% lottery?" Correct switch point = 70%. If subjects get the MPL right, they've demonstrated they can identify the payoff-maximizing option at each contingency.

**Pros:** Natural decomposition of BDM's incentive structure. If subjects pass MPL but fail single-report BDM, the failure is about aggregation, not comprehension of incentives.
**Cons:** Changes the format — strictly, Condition 2 should use the same format (single report). The MPL is a different mechanism implementation, not a pure-incentives version of BDM.

**Option C: Single-report BDM with induced probabilities.**
"The probability is exactly 70%. Report a number 0-100. BDM will be applied." If subjects report 70%, they pass. Any deviation = failure.

**Pros:** Same format as the mechanism being tested. Closest to what Danz et al. do.
**Cons:** This is just our basic accuracy test — it conflates Condition 2 with the overall BIC test. It doesn't strip away anything to isolate the incentive structure.

**Option D: Direct lottery choice (within-subject diagnostic).**
After subjects complete the BDM, present them with the realized outcome: "You reported 65%. The random number was 40%. You got the event bet. Here are the two options you could have had: (A) Event bet: 70% chance of \$H [true probability shown], (B) 40% lottery: 40% chance of \$H. Do you prefer the option you received (A), or would you have preferred option B?"

Then for a different scenario: "You reported 65%. The random number was 80%. You got the 80% lottery. The alternative was the event bet (70% chance). Do you prefer what you got, or the alternative?"

**Pros:** Tests whether subjects can evaluate the incentives ex post, at realized contingencies. Simple binary choice. Can be done within-subject as a diagnostic after the main elicitation.
**Cons:** Ex post evaluation may differ from ex ante — subjects might understand the comparison after seeing the realization but not before.

**Option E: Hypothetical report comparison.**
"Suppose two people both know the probability is 70%. Person A reported 70%. Person B reported 50%. The random number drawn was 60%. Person A gets the event bet (70% chance of \$H). Person B gets the 60% lottery (60% chance of \$H). Who is better off?"

Follow up: "Now the random number is 80%. Person A gets the 80% lottery. Person B also gets the 80% lottery. Who is better off?"

And: "Now the random number is 55%. Person A gets the event bet (70% chance). Person B gets the 55% lottery. Who is better off?"

The correct pattern: Person A is weakly better in every scenario, strictly better when 50 < r < 70. This directly tests whether subjects understand that truthful reporting (weakly) dominates.

**Pros:** Closest to the "pure-incentives" spirit — strips away own reporting to evaluate others' payoffs. Tests understanding of dominance across contingencies.
**Cons:** Hypothetical; cognitively demanding; requires processing multiple scenarios.

### Current thinking:

The most promising approaches seem to be **Option A** (scenario questions, as a within-subject diagnostic) and/or **Option D** (ex post lottery choice). Option B (MPL) is interesting but changes the format, so it's better framed as testing H2 (format comparison) than as a pure Condition 2 test.

**The key insight:** Condition 2 for BDM may not have a clean single-task implementation like it does for BQSR, because BDM's incentive structure is inherently about a *threshold comparison across contingencies*, not a *single payoff function that can be displayed*. Any Condition 2 test for BDM must present subjects with specific contingencies and check whether they can evaluate the payoff consequences — which is itself a test of contingent reasoning.

**Status:** OPEN. This is the core design challenge. Need Christina's input on which operationalization is most convincing.

---

## Point 7: H5 is Condition 1 of BIC

**Christina's correction:** H5 (info effect) is the first weak condition for BIC per Danz et al. It should be a sub-part of H1, not a standalone hypothesis.

**Resolution:** Agree completely. The restructured hypothesis framework:

**H1: BDM fails BIC.** Tested via two conditions:
- **H1a (Condition 1 / info test):** Providing full information about BDM's incentive structure does NOT increase accuracy relative to minimal information ("report accurately"). This is the old H5.
- **H1b (Condition 2 / pure-incentives test):** Subjects cannot identify the payoff-maximizing option when presented with pure incentive choices. [Operationalization TBD — see Point 6]

**H2:** Belief MPL achieves better behavioral IC than single-report BDM, despite implementing the same mechanism.

**H3:** The failure is driven by contingent reasoning failure — inability to reason through all possible realizations of r simultaneously.

**H4:** The BDM-MPL gap widens with task complexity (prior beliefs vs. posterior beliefs requiring Bayesian updating).

**Status:** RESOLVED. H5 → H1a.

---

## Updated Hypothesis Structure (v5)

| Hypothesis | Statement | Test | Key comparison |
|---|---|---|---|
| **H1** | BDM fails BIC | Two-condition direct test (Danz et al. framework) | — |
| H1a | Info about incentives does NOT increase accuracy | BDM-full-info vs. BDM-minimal-info | Between-subjects |
| H1b | Subjects cannot identify the payoff-maximizer under BDM incentives | Pure-incentives test [operationalization TBD] | Within-subject diagnostic |
| **H2** | MPL achieves better behavioral IC than BDM despite theoretical equivalence | BDM vs. belief MPL (induced probabilities) | Between-subjects |
| **H3** | The failure is contingent reasoning failure | Error patterns, quiz mediation, response time | Mediator analysis within BDM arm |
| **H4** | BDM-MPL gap widens with task complexity | Easy (priors) vs. hard (posteriors) × mechanism | Within-subject × between-subjects |

---

## Remaining Open Questions

1. **How to operationalize Condition 2 (H1b) for BDM?** See Point 6 options A-E above. Need to decide.
2. **Which MPL implementation for the belief MPL arm (H2)?** See Point 2 options. Key tension: separated format (theoretically ideal) vs. Holt & Smith LC (practically proven).
3. **Does Brown & Healy's monotonicity finding transfer to beliefs?** See Point 3. Affects MPL implementation choice.
4. **Should we include a flat-fee arm?** The current design has BDM-full-info, BDM-minimal-info, and MPL. A flat-fee arm would provide the no-mechanism benchmark. Is it worth the additional cost (150 more subjects)?
5. **How many belief elicitations per subject?** Need enough for power but not so many as to cause fatigue. The within-subject complexity variation (easy vs. hard) requires at least some of each.
