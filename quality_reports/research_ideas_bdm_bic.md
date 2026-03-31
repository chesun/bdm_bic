# Gap Analysis & Research Ideas: BDM Behavioral Incentive Compatibility

**Date:** 2026-03-30
**Source:** Literature review at `quality_reports/lit_review_bdm_bic_2026.md` (scored 90/100)
**Paper draft:** `bdm_bic_paper/paper/main.tex`
**PI:** Christina Sun

---

## How This Document Is Organized

Section 1 maps the state of knowledge as of March 2026. Section 2 identifies gaps — what the literature does NOT know. Section 3 proposes five research directions, ranked by novelty and feasibility. Section 4 assesses how the existing pilot design maps onto these directions.

---

## 1. State of Knowledge (March 2026)

### What we know with confidence

| Claim | Evidence | Strength |
|-------|----------|----------|
| BSR fails both BIC conditions | Danz et al. (2022 AER, 2024 JEP); Agyeah et al. (2025 replication) | Strong — replicated |
| BDM value elicitation has game-form misconception | Cason & Plott (2014 JPE); Drichoutis & Nayga (2022 JEBO); Brown et al. (2025 SSRN) | Strong — multiple papers |
| Simplicity refinements (OSP, contingent protocols) do NOT clearly help BDM value elicitation | Brown et al. (2025); Chakraborty & Kendall (2022) | Moderate — lab only, value only |
| Flat-fee elicitation performs comparably to BDM/BSR for induced beliefs | Burdea & Woon (2022 J Econ Psych); Charness et al. (2021) | Moderate — online, specific tasks |
| Incentive effects on beliefs can be short-lived | Ersoy (2025 JBEE) | Suggestive — one study, one domain |
| Interface/presentation affects elicitation quality | Crosetto & de Haan (2023); Hu & Simmons (2024); Burfurd & Wilkening (2018) | Moderate-strong |
| 70% of subjects violate compound lottery reduction in BQSR | Dustan et al. (2023 WP) | Moderate — one study, lab |
| Multiple new mechanisms exist for eliciting belief distributions | Grapow (2026); Leo & Stelnicki (2025); Crosetto & de Haan (2023) | Growing — recent work |

### What we do NOT know

| Question | Status | Why it matters |
|----------|--------|----------------|
| Does BDM belief elicitation fail BIC? | **Completely untested** | BDM is the most theoretically attractive mechanism; if it also fails BIC, the problem is general |
| What mechanism should experimenters actually use for beliefs? | **No head-to-head comparison exists** | Every experimenter choosing a belief elicitation method is guessing |
| When do incentives help vs. hurt in belief elicitation? | **Fragmented evidence** | Determines whether complex IC mechanisms are ever worth their cognitive cost |
| Does BIC failure interact with task complexity? | **Untested** | Beliefs are most valuable in complex settings — exactly where mechanisms may fail most |
| Can better interfaces rescue BDM? | **Untested** | If interface fixes the problem, no new mechanism is needed |

---

## 2. Gap Assessment

I assess each gap on three dimensions:
- **Novelty** — Has this been done? How close is the nearest existing work?
- **Impact** — Would the answer change what experimenters do?
- **Feasibility** — Can this be done with online experiments on Prolific at reasonable cost?

### Gap 1: BDM Belief Elicitation Has Never Been BIC-Tested

**The single most obvious gap in the literature.** Danz et al. (2022, 2024) established the BIC framework and applied it to BSR. Their 2024 JEP paper explicitly discusses generalizing BIC testing to other mechanisms. Nobody has done it for BDM beliefs. The forward citation search (documented in the lit review) confirms this: no paper since Karni (2009) has subjected BDM belief elicitation to systematic BIC testing.

**Novelty:** HIGH in isolation (literally zero papers), but MODERATE as a standalone contribution because:
- The field's prior has shifted to "most complex mechanisms fail BIC"
- Danz et al. (2024) already expect BDM would fail — the question is *how* it fails
- Simply showing "another mechanism also fails" is confirmatory, not surprising

**Impact:** MODERATE standalone, HIGH as part of a larger design. If BDM fails BIC differently from BSR (e.g., boundary-biased rather than center-biased, as Burfurd & Wilkening 2018 suggest), that would be genuinely informative.

**Feasibility:** HIGH. This is exactly what the existing pilot design tests (Full Info vs. No Info vs. Flat Fee, with BDM). The infrastructure exists.

**Verdict:** Necessary ingredient but not a standalone paper in 2026.

### Gap 2: BIC Diagnostics Have Only Been Applied to BSR

**Existing mechanism comparisons ("horse races") are plentiful.** Multiple papers compare belief elicitation methods on accuracy:
- Trautmann & van de Kuilen (2015): 5 incentivized mechanisms vs. introspection
- Holt & Smith (2016): QSR vs. BDM direct vs. LC
- Burdea & Woon (2022): BSR vs. BDM vs. flat fee
- Grapow (2026): Money Method vs. Bet-Based vs. Introspective (for distributions)

