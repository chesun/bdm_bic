# MPL Format Decision Analysis: Format, Monotonicity, and Multi-Switching

**Date:** 2026-04-13
**Purpose:** Deep analysis of the MPL format decision for the belief-elicitation arm. Addresses Points 2 and 3 of the April 7 research direction discussion, plus the newly surfaced multi-switching problem that threatens H2.
**Status:** DRAFT — awaiting Christina's decisions on criteria in Section 10.

---

## 1. Why This Decision Is Load-Bearing

The MPL arm is the backbone of H2 ("MPL achieves better behavioral IC than BDM despite theoretical equivalence"). If the MPL arm is weak — whether because the IC assumption is violated, the data are uninterpretable, or the failure rate matches BDM — H2 collapses. And since H2 is the "positive" hypothesis of the paper (BDM fails, but here is a mechanism that works), the format choice is not a peripheral implementation detail. It is the difference between a paper that says "both mechanisms are broken" and one that says "decomposing the contingent reasoning demand rescues the elicitation."

Three things hinge on this choice:

1. **IC assumption** — does the format satisfy Azrieli-style monotonicity (or T-statewise monotonicity per Healy & Leo 2025) for belief elicitation?
2. **Interpretability** — can we recover a point estimate (or crossing region) for each subject, or will multi-switching make the data noise?
3. **H2 testability** — does the format give MPL a fair chance to outperform BDM, or does it saddle MPL with its own format-specific failure mode?

---

## 2. The Trilemma

We cannot simultaneously maximize all desiderata. Each format choice trades one against the others. Burden is separated into two dimensions: *cognitive burden* (how many binary choices the subject must make) and *navigation burden* (how many screens they must traverse). These are distinct — a 100-row full list is one screen but 100 choices; a full separated elicitation is 100 screens and 100 choices; a coarse separated elicitation is 10-20 of each.