**What does NOT exist:** applying Danz et al.'s BIC *diagnostic framework* to any mechanism other than BSR. The existing horse races ask "which mechanism is most accurate?" The BIC framework asks a different question: "do the mechanism's incentives actually work as designed?" These are not the same thing — a mechanism can produce accurate reports because subjects naively report their belief (ignoring the mechanism entirely), which looks good on accuracy but means the IC properties are irrelevant.

Danz et al.'s two diagnostic conditions are:
- (i) Does providing incentive information increase or decrease false reporting?
- (ii) In a direct choice over the mechanism's lottery menu, do subjects choose the theorized maximizer?

These have been applied to BSR only. Not to BDM, not to any other mechanism. The contribution is not "another horse race" but "do any mechanisms actually achieve behavioral IC, or is the entire IC enterprise failing?"

**Novelty:** HIGH for the diagnostic framework extension. LOW for mechanism comparison per se.

**Impact:** HIGH — but only if the paper's contribution is framed as "testing whether IC works" rather than "comparing accuracy." The accuracy comparison already exists.

**Feasibility:** MODERATE. Requires multiple mechanism arms. A focused BDM-only BIC test (Gap 1) is cheaper; adding BSR provides the comparison with Danz et al.'s existing results.

**Verdict:** Valuable if properly scoped. The contribution is the BIC diagnostic applied to new mechanisms, not the accuracy comparison. Must be honest that horse races exist and the novelty is in the diagnostic, not the comparison.

### Gap 3: When Do Incentives Help vs. Hurt?

The evidence is now converging from multiple directions:
- Danz et al. (2022): incentive information *hurts* for BSR
- Burdea & Woon (2022): no accuracy advantage for BDM or BSR over flat fee
- Ersoy (2025): incentive effects are *short-lived* even when initially positive
- Charness et al. (2021): introspection performs "surprisingly well"
- Gangadharan et al. (2024): incentives only matter when competing motivations exist
- Abeler et al. (2019): intrinsic truth-telling preferences are widespread

The emerging picture: incentives may be net negative for belief elicitation in most standard settings, because the comprehension cost exceeds the honesty benefit. But the literature has NOT tested this systematically. Nobody has cleanly identified *when* incentives help (competing motivations? high stakes? repeated interactions?) versus when they hurt (complex mechanisms? cognitively demanding tasks? naive subjects?).

**Novelty:** MODERATE-HIGH. The individual findings exist; the synthesis and systematic test do not.

**Impact:** VERY HIGH. This reframes the entire belief elicitation enterprise. The practical implication — "just use flat fee for most belief tasks" — would be enormously influential.

**Feasibility:** HIGH. The Full Info / No Info / Flat Fee comparison is already in the pilot design.

**Verdict:** Compelling framing for a paper, especially combined with Gap 2.

### Gap 4: Task Complexity x Mechanism Interaction

Does BIC failure worsen when subjects must also do something cognitively demanding (Bayesian updating)? The existing pilot already has this built in: subjects report priors (easy) and posteriors after signals (harder). But nobody has formally tested the interaction.

Theoretical prediction: limited cognitive resources split between mechanism comprehension and belief formation. When the task is hard, subjects either (a) give up on understanding the mechanism and report naively, or (b) give up on careful updating and report round numbers. Either way, the mechanism's IC properties matter less.

**Novelty:** HIGH. Ba, Bohren & Imas (2025) show complexity interactions in belief formation, but nobody connects this to elicitation mechanism failure.

**Impact:** MODERATE-HIGH. Important for interpreting all belief updating experiments that use IC mechanisms.

**Feasibility:** HIGH. The existing pilot design already varies task complexity (priors vs. posteriors).

**Verdict:** Strong complement to Gaps 1-3. Natural second dimension in a factorial design.

### Gap 5: Interface Effects on BIC

Crosetto & de Haan (2023), Hu & Simmons (2024), and Burfurd & Wilkening (2018) all show presentation matters. But nobody has tested whether a better interface (e.g., visual representation of the mechanism, interactive tutorial, click-and-drag) changes BIC outcomes.

**Novelty:** MODERATE. The components exist (interface research + BIC research) but the connection hasn't been made.

**Impact:** MODERATE. If a simple interface fix resolves BIC problems, that's practically important. But if it doesn't (as Brown et al. 2025 found for contingent protocols in value elicitation), it's a null result.

**Feasibility:** MODERATE. Requires developing interface variants, which is design work. Crosetto & de Haan provide free oTree/Qualtrics plugins that could be adapted.

**Verdict:** Interesting but risky. Better as a treatment arm than a standalone paper.

---

## 3. Research Directions (Ranked)

### Direction 1: "Does Any Belief Elicitation Mechanism Actually Achieve Behavioral IC?" (Gaps 1 + 2 + 3)

**Research question:** Do the incentives embedded in belief elicitation mechanisms actually work as designed, or does the entire IC enterprise fail for beliefs?

**Framing — why this is NOT just another horse race:**
Multiple papers compare mechanisms on accuracy (Trautmann & van de Kuilen 2015; Holt & Smith 2016; Burdea & Woon 2022; Grapow 2026). Accuracy comparisons are useful but cannot distinguish between two very different worlds: (a) subjects understand the mechanism and it drives truthful reporting, vs. (b) subjects ignore the mechanism and report naively, which happens to be roughly accurate because people have intrinsic truth-telling preferences (Abeler et al. 2019). The BIC diagnostic framework (Danz et al. 2022, 2024) is designed to distinguish these worlds — and it has only been applied to BSR.

The core contribution is applying the diagnostic framework to BDM (the most theoretically attractive mechanism that has never been BIC-tested) while including flat fee as a benchmark. This answers: are we paying a cognitive cost for IC properties that aren't actually operating?

**Design:** Between-subject, 2 mechanisms x 2 information levels + flat fee benchmark:

| | Full Incentive Info | Minimal Info ("rewards accuracy") |
|---|---|---|
| **BDM (direct report)** | Cell 1 | Cell 2 |
| **Flat Fee (introspection)** | — | Cell 3 |

Optional extension: add BSR arms (Cells 4-5) to replicate Danz et al. and enable direct BDM-vs-BSR BIC comparison within one study.