| Desideratum | Full list (100 rows, 1 screen) | Holt & Smith two-stage LIST (coarse → fine list) | Full separated (100 rows, one per screen) | Coarse separated (10-20 rows, one per screen) |
|---|---|---|---|---|
| IC assumption holds | Weakened (Brown & Healy 2018 risk result; transfer to beliefs unknown) | Weakened (inherits list-format concern in both stages) | Preserved for risk; assumed to transfer to beliefs | Preserved (same as separated) |
| Interpretability (single crossing) | Enforced by design | Enforced by design | Not enforced — multi-switching possible | Not enforced — multi-switching possible |
| Cognitive burden (# choices) | High (100) | Moderate (~20) | High (100) | Low-moderate (10-20) |
| Navigation burden (# screens) | Low (1) | Low (2) | High (100) | Moderate (10-20) |
| Closeness to UJS ideal | Violates UJS (list visible) | Violates UJS (list visible each stage) | Closest to UJS | Close to UJS |
| Precision | 1pp (if full 100) | 1pp (from fine stage) | 1pp possible | 5pp if 20 rows |

The trilemma is real. No format wins on every row. The question is which trade-off is least damaging to the paper's contribution.

---

## 3. Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance

The interpretation of Brown & Healy, and of our own design choices, rests on a distinction that is easy to blur: the distinction between preferences over *outcomes* and preferences over *acts*. Getting this right is the difference between a clean design defense and a confused one.

### 3.1 Outcomes vs. Acts

In decision theory these are two different objects:

- An **outcome** is a terminal consequence — \$15, \$10, \$5, or in our context "win the event bet," "win the r-lottery."
- An **act** is a mapping from states of the world to outcomes — a complete contingent plan. "Choose risky at row 1, safe at row 2, ..., safe at row 20" is an act.

Preferences over outcomes are primitive: the subject either likes \$15 better than \$10 or not. Preferences over acts are derived — they depend on the subject's outcome-preferences *together with* the structure of the decision problem (what states exist, what the probabilities are, how outcomes map to states under each candidate act).

Monotonicity, probabilistic sophistication, expected utility, and reduction of compound lotteries are all *restrictions on how preferences over acts relate to preferences over outcomes*. They are not restrictions on outcome-preferences themselves. A subject who violates monotonicity has not changed their mind about \$15 vs. \$10; they have, for some decision problems, an act-preference that does not line up with the naïve row-by-row reading of their outcome-preferences.

### 3.2 What Mechanism Invariance Assumes

Brown & Healy's identifying assumption — mechanism invariance — says that the subject's preferences *over outcomes* do not change based on which payment mechanism the experimenter uses. Being told "we'll pay via RPS" versus "we'll pay row 14 only" does not shift the subject's fundamental taste for money.

Mechanism invariance is deliberately weak. It allows the optimal *action* at a given row to differ across mechanisms, because the *decision problem* that the row is embedded in is different. What it rules out is the possibility that the mechanism itself triggers a different preference regime (e.g., "seeing an RPS instruction makes me more cautious over money"). That would make the monotonicity test unidentifiable: differences in row-14 choices could be attributed to either monotonicity violation or to mechanism-induced preference shifts, and we could not tell them apart.

### 3.3 Why the Optimal Row-14 Action Can Differ, Even Under Mechanism Invariance

Consider the contrast:

- **Framed Control:** row 14 is the only payment-relevant row. The subject's action at row 14 fully determines their payoff. Choosing is simple — pick the option you prefer at row 14.
- **RPS:** row 14 is one of 20 payment candidates. The subject's action at row 14 determines their payoff *only with probability 1/20*. With probability 19/20 a different row's action determines it. The row-14 choice is now one component of a portfolio.

Outcome-preferences are identical in both cases: \$15 > \$10 > \$5. The decision problem is different.

Under monotonicity, the difference in decision problem is neutralized — improving row 14's outcome while holding other rows fixed is always weakly good, so the row-14 choice can be made in isolation, and Framed Control and RPS produce the same action.

Under non-monotone preferences it is not. Concrete example: an ambiguity-averse subject who dislikes compound-lottery variance. Under RPS, choosing risky everywhere gives a high-variance compound lottery. The subject prefers a hedged pattern — risky at some rows, safe at others — to smooth out variance. At row 14 specifically, they might now pick safe, *even though their outcome-preferences have not changed at all*. The row-14 action differs because row 14 is now embedded in a different decision problem, not because tastes over money changed.

### 3.4 The Causal Chain in B&H's List-Format Violation

1. Outcome-preferences are stable across RPS and Framed Control (mechanism invariance, assumed).
2. The decision problem at row 14 is different under RPS than under Framed Control (mechanical fact, not an assumption).
3. For some preferences (non-EU, non-ROCL, ambiguity-averse, prospect-theoretic, or simply subject to bounded-rationality errors), the optimal row-14 action differs across those two problems.
4. That difference is what B&H's row-14 choice comparison detects.

What B&H's test rejects is not an outcome-preference but a *restriction on how act-preferences relate to outcome-preferences* (monotonicity). Reduction of compound lotteries is one route to monotonicity violation, but so are ambiguity aversion, source preference, preference reversals, and straight cognitive mistakes. B&H's test does not distinguish among them and does not need to — the test is robust to why monotonicity fails, which is why reduction does not need to appear as an identifying assumption.

### 3.5 Why Format Matters

The role of presentation format now has a clean reading:

- In **list format**, the subject sees all 20 rows simultaneously. The compound structure of RPS is visible. Subjects with non-monotone preferences can identify and pursue portfolio-level strategies (such as hedging across rows). Non-monotone row-14 choices appear because the subject is actually optimizing at the portfolio level.
- In **separated format**, each row is shown in isolation in random order. The subject cannot see other rows and cannot form a portfolio-level strategy. Each row's choice is made as if it were the only one that mattered. This effectively collapses each row's decision problem into the Framed Control problem. Whatever non-monotone preferences the subject holds, they cannot be expressed in a separated-format choice — the observed pattern looks monotone.

Separated format does not change the subject's preferences. It restricts the subject's *strategy space* in a way that forces observed behavior to be consistent with monotonicity, even if the underlying preferences are not. We are not trying to make subjects' preferences satisfy monotonicity; we are building a decision problem in which they behave *as if* they did. This is the design principle the format recommendation rests on.

---

## 4. Multi-Switching: A Descriptive Outcome, Not a Threat

**Framing note (2026-04-14):** An earlier draft of this section treated multi-switching as an ex ante threat that could invalidate H2 if the rate exceeded some threshold. Following Chakraborty & Kendall (2025), we now treat multi-switching as a *descriptive outcome* — a rate to be measured and reported alongside other performance metrics, not a criterion for gating whether H2 can be tested. C&K 2025 report 29.7% multi-switching among attentive subjects and 43.7% in the full sample; reporting these rates directly (rather than declaring them fatal to interpretation) is now standard practice. The analysis in 4.1-4.4 still applies — it just describes *what multi-switching would tell us*, not *how high a rate would kill the paper*.

### 4.1 What multi-switching means

In a belief MPL, the subject answers a sequence of binary comparisons: "event bet vs. r-lottery" at various r. If the subject has a coherent belief π and follows the UJS-justifiable action at each row, the response pattern is monotonic: event bet for r < π, r-lottery for r > π, single crossing at π.

Multi-switching means the pattern is non-monotonic: event bet at r = 30%, r-lottery at r = 40%, event bet again at r = 55%. There is no π that rationalizes this pattern.

### 4.2 Empirical base rates

- **Holt & Laury (2002) risk MPL:** about 16% multiple switching.
- **Burfurd & Wilkening (2018) belief titration:** 17% "reverse reports."
- **Chakraborty & Kendall (2025) UJS field data:** MPL performs better than BDM in their experiments, but multi-switching rates are reported in the 10-20% range depending on subject pool and task complexity.
- **Brown & Healy (2018):** separated format shows zero pattern of monotonicity violation at the population level (p = 0.697), but individual-level consistency is not reported as a switching rate.

Planning number: assume 15-25% multi-switching in a belief MPL with induced probabilities, roughly doubling at higher task complexity (posterior beliefs requiring Bayesian updating).

### 4.3 Four mechanisms that produce multi-switching

Each has different implications for what multi-switching "means" for our hypotheses:

| Mechanism | What it is | Implies for H2 | Implies for H3 |
|---|---|---|---|
| **(a) Within-row comprehension failure** | Subject does not understand the single binary comparison on its own | H2 weakened — MPL fails for a reason unrelated to BDM's contingent reasoning problem | Not evidence for H3; this is a different bottleneck |
| **(b) Monotonicity violation (preference-level)** | Genuine Brown & Healy-style violation — subject's preferences are non-monotone across rows | H2 weakened — the IC assumption itself fails | Not H3; this is about preferences, not reasoning |
| **(c) Random error / inattention** | Subject clicks through without engaging; error rate constant per row compounds across rows | H2 weakened — MPL noise cancels its advantage | Not H3; orthogonal to the comprehension mechanism |
| **(d) Residual aggregation reasoning** | Subject *tries* to reason across rows — wonders "what is my overall belief?" — and second-guesses individual rows | H2 weakened — the MPL decomposition failed to stop subjects from aggregating | *Is* a flavor of H3 (contingent reasoning persists even when format decomposes), but not the form H3 predicts |

**The correction to my earlier claim:** net multi-switching in MPL does not support H3. H3 says BDM fails because of contingent reasoning across r. If MPL multi-switches too, the most parsimonious reading is that MPL is failing at its job of removing that demand — which threatens H2 (MPL > BDM), not supports H3.

The one way to recover some support for H3 from MPL multi-switching is mechanism (d) — subjects attempting to aggregate even in separated format. But this is hard to identify without process data (response time patterns, navigation patterns between rows, explicit post-task elicitation of strategy).

### 4.4 The interpretation problem is cleaner than I first suggested

If we define the MPL arm's task as "identify the UJS-justifiable action at each row, given an induced π = 70%," then:

- A single-crosser with switch near 70% has succeeded.
- A single-crosser with switch far from 70% has failed at identifying the optimal action (similar to a BDM subject who reports far from 70%).
- A multi-switcher has not produced interpretable data — we cannot compare their performance to BDM on the same accuracy metric.

The problem is not "we cannot recover a belief" (we do not need to, since π is induced). The problem is we cannot compare multi-switchers' accuracy to BDM accuracy on the same scale. This threatens the H2 comparison directly.

---

## 5. Accuracy Metrics Must Be Consistent Across Arms

If BDM and MPL are compared on accuracy, the accuracy definition must be operationally consistent. Three options:

### Option M1: Distance-based, conditional on single crossing

- BDM: |report − π|
- MPL (single-crossers): |crossing point − π|
- MPL (multi-switchers): excluded

**Problem:** Conditioning on single-crossing selects on success. If multi-switchers are the "worst" MPL subjects, this biases MPL to look better than BDM. The selection bias goes one way.

### Option M2: Binary success, multi-switching = failure

- BDM: "succeeds" if |report − π| < ε
- MPL: "succeeds" if single-crosses within ε of π; multi-switch = "fails"

**Pro:** Multi-switchers get coded symmetrically to BDM subjects who report far from π. Both are "failures to identify the UJS-justifiable action."
**Con:** Discards information about *how close* near-correct subjects are. Loses statistical power. Choice of ε is arbitrary.

### Option M3: Hybrid — continuous for single-crossers, categorical for everyone

- Report two numbers per arm:
  1. Success rate (binary, with pre-registered ε)
  2. Conditional accuracy (|distance| given success)
- Pre-register: primary test uses success rate; conditional accuracy is secondary.

**Pro:** Honest about the two dimensions; allows comparison on both.
**Con:** Two comparisons, potentially two different verdicts. H2 must specify which is primary.

**Tentative recommendation:** Option M3 with success rate (M2-style) as the primary. This is the most defensible against a referee who says "you threw out the hard cases."

### 5.1 What counts as BDM "failure"?

For the metric to be symmetric, we must also decide what BDM failure looks like. Candidates:

- |report − π| > ε (tolerance-based)
- report more than one standard deviation from π (distribution-based)
- report bunched at focal values (50%, 0%, 100%) — "refusal to report π"
- report > N percentage points from π, calibrated to what literature calls "substantial error"

The Danz et al. (2024) BIC framework uses both "more informative reports" and "choice of payoff-maximizer in pure-incentives." We should align our ε with the accuracy tolerance they use (roughly 5-10pp in their comparisons).

---

## 6. Does Brown & Healy Transfer to Beliefs?

This was Point 3 from April 7 — open question. The deeper reading now:

### 6.1 What Brown & Healy actually showed

For risk preferences (lottery comparisons across 20 rows), list format exhibits monotonicity violations (p = 0.041) and separated format does not (p = 0.697). Their interpretation: the list format reveals the structure of the mechanism in a way that enables hedging, compound-lottery manipulation, or preference reversals across rows.

### 6.2 Why it might transfer to beliefs

The formal structure is identical. Both are RPS mechanisms with one binary choice per row and random-round payment. Azrieli et al.'s (2018) monotonicity is defined at the act level and does not depend on whether the outcomes are monetary (risk) or probability-based (belief). If monotonicity is a property of preferences, and if that property fails in list format for reasons about format-induced reasoning (compound lottery, hedging), nothing about the outcome type should matter.

### 6.3 Why it might *not* transfer

Belief elicitation has one feature risk preference elicitation does not: **the event bet's winning probability is subjective (to the agent) even if induced (from the experimenter's view).** In Brown & Healy's risk setup, both options in a row have known probabilities. In belief MPL, one option's probability is π — the agent's belief. Even with induced π (urn draw), the agent may harbor some residual uncertainty about what the right answer "should" be.

This changes the hedging calculus: in risk MPL, hedging across rows only helps if you have specific preferences over compound lotteries (ambiguity, non-reduction). In belief MPL, a subject uncertain about their own belief might look at the list and try to "figure out" π from the structure (e.g., "if I say event bet for rows 1-7 and r-lottery for rows 8-20, that implies my belief is 35-40%, so do I actually believe 37%?"). This is a belief-specific path to non-monotone behavior.

The direction is ambiguous. A priori, I would guess the effect *at minimum* carries over and possibly *is stronger* for beliefs.

### 6.4 Implication

If Brown & Healy transfers, list format for belief MPL violates the IC assumption. If we use a list format and H2 holds (MPL > BDM), a referee can say "MPL's advantage may be because monotonicity is violated, not because of UJS." This is an inferential vulnerability.

**Conservative choice:** use separated or coarse-separated format, which avoids the concern regardless of whether the transfer holds.

**Permissive choice:** use list or LC format, and include a short "Brown & Healy-style" auxiliary test of monotonicity as a robustness check. If monotonicity holds in the belief version, the caveat disappears.

---

## 7. Format Options Re-Examined With These Lenses

### 7.1 Full 100-row list (one screen)

- **IC:** probably violates monotonicity (Brown & Healy transfer).
- **Interpretability:** high — single crossing can be enforced by forcing monotone responses.
- **Burden:** one screen, but cognitively dense; fatigue effects.
- **H2 vulnerability:** IC violation means any H2 result is vulnerable to the "monotonicity broke" objection.

**Verdict:** risky. Do not use unless we include a belief-specific monotonicity test.

### 7.2 Holt & Smith two-stage LIST (coarse list → fine list)

- **IC:** list-style; Brown & Healy transfer concern applies to both stages; additional concern from Healy & Leo (2025, Section 6.1.3) that IC on row selection requires randomizing from the full grid, not just the coarse grid.
- **Interpretability:** enforced single crossing at each stage; precise (1pp).
- **Burden:** about 20 choices; proven in value domain; modest fatigue.
- **H2 vulnerability:** same as 7.1 plus the row-selection concern.

**Verdict:** practical but inherits IC concerns. Would need auxiliary monotonicity test to defend.

### 7.3 Trautmann-van de Kuilen two-stage list (a.k.a. "TK"; used by Burfurd & Wilkening 2018)

Originated in Trautmann & van de Kuilen (2015, *Economic Journal*, "Belief Elicitation: A Horse Race among Truth Serums"). Burfurd & Wilkening (2018) adapt it as their "TK" treatment alongside HS and HH formats. Two-stage titration: stage 1 picks a 10-point range; stage 2 refines within it. Both stages use list format.

- **IC:** similar list-style concerns to Holt & Smith LC (7.2).
- **Interpretability:** Burfurd & Wilkening report 17% reverse reports under this format — substantial uninterpretable fraction.
- **Burden:** 40s per period is slow in B&W's implementation; only tested for short protocols.
- **H2 vulnerability:** the 17% reverse rate from the literature is a warning; may be a property of the TK visual framing specifically rather than the two-stage list structure per se.

**Verdict:** not an advance over Holt & Smith LC on any margin.

### 7.4 Full separated format (100 rows, one per screen, random order)

- **IC:** preserved per Brown & Healy; closest to UJS ideal.
- **Interpretability:** multi-switching not enforced; would expect 20-30% rate in belief context.
- **Burden:** 100 screens is prohibitive; subjects will disengage.
- **H2 vulnerability:** multi-switching rate could be high enough to invalidate H2.

**Verdict:** theoretically clean but operationally unworkable at 100 rows.

### 7.5 Coarse separated (10-20 rows, one per screen, random order)

- **IC:** preserved per Brown & Healy.
- **Interpretability:** multi-switching possible, but with 20 rows the rate should be lower than 100 rows (fewer opportunities); could still be 10-20%.
- **Burden:** 10-20 screens is tolerable.
- **Precision:** 5pp if 20 rows spanning 0-100%.
- **H2 vulnerability:** multi-switching must be handled with a pre-registered rule.

**Verdict:** best candidate on the IC/burden trade-off; precision loss is manageable.

### 7.6 Hybrid: coarse separated with consistency-check revise screen

- At the end of the 10-20 separated choices, show the subject their pattern and flag any inconsistencies.
- Allow revision (ideally once).
- Pre-register whether the pre-revision or post-revision response is the primary measure.

- **IC:** separated format preserves monotonicity, but the revise screen reintroduces list-style comparison.
- **Interpretability:** much higher single-crossing rate after revision.
- **Burden:** one extra screen.
- **H2 vulnerability:** the revise screen is a design choice that could be critiqued as "forcing" monotonicity. But if we pre-register both pre- and post-revision as separate analyses, we see both versions.

**Verdict:** worth piloting. The pre-revision data answer the UJS/monotonicity question; the post-revision data answer the recoverable-belief question.

### 7.7 Two-stage SEPARATED (coarse separated → fine separated)

- Stage 1: 10-20 coarse rows, one per screen, random order.
- Stage 2: 10 fine rows around the coarse crossing, still one per screen.
- Analogous to Holt & Smith LC but in separated format.

- **IC:** separated format preserves monotonicity per stage; Healy & Leo row-selection concern must be addressed by randomizing from the full grid.
- **Interpretability:** stage-1 inconsistency flags subject as multi-switcher; stage-2 refines if stage 1 was consistent.
- **Burden:** about 20-30 screens total.
- **Precision:** 1pp in stage 2.
- **H2 vulnerability:** the row-selection IC concern needs care (Healy & Leo 6.1.3).

**Verdict:** most theoretically defensible; highest burden among separated variants; probably worth it.

### 7.8 Instruction format is a separable decision

Presentation format (list vs. separated, coarse vs. fine) and *instruction format* (how the mechanism is explained to subjects) are orthogonal choices. Burfurd & Wilkening (2018) compare three instruction formats — HS (Holt-Smith, 936 words, 6 screens, formal case enumeration), HH (Hao-Houser, 397 words, 2 screens, "chips-in-a-bag" analogy), and TK (Trautmann-van de Kuilen, 391 words, 4 screens, two-stage titration with "Bucket Game vs. Lottery Game" visual).

Key findings:

- **Accuracy does not differ across the three instruction formats** (KW p = 0.546) once a comprehension quiz is included.
- **HH is the easiest and fastest to implement**: 850s total completion vs. 1089s (HS) and 1212s (TK); 305s on instructions alone vs. 480s (HS) (KW p < 0.001).
- **B&W's own recommendation:** use HH with a comprehension quiz and electronic delivery.

Implication for our design: whatever presentation format we choose in Sections 7.1-7.7, we should pair it with HH-style instructions (chips-in-a-bag analogy) rather than HS-style enumerated-case instructions. This is effectively free — same IC properties, much lower cognitive and time burden. The TK instructions are bundled with the TK presentation format (two-stage list), so not relevant for a separated-format arm.

This also means some of the per-format burden numbers in Section 2 are lower than stated if we adopt HH instructions — the coarse separated option (7.5) looks even more attractive once we assume HH-style instructions are used for each row.

---

## 8. The Brown & Healy Transfer Test as an Auxiliary Experiment

Regardless of main format choice, we may want a small auxiliary arm that directly tests whether monotonicity holds for belief elicitation in list format. This would be a contribution in itself, independent of the main BIC test.

**Design sketch:** adapt Brown & Healy's within-subject list-vs-separated comparison to belief MPL with induced probabilities. Test whether population-level monotonicity violation appears in list format but not separated format for beliefs.

**Cost:** modest additional sample (maybe 100-150 subjects).
**Benefit:** settles a literature question; supports whichever main-arm choice we make.

Decision: include or not? Depends on budget. Note as Open Question #6.

---

## 9. What Each Format Choice Commits Us To In The Paper

| Format | What we must defend | What we can claim |
|---|---|---|
| Full list | Monotonicity holds (or provide transfer evidence) | High precision; direct comparison to Holt & Smith literature |
| Holt & Smith LC | Monotonicity + full-grid row selection | Precision; practical continuity with value elicitation literature |
| Full separated | Operational feasibility (100 screens) | Cleanest IC defense |
| Coarse separated | Precision sufficient for BIC test | Clean IC defense; moderate burden |
| Coarse separated + revise | Pre-registered role of revise screen | Clean IC defense; high interpretability |
| Two-stage separated | Row-selection IC (Healy & Leo) | Best combination of IC, interpretability, precision |

---

## 10. Decision Criteria We Need To Lock In

Before choosing a format, Christina should commit to each of the following:

1. **Multi-switching reporting (positive, not normative).** Do not set an ex ante invalidation threshold. Treat multi-switching rate as a primary descriptive outcome in its own right, following Chakraborty & Kendall (2025) — who report multi-switching rates of 29.7% among attentive subjects and 43.7% in the full sample alongside their mechanism comparison.

    **Within the MPL arm, report:** (a) % single-crossers, (b) % single-crossers with crossing within ε of induced π, (c) % multi-switchers. Benchmark the multi-switching rate against C&K 2025.

    **For the H2 test (MPL vs. BDM):** compare only on the *comparable margin* — success rate, defined as % of subjects within ε of π (|report − π| < ε for BDM; single-cross within ε of π for MPL). There is no "multi-switching" analog in single-report BDM, since BDM yields one report per subject. We do not try to force an artificial analog.

    **Closest BDM-internal diagnostic** (reported descriptively, not compared to MPL multi-switching): focal and boundary reports (0, 50, 100), echoing B&W 2018's finding of 26% boundary reports without a comprehension quiz. Both multi-switching in MPL and focal/boundary reports in BDM are "coherent belief identification failed," but they are not structurally the same object and we do not claim they are. A tight analog would require repeated BDM elicitations at the same π within subject, which we are not currently planning.
2. **Accuracy metric. RESOLVED via criterion 1.** No separate metric choice needed. The framing is:
    - *For MPL:* report (a) multi-switching rate descriptively (C&K 2025 benchmark), (b) % single-crossers with crossing within ε of π, and (c) conditional accuracy among single-crossers (mean |crossing − π|, continuous).
    - *For BDM:* report (a) % within ε of π and (b) mean |report − π|. Also report focal/boundary-report rate as a parallel-in-spirit diagnostic (per B&W 2018).
    - *For H2:* compare on the comparable margin (% within ε of π) as the primary test, and on conditional accuracy (continuous) as secondary. Multi-switching and focal-report rates are reported descriptively but not directly compared (see criterion 1).

    This is close to the M3 hybrid proposed in Section 5, but with the asymmetry between MPL (three categories) and BDM (two categories + focal-report diagnostic) handled explicitly rather than forced into a symmetric coding. Section 5 is now effectively superseded by this combined criterion 1+2 framing; treat Section 5 as historical context for the reasoning.

3. **ε tolerance. ADOPT Danz et al. 2022's dual-metric approach.** Report two accuracy measures in parallel:
    - **False reports:** any report differing from the induced belief (ε = 0 — strict).
    - **Distant reports:** reports more than 5pp from the induced belief (ε = 5pp — substantial deviation).

    Both are direct adoptions from Danz, Vesterlund & Wilson (2022). The dual structure is informative: the false-report rate captures the full distribution of deviation (including small noise); the distant-report rate focuses on substantively meaningful errors. H2 is tested on both margins — MPL should dominate BDM on at least one (probably distant reports, if the story is about comprehension-driven large errors).

    **For MPL single-crossers:** map the crossing point into the same metric. False report = crossing ≠ π exactly; distant report = |crossing − π| > 5pp. Multi-switchers remain a separate descriptive category (criterion 1).
4. **Brown & Healy auxiliary test — include?** Adds 100-150 subjects; settles a literature question.
5. **Revise screen — include?** Must be pre-registered as primary or secondary analysis.
6. **Burden budget.** How many total screens across the experiment are we willing to impose? (Affects coarse vs. two-stage vs. fine decisions.)
7. **Precision requirement.** Is 5pp sufficient, or do we need 1pp? (5pp probably sufficient for a BIC test; 1pp only matters for point-belief recovery, which we do not need.)

---

## 11. Tentative Recommendation

Pending Christina's resolution of Section 10, a preliminary leaning:

**Primary MPL arm: coarse separated (15-20 rows, one per screen, random order), without revise screen.**

Reasoning:

- Preserves monotonicity per Brown & Healy (and side-steps the ambiguous transfer question).
- Closest to UJS ideal in spirit.
- Burden of 15-20 screens is tolerable given subjects are doing belief elicitation tasks that are already cognitively demanding.
- 5pp precision is sufficient for the BIC test (we are not trying to recover a point belief; we are testing whether subjects can identify the UJS-justifiable action).
- Multi-switching rate will tell us something real about H2, whichever direction it goes.
- Pre-registered accuracy metric: success = single-crosser within 5pp of induced π. Multi-switch = failure (same category as BDM subjects who report far from π).

**What this commits us to in the paper:**

- Clean IC defense (monotonicity preserved).
- An honest handling of multi-switching (not thrown out; counted as failure).
- No precision loss claim needed, because the BIC test does not require point-belief recovery.
- One short robustness section: "if multi-switchers are excluded rather than coded as failure, results are X" — to address the selection-on-success concern.

**What this does not give us:**

- Tight comparison to the Holt & Smith LC literature.
- 1pp precision.

Note: multi-switching is no longer framed as an invalidation threat (see Section 4 framing note and Section 10 criterion 1). Whatever rate we observe becomes a primary reported outcome, with C&K 2025's rates (29.7% attentive, 43.7% full sample) as the natural benchmark.

---

## 12. Related Design Note: p-BDM Incentive-Only Test

Although the incentive-only test (Condition 2 in the Danz-Vesterlund-Wilson framework) is logically distinct from the MPL format decision analyzed here, it is a parallel part of the same project (H1b) and interacts with the format choice. This section records what the JEP 2024 article tells us, and flags the gap our own design must fill.

### 12.1 What the JEP 2024 Article Does and Does Not Say About p-BDM

The JEP (Danz, Vesterlund, Wilson 2024, JEP 38(4), pp. 144-149) describes the incentives-only methodology *in detail for the Binarized Scoring Rule*. Table 1 (p. 145) shows an 11-option menu (A through K) corresponding to implied reports q ∈ {0.0, 0.1, ..., 1.0}. Each option is displayed as a pair of event-contingent winning probabilities (e.g., option B: 19% chance of \$8 if red, 99% if blue). Subjects pick an option; the implied q column is not shown. For induced belief θ, the maximizer is the option with q = θ.

For the p-BDM, the JEP reports only two substantive sentences (pp. 148-149):

1. *"Danz, Vesterlund, and Wilson (2024) show in an incentives-only test of the probabilistic Becker-DeGroot-Marschak mechanism that the vast majority of participants prefer choices that differ from the intended maximizer, indeed 69 percent of participants opt for the event-independent choice corresponding to reporting q = 0.0."*
2. At induced belief θ = 0.2, the no-info treatment has 7% of reports that are both distant and toward zero; the info treatment has 21%.

The full methodology for the p-BDM incentive-only test — menu structure, payoff display, induced-θ values beyond 0.2, sample details — is not in the JEP. The underlying working paper ("The Pure-Incentives Test: Applications to Proper Scoring Rules, Auctions, and Matching Markets") is listed on David Danz's website in a "Work in Progress" section with no draft attached and no public URL (as of 2026-04-14). A deep search across authors' pages, SSRN, NBER, RePEc, and citation trails turned up nothing beyond the JEP summary.

### 12.2 Why the Headline Finding Matters

The 69% result for p-BDM is the direct analog of DVW 2022's center-bias finding for BSR: under both mechanisms, subjects prefer the option whose winning probability is *event-independent*.

- BSR: event-independent payoff at q = 0.5 (centered report). Win probability 75% irrespective of event.
- p-BDM: event-independent payoff at q = 0.0 (extreme report). Win probability 50% irrespective of event.

The mechanism of failure is the same, but manifests at opposite ends of the report space — center for BSR, extreme for p-BDM. This is evidence that the underlying failure is preference for event-independent payoffs per se, not "center bias" or "extremeness aversion" as specific report-space phenomena.

### 12.3 What Our Project Needs to Design

Because DVW's p-BDM methodology is not publicly available, our own p-BDM incentive-only test must be designed from scratch. Open design questions for dedicated follow-up work:

- **Menu structure:** discrete (11 options à la BSR Table 1) or continuous (slider)? Discrete menus are concrete and interpretable; sliders match the p-BDM report format but lose the menu-choice framing.
- **Payoff display:** event-contingent winning-probability pairs (Table 1 style) or the p-BDM's native lottery structure (event bet vs. objective lottery with explicit r)? Different cognitive implications.
- **Induced θ values:** DVW reports only θ = 0.2. Covering 0.2, 0.4, 0.6, 0.8 (matching B&W 2018) is a natural and novel extension.
- **Integration with main arm:** within-subject (same subjects do both BDM elicitation and incentive-only test) or between-subject (separate arms)?
- **MPL counterpart:** whether to also run an incentive-only test for the MPL mechanism, creating a parallel-structure comparison. This is potentially the most novel contribution if DVW's WP does not already include it.
- **Sample size:** depends on expected effect size; DVW's 69% at θ = 0.2 is an anchor.

Deep design work on these questions is flagged as a separate TODO item — this section is only a placeholder record of the state of public knowledge.

---

## 13. Open Items Needing Christina's Judgment

1. All seven items in Section 10.
2. Whether to pilot the coarse separated format at small N (50-100) before committing.
3. Whether the revise-screen option (7.6) is worth the added complexity.
4. Whether the two-stage separated (7.7) is worth the extra burden for the precision gain.
5. Whether to include the Brown & Healy auxiliary arm (Section 8).
6. **Repeated BDM elicitations at the same induced π** — would enable a tight BDM analog to multi-switching (within-subject consistency across repetitions). Not decided. Two possible placements:
    - *Inside the main experiment* — cleanest comparison but significantly increases subject burden; may confound learning effects.
    - *As a post-main diagnostic treatment* — after the primary elicitation is complete, add a short repeated-measures module on a subset of subjects. Lower main-experiment burden, but results are on a different sample and not directly integrated with the primary H2 test.
    - Decision deferred; revisit once we've committed to the main-arm format and know how much burden budget remains.

---

## 14. Cross-References

- Research direction discussion: `quality_reports/research_direction_discussion_2026-04-07.md` (Points 2 and 3)
- Azrieli-Karni intuition: `master_supporting_docs/literature/reading_notes/intuition_azrieli_karni_connection.md`
- Mechanism taxonomy: `master_supporting_docs/literature/reading_notes/mechanism_taxonomy.md`
- Research ideas (hypothesis structure): `quality_reports/research_ideas_bdm_bic.md`