Plus a **BIC diagnostic** (Danz et al.'s condition ii): within-subject direct lottery choice task testing whether BDM subjects choose the theorized maximizer.

**Task:** Induced probabilities via urns + Bayesian updating. The updating component provides a within-subject task complexity variation (priors = easy, posteriors = hard) that tests Gap 4 for free.

**Primary outcomes:**
1. BIC condition (i): does incentive information increase false reporting under BDM? (The central test — extends Danz et al.'s finding from BSR to BDM)
2. BIC condition (ii): do subjects choose the theorized maximizer in the BDM lottery menu?
3. Accuracy comparison: BDM (full info) vs. BDM (minimal info) vs. flat fee
4. Misreporting patterns: center-biased (like BSR per Danz et al.) or boundary-biased (as Burfurd & Wilkening 2018 suggest for BDM)?
5. Task complexity interaction: do BIC failures worsen for posteriors vs. priors?

**Sample size (core design):** 3 cells x 150/cell = 450 subjects. ~$5,400 on Prolific.
**With BSR extension:** 5 cells x 150/cell = 750 subjects. ~$9,000.

**What makes this publishable:**
- First BIC test of BDM belief elicitation — the most obvious unfilled gap
- Tests whether IC properties are actually *operating* (not just whether reports are accurate)
- Flat fee benchmark answers the "do we even need incentives?" question (Gap 3)
- Task complexity interaction is genuinely novel (Gap 4)
- If BDM fails BIC *differently* from BSR (different misreporting patterns), that's diagnostic of different cognitive mechanisms

**What does NOT make this publishable (be honest):**
- "Another mechanism fails BIC" is confirmatory — the field expects this
- The accuracy comparison (BDM vs. flat fee) already exists in Burdea & Woon (2022)
- Without a theoretical contribution explaining *why* BDM fails (if it does), this risks being purely empirical

**Risk:** The most likely outcome — BDM fails BIC, flat fee performs comparably — is important but unsurprising. The paper needs a "so what" beyond documenting failure. Possible "so whats": (a) the misreporting patterns differ from BSR, revealing different cognitive mechanisms; (b) the task complexity interaction shows IC matters less as tasks get harder; (c) the lottery choice diagnostic reveals what subjects think BDM does (misconception typology).

**Novelty:** 7/10 | **Impact:** 8/10 | **Feasibility:** 9/10

---

### Direction 2: "The Cognitive Cost of Incentive Compatibility" (Gap 3 + Gap 4)

**Research question:** When does the cognitive cost of implementing a TIC mechanism exceed its honesty benefit?

**Design:** 2x2 factorial (mechanism complexity x task complexity):

| | Simple task (induced priors) | Complex task (Bayesian updating) |
|---|---|---|
| **Complex mechanism (BDM with full info)** | Cell 1 | Cell 2 |
| **Simple mechanism (flat fee)** | Cell 3 | Cell 4 |

**Key hypothesis:** The BIC gap (Cell 1 vs. Cell 3) is smaller than the BIC gap (Cell 2 vs. Cell 4). That is, the cost of mechanism complexity is amplified when the task is also complex.

**What makes this publishable:**
- Novel interaction test (nobody has crossed mechanism complexity with task complexity)
- Clean theoretical prediction (cognitive resource competition)
- Policy implication: incentivized elicitation may be actively harmful in complex settings, exactly where beliefs matter most
- Parsimonious design (4 cells, ~400 subjects, ~$4,800)

**Risk:** The interaction may be small or null. Mitigation: main effects are still informative (BDM vs. flat fee comparison is Gap 1).

**Novelty:** 8/10 | **Impact:** 8/10 | **Feasibility:** 9/10

---

### Direction 3: "Beyond Point Estimates: A Practical Guide to Belief Distribution Elicitation" (Gap 2 variant)

**Research question:** Which method for eliciting belief distributions is most accurate, easiest for subjects, and most robust to preference assumptions?

**Design:** Between-subject comparison of:
1. Quantile price list (Leo & Stelnicki 2025)
2. Bet-Based Method (Grapow 2026)
3. Click-and-drag distribution (Crosetto & de Haan 2023)
4. Introspective bins (standard)

All applied to the same induced-probability task with known ground truth.

**What makes this publishable:**
- Growing demand for distribution elicitation (inflation expectations, risk perceptions)
- No existing head-to-head with these specific methods
- Practical: could include a "recommended method" based on results

**Risk:** Grapow (2026) partially addresses this. The marginal contribution over her paper needs to be clear (e.g., adding IC diagnostics, using different tasks, comparing to newer methods she doesn't include).

**Novelty:** 6/10 | **Impact:** 7/10 | **Feasibility:** 7/10

---

### Direction 4: "The BDM-Specific BIC Test" (Gap 1, Standalone)

**Research question:** Does BDM belief elicitation satisfy behavioral incentive compatibility?

This is the original paper, essentially — the Danz et al. test applied to BDM. The existing pilot design already implements this.

**What makes this publishable:**
- Direct gap-fill: literally nobody has done this
- Clean, interpretable design

**What limits it:**
- Incremental: applies an existing framework to a new mechanism
- The answer is likely "no" — confirmation bias concern
- Doesn't tell experimenters what to use instead

**Novelty:** 5/10 | **Impact:** 5/10 | **Feasibility:** 10/10

---

### Direction 5: "Can You Fix BDM?" (Gap 5 + Gap 1)

**Research question:** Can interface or instructional interventions restore behavioral incentive compatibility in BDM belief elicitation?

**Design:** BDM with full info, varying the presentation:
1. Standard text instructions (baseline)
2. Contingency-framed explanation (Martin & Munoz-Rodriguez 2020 style)
3. Interactive tutorial with practice and feedback
4. Visual/graphical mechanism representation

**Risk:** HIGH. Brown et al. (2025) found contingent protocols didn't help for value BDM. The prior should be pessimistic. But the belief version is different enough that it's worth testing.

**Novelty:** 6/10 | **Impact:** 7/10 (if positive) / 4/10 (if null) | **Feasibility:** 6/10

---

## 4. How the Existing Pilot Maps Onto These Directions

The 2022 pilot tested:
- BDM direct elicitation only (no mechanism comparison)
- 3 treatments: Full Information, No Information, Introspection with Payment
- Urn task with Bayesian updating (4 events, 2 signals each)
- Online via Prolific/Qualtrics

**Strengths to keep:**
- The Full Info / No Info / Flat Fee structure is Danz et al.'s BIC condition (i) — good
- The urn/updating task provides task complexity variation naturally
- Online/Prolific is cost-effective and scalable

**What to add for the recommended Direction 1:**
- Add BSR arm (to compare BDM vs. BSR vs. flat fee)
- Add Danz et al.'s BIC condition (ii): the direct lottery choice diagnostic
- Fix randomization issues from the pilot
- Increase power (the pilot was underpowered)

**What to change:**
- Consider dropping the "No Information" treatment (where BDM is used but incentives aren't explained). This cell is the least interesting — subjects are under BDM but don't know it, which is an unusual real-world scenario. Replacing it with BSR gives more value.
- Consider adding response time measurement (free diagnostic, follows Brocas et al. 2025)
- Consider adding comprehension quiz (mediator analysis)

---

## 5. Recommended Path Forward

**Primary recommendation: Direction 1 (Horse Race)** — combine the BDM BIC test with a mechanism comparison including BSR and flat fee, all with BIC diagnostics, on the existing urn/updating task.

**Before committing to a design:** Run `/discover interview` to pressure-test these ideas interactively and develop a full research specification. Then `/design experiment` for the 14-step inference-first design checklist.

**Timeline consideration:** Grapow (2026) and Leo & Stelnicki (2025) are very recent. If someone is working on a belief mechanism horse race with BIC diagnostics, it hasn't appeared yet. The window is open but may not stay open long.
