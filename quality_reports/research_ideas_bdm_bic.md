# Gap Analysis & Research Ideas: BDM Behavioral Incentive Compatibility

**Date:** 2026-03-31 (v3 — major revision after reading Danz et al. 2024 JEP)
**Source:** Literature review at `quality_reports/lit_review_bdm_bic_2026.md` (scored 90/100)
**Reading notes:** `master_supporting_docs/literature/reading_notes/bdm_bic_2026-03.md`
**Paper draft:** `bdm_bic_paper/paper/main.tex`
**PI:** Christina Sun

---

## Critical Update (2026-03-31)

**Danz, Vesterlund & Wilson have a forthcoming paper that BIC-tests BDM.** Their JEP (2024) conclusion states: "Danz, Vesterlund, and Wilson (2024) show for the most used belief elicitation mechanisms (the classic and binarized quadratic scoring rule, and the probabilistic Becker-DeGroot-Marschak rule) that participants largely prefer payoffs different from the intended maximizer under the mechanism, and that information on the incentives increases the rate of false reports."

The paper is listed on David Danz's website as "The Pure-Incentives Test: Applications to Proper Scoring Rules, Auctions, and Matching Markets" (work in progress, with Vesterlund and Wilson). No draft is publicly available.

**What this changes:** The "most obvious gap" (BDM has never been BIC-tested) is being filled by the framework's creators. A standalone BDM BIC test is no longer a viable primary contribution. However:

- We don't know their design, sample, or implementation details
- Independent evidence from a different lab/design adds value
- The BIC test remains a necessary *component* — it grounds whatever else we build on top
- The *why* and *when* questions behind BIC failure are entirely open

**Also from Danz et al. 2024 JEP:** Benoit, Dubra & Romagnoli (2022) is cited for finding that "preference for control" drives false reports in probabilistic BDM — subjects prefer events they can influence. This identifies a specific behavioral channel beyond comprehension failure.

---

## How This Document Is Organized

Section 1 maps the state of knowledge. Section 2 identifies gaps. Section 3 proposes research directions, ranked. Section 4 assesses the existing pilot design. Section 5 recommends a path forward.

---

## 1. State of Knowledge (March 2026)

### What we know with confidence

| Claim | Evidence | Strength |
|-------|----------|----------|
| BSR fails both BIC conditions | Danz et al. (2022 AER, 2024 JEP); Agyeah et al. (2025 replication) | Strong — replicated |
| BDM (probabilistic) likely fails BIC too | Danz et al. (2024 JEP conclusion, forthcoming WP) | Previewed but not yet available |
| BDM value elicitation has game-form misconception | Cason & Plott (2014 JPE); Drichoutis & Nayga (2022 JEBO); Brown et al. (2025 SSRN) | Strong — multiple papers |
| Preference for control inflates BDM belief reports by 18pp | Benoit, Dubra & Romagnoli (2022 AEJ:Micro) | Strong — lab experiment, large effect size. Context: confidence elicitation (self-beliefs about own performance). 68%+ of measured "overconfidence" is control preference, not belief distortion. Asymmetric: subjects want to bet on doing WELL, not just on themselves. |
| Simplicity refinements (OSP, contingent protocols) do NOT clearly help BDM value elicitation | Brown et al. (2025); Chakraborty & Kendall (2022) | Moderate — lab only, value only |
| Flat-fee elicitation performs comparably to BDM/BSR for induced beliefs | Burdea & Woon (2022 J Econ Psych); Charness et al. (2021) | Moderate — online, specific tasks |
| Incentive effects on beliefs can be short-lived | Ersoy (2025 JBEE) | Suggestive — one study, one domain |
| Interface/presentation affects elicitation quality | Crosetto & de Haan (2023); Hu & Simmons (2024); Burfurd & Wilkening (2018) | Moderate-strong |
| 70% of subjects violate compound lottery reduction in BQSR | Dustan et al. (2023 WP) | Moderate — one study, lab |
| SBDM is more sensitive to cognitive heterogeneity than Introspection | Burfurd & Wilkening (2022 Experimental Economics) | Moderate — lab, SBDM amplifies differences in probabilistic reasoning ability but NOT general cognitive ability (Raven/CRT). No mechanism x ability interaction. |
| Descending Karni mechanism is OSP for beliefs (theory only) | Tsakas (2019 Games and Economic Behavior) | Theory — untested experimentally. Static and ascending Karni mechanisms are NOT OSP. Only the descending variant achieves obvious dominance. |
| Frequency method is simpler than Karni/BDM, preserves IC, reduces 50% focal bias | Schlag & Tremewan (2021 J. Risk & Uncertainty) | Moderate — one lab experiment. Trade-off: recovers bounds on beliefs, not point estimates. |

### What we do NOT know

| Question | Status | Why it matters |
|----------|--------|----------------|
| *Why* does BDM belief elicitation fail BIC? | **Completely open** | Danz et al. will document *that* it fails; nobody has identified the mechanism |
| Is it comprehension, preference for control, effort, or something else? | **Competing hypotheses, no clean test** | Different causes imply different remedies |
| Does BIC failure interact with task complexity? | **Untested** | Beliefs are most valuable in complex settings — exactly where mechanisms may fail most |
| When do incentives help vs. hurt? | **Fragmented evidence** | Determines whether complex IC mechanisms are ever worth their cognitive cost |
| What should experimenters actually use for beliefs? | **No clear recommendation exists** | The practical question everyone cares about |

---

## 2. Gap Assessment

### Gap 1: WHY Does BDM Belief Elicitation Fail BIC? (NEW — highest priority)

Danz et al.'s forthcoming paper will document *that* BDM (probabilistic) fails BIC. But *why* it fails is a completely open question with multiple competing hypotheses:

**Hypothesis A: Comprehension failure (Cason & Plott channel)**
Subjects misunderstand BDM's mechanism — they don't grasp the event-lottery vs. number-lottery structure. This predicts that comprehension interventions would help, and that more numerate/educated subjects would show smaller BIC gaps. Evidence from value BDM supports this (Cason & Plott 2014), but Brown et al. (2025) find that comprehension interventions don't help for value BDM. Mixed evidence.

**Hypothesis B: Preference for control (Benoit, Dubra & Romagnoli channel) — RULED OUT BY DESIGN**
Benoit et al. (2022, AEJ:Micro) find that subjects inflate beliefs by 18pp due to preference for control when eliciting self-beliefs about own task performance. The control motive is asymmetric (desire to bet on doing *well*, anti-control for doing badly). However, their evidence is entirely about confidence elicitation where subjects have a personal stake in the event. The references they cite for control in objective events (Goodie 2003; Goodie & Young 2007; Heath & Tversky 1991) concern domain competence/familiarity, not the kind of agency-free urn draws used in our paradigm. **Decision: Our urn-draw design rules out Hypothesis B by construction.** Subjects have no personal stake in which urn is selected, no ability to influence the outcome, and no domain expertise. If BDM still fails BIC in this setting, control cannot be the explanation. This is a feature, not a limitation — it's a clean "design by subtraction" (Danz et al. 2024) that eliminates one competing hypothesis, allowing us to focus on Hypotheses A, C, and D. No dedicated treatment arm needed.

**Hypothesis C: Effort/attention costs (Mamadehussene & Sguera channel)**
Subjects can't be bothered to think through the mechanism. They report naively and the complex incentive structure goes unused. This predicts that BIC failures would be similar across mechanism types (if subjects ignore all mechanisms equally) and that effort-inducing interventions would help more than comprehension interventions. Ersoy (2025) provides partial support: incentives initially increase effort but effects fade.

**Hypothesis D: Cognitive resource competition (novel)**
BDM comprehension and belief formation compete for the same limited cognitive resources. When the belief task is easy (induced probabilities), there's enough bandwidth for both. When the belief task is hard (Bayesian updating), the mechanism gets crowded out. This predicts an interaction: BIC failure worsens as task complexity increases. **Important caveat from Burfurd & Wilkening (2022, Experimental Economics):** They tested a related but distinct hypothesis — whether SBDM performance interacts with cognitive ability (Raven's Progressive Matrices, CRT). They found NO significant interaction between elicitation mechanism and cognitive ability/effort. SBDM is more sensitive to heterogeneity in *probabilistic reasoning* specifically, but not to general cognitive ability. This complicates the simple "cognitive resource competition" story, because if the binding constraint were general cognitive capacity, more able subjects should differentially benefit from SBDM. However, their design tests ability (a stable trait) not task complexity (a situational state), and they compare SBDM vs. Introspection rather than BDM with vs. without incentive information. Our proposed test — varying task complexity within-subject while holding ability constant — is distinct from and complementary to their approach.

**Why identifying the mechanism matters:** Different causes imply different remedies. If it's comprehension → simplify the mechanism or use MPL/frequency method. If it's effort → make incentives more salient or use flat fee. If it's cognitive competition → use simpler mechanisms for complex tasks. (Preference for control is ruled out by our urn-draw design.)

**Novelty:** VERY HIGH. Nobody has identified why BDM fails BIC. The forthcoming Danz et al. paper documents failure but (based on the JEP preview) doesn't appear to run mechanism-identification treatments.

**Impact:** VERY HIGH. Moves the field from "BIC fails" to "here's why and here's what to do about it."

**Feasibility:** MODERATE-HIGH. Requires carefully designed treatment arms that isolate channels. More complex than a simple BIC test, but tractable.

### Gap 2: Task Complexity x Mechanism Interaction (Hypothesis D)

Does BIC failure worsen when subjects must also do something cognitively demanding? The existing pilot already builds this in: subjects report priors (easy — just count urns) and posteriors after signals (harder — requires Bayesian updating). But nobody has formally tested the interaction.

This is a clean test of Hypothesis D above. It also has a strong practical implication: belief elicitation is most valuable in complex settings (Bayesian updating, strategic environments, forecasting). If IC mechanisms fail *more* in exactly these settings, experimenters are paying a cognitive cost for nothing.

**Novelty:** HIGH. Ba, Bohren & Imas (2025) show complexity interactions in belief formation, but nobody connects this to elicitation mechanism failure.

**Impact:** HIGH. Changes the practical recommendation for every belief updating experiment.

**Feasibility:** HIGH. Built into the existing design for free.

### Gap 3: BDM-Specific BIC Test (Independent Evidence)

Danz et al.'s forthcoming paper covers this, but:

- Their paper is not available — we don't know their design, implementation, or specific results
- Independent evidence from a different design/setting adds robustness
- Different implementations of BDM (e.g., urn task vs. confidence elicitation, online vs. lab) may produce different results
- Including our own BIC test makes the paper self-contained — readers don't need to wait for their WP

**Novelty:** LOW as standalone (Danz et al. are first). MODERATE as independent replication/extension with different design features.

**Impact:** MODERATE — valuable as foundation for the "why" analysis, not as the main result.

**Feasibility:** HIGH. Already built into the pilot design.

**Verdict:** Include as a component, not as the headline contribution. Frame as "we confirm Danz et al.'s (forthcoming) finding that BDM fails BIC, and then ask: why?"

### Gap 4: When Do Incentives Help vs. Hurt?

Evidence is converging that incentives are often net negative for belief elicitation. The question is no longer "do incentives help?" but "when do they help, and when do they hurt?"

This is closely related to Gap 1 — if we understand why BDM fails, we can predict when incentives would help (strong competing motivations, like Gangadharan et al. 2024) vs. hurt (complex tasks, low-stakes settings).

**Verdict:** This emerges naturally from the "why" analysis rather than requiring a separate design.

### Gap 5: Interface Effects on BIC

Still open but risky. Brown et al. (2025) found comprehension interventions didn't help for value BDM. The prior should be pessimistic. Better as a future paper if the "why" analysis points to comprehension as the main driver.

**Verdict:** Deprioritize for now. Could be a follow-up.

---

## 3. Research Directions (Ranked)

### Direction 1 (Recommended): "Why Does BDM Belief Elicitation Fail? Identifying the Mechanism" (Gaps 1 + 2 + 3)

**Research question:** Why does BDM belief elicitation fail behavioral incentive compatibility, and does the failure worsen when the belief task is cognitively demanding?

**Paper structure:**
1. **Document the BIC failure** (independent evidence, confirms Danz et al. forthcoming) — this is the foundation, not the headline
2. **Characterize the failure** — how does BDM fail differently from BSR? Center-biased vs. boundary-biased? Different misconception types?
3. **Rule out preference for control** — the urn-draw design eliminates Hypothesis B by construction (no personal stake, no agency). If BDM still fails BIC here, it's comprehension/effort/complexity.
4. **Identify the remaining mechanism** — which of A (comprehension), C (effort), D (cognitive competition) drives the failure?
5. **Test the complexity interaction** — does BIC failure worsen for posterior beliefs vs. prior beliefs?
6. **Practical recommendation** — given the mechanism, what should experimenters do?

**Core design:** Between-subject, with treatment arms designed to isolate channels. Urn-draw paradigm rules out Hypothesis B (preference for control) by design.

| Arm | Mechanism | Info | What it tests |
|-----|-----------|------|---------------|
| 1 | BDM | Full incentive info | BIC condition (i) — baseline |
| 2 | BDM | No incentive info ("rewards accuracy") | BIC condition (i) — does info hurt? |
| 3 | Flat fee | Accuracy encouragement | Benchmark — no IC mechanism at all |
| 4 | BDM | Full info + comprehension intervention | Isolates comprehension channel (Hypothesis A) |

**Within-subject variation (all arms):**

- Induced priors (easy) vs. posteriors after signals (hard) → tests Hypothesis D (cognitive competition)
- Comprehension quiz after mechanism explanation → mediator for Hypothesis A
- Response time → mediator for Hypothesis C (effort)
- BIC condition (ii): direct lottery choice diagnostic → within-subject test of whether subjects understand what they're choosing

**Task:** Induced probabilities via urns (priors: 20/40/60/80%) + Bayesian updating with two signals (60% accuracy). Same as existing pilot. The urn-draw setting is objective and impersonal — subjects have no stake in the event, ruling out preference-for-control motives (Benoit et al. 2022).

**Sample size:** 4 arms x 150/arm = 600 subjects. ~\$7,200 on Prolific.
**Minimal design (Arms 1-3 only):** 3 arms x 150 = 450 subjects. ~\$5,400. (Loses comprehension intervention but keeps BIC test + complexity interaction.)

**What makes this publishable:**

- Moves from "BDM fails BIC" (confirmatory) to "*why* it fails" (novel)
- Task complexity interaction is genuinely new (nobody has tested this for any mechanism)
- Multiple channel identification within one design
- Independent BIC evidence complements Danz et al. (forthcoming)
- Practical recommendation grounded in mechanism identification
- Self-contained: doesn't require the reader to have Danz et al.'s WP

**Risks and honest limitations:**

- The comprehension intervention (Arm 4) has a pessimistic prior (Brown et al. 2025 found it didn't help for value BDM)
- Arm 5 (preference for control) requires a clean manipulation of how "controllable" the event feels — design challenge
- If all channels show null results, the paper becomes "BDM fails BIC and we don't know why" — less satisfying
- 750 subjects is a substantial budget commitment

**Mitigation:** Even if no single channel is cleanly identified, the complexity interaction (Hypothesis D) is testable in Arms 1-3 alone and is the most novel contribution. The minimal 3-arm design is still a strong paper.

**Novelty:** 8/10 | **Impact:** 9/10 | **Feasibility:** 7/10

---

### Direction 2: "The Cognitive Cost of Incentive Compatibility" (Gaps 2 + 4 — lean version)

**Research question:** When does the cognitive cost of implementing a TIC mechanism exceed its honesty benefit?

This is a stripped-down version that focuses purely on the complexity interaction without trying to identify the behavioral channel. Simpler, cheaper, but less ambitious.

**Design:** 2x2 factorial (mechanism complexity x task complexity):

| | Simple task (induced priors) | Complex task (Bayesian updating) |
|---|---|---|
| **Complex mechanism (BDM with full info)** | Cell 1 | Cell 2 |
| **Simple mechanism (flat fee)** | Cell 3 | Cell 4 |

**Key hypothesis:** The accuracy gap between BDM and flat fee is *smaller* (or reverses) when the task is complex. That is, mechanism complexity hurts more when the task is also demanding.

**What makes this publishable:**

- Novel interaction test — nobody has crossed mechanism complexity with task complexity
- Clean theoretical prediction (cognitive resource competition)
- Parsimonious: 4 cells, ~400 subjects, ~\$4,800
- Policy implication: incentivized elicitation may be harmful in complex settings

**Relationship to Direction 1:** This is essentially Direction 1's minimal design (Arms 1-3). Could serve as a fallback if the full mechanism-identification design proves too complex or expensive.

**Novelty:** 8/10 | **Impact:** 7/10 | **Feasibility:** 9/10

---

### Direction 3: "Beyond Point Estimates: Belief Distribution Elicitation" (separate project)

**Research question:** Which method for eliciting full belief distributions is most practical and accurate?

This is a different paper — doesn't build on the BIC framework. Better suited as a second project. Deprioritized for now given the BIC opportunity.

**Novelty:** 6/10 | **Impact:** 7/10 | **Feasibility:** 7/10

---

## 4. How the Existing Pilot Maps Onto Direction 1

The 2022 pilot tested:

- BDM direct elicitation only (no mechanism comparison)
- 3 treatments: Full Information, No Information, Introspection with Payment
- Urn task with Bayesian updating (4 events x 5 urns, 2 signals each, 60% accuracy)
- Online via Prolific/Qualtrics

**What carries over directly:**

- Arms 1-3 of Direction 1 are essentially the pilot design (Full Info = Arm 1, No Info = Arm 2, Flat Fee = Arm 3)
- The urn/updating task with induced probabilities
- The within-subject complexity variation (priors vs. posteriors)
- Prolific/Qualtrics infrastructure

**What needs to be added:**

- Arm 4: comprehension intervention (requires designing the intervention)
- Arm 5: "neutral event" variant (requires redesigning what the event lottery pays on)
- BIC condition (ii): direct lottery choice diagnostic (new task, within-subject)
- Comprehension quiz (short, after mechanism explanation)
- Response time logging (Qualtrics has this built in)
- Fix randomization issues from the pilot
- Increase sample size substantially

**What to reconsider:**

- The pilot used 5 urns with 10 balls each. The signal accuracy is only 60% — subjects need to understand conditional probabilities to update correctly. Consider whether this is too demanding when combined with mechanism comprehension.
- The pilot had 4 events x 3 elicitations = 12 belief reports per subject. This may be too many if we add the BIC diagnostic task. Consider reducing.

---

## 5. Recommended Path Forward

1. **Finish reading priority papers** — especially Brown et al. (2025) on simplicity refinements. Benoit et al. (2022) has now been read and integrated into Hypothesis B above.
2. **Run `/discover interview`** to pressure-test Direction 1's mechanism-identification approach
3. **Key design decisions to resolve in the interview:**
   - How to operationalize the comprehension intervention (Arm 4)
   - Whether the "preference for control" arm (Arm 5) is cleanly implementable or should be dropped — Benoit et al.'s (2022) approach (bet on self in both arms) provides a concrete design template
   - Whether to include a BSR arm for within-study comparison with Danz et al.
   - How many belief elicitations per subject (power vs. fatigue)
   - Whether to run the minimal design first (Arms 1-3) and add mechanism-identification arms in a second study
4. **Write research specification** after interview
5. **Run `/design experiment`** for the 14-step inference-first checklist

**Alternative mechanisms for experimenters to consider (from the literature):**

- **Descending Karni mechanism** (Tsakas 2019, GEB) — the only OSP implementation of BDM-for-beliefs. Theory proves obvious dominance; never tested experimentally. Would be a natural candidate if comprehension (Hypothesis A) is the binding constraint.
- **Frequency method** (Schlag & Tremewan 2021, J. Risk & Uncertainty) — uses multiple outcome realizations to identify belief bounds. IC for any reasonable utility function, radically simpler than BDM, fewer 50%-focal reports. Trade-off: recovers bounds, not point estimates.
- **Quantile price list** (Leo & Stelnicki 2025, Experimental Economics) — elicits quantiles of belief distributions. IC under weak assumptions.
- **Flat fee with accuracy encouragement** — emerging as a serious competitor for simple belief tasks (Burdea & Woon 2022; Ersoy 2025).

**Timeline note:** Danz et al.'s "Pure-Incentives Test" paper is work in progress. Once it circulates, the window for independent BIC evidence narrows. But the "why" question remains open regardless.

---

## 6. Reformulated Research Direction (April 2026)

*Updated after reading 23 papers. Supersedes the hypotheses in Section 2.*

### Research Questions

**RQ1:** Does the single-report probabilistic BDM fail behavioral incentive compatibility for belief elicitation?

**RQ2:** Why does it fail — what specific cognitive mechanism drives the gap between theoretical IC and behavioral performance?

### What We Now Know That Reshapes the Hypotheses

The original hypotheses (A-D) were broad. The literature now lets us be much more specific about what "comprehension failure" means and what the competing channels are. Key updates:

1. **"Comprehension" is not one thing.** The literature identifies at least three distinct sub-mechanisms within the broad comprehension channel, each with different theoretical grounding and different design implications:
   - *Contingent reasoning failure* — subjects cannot reason through all possible realizations of the random number simultaneously (Chakraborty & Kendall 2025: BDM is not UJS)
   - *Game-form misconception* — subjects confuse BDM with a more familiar game form, e.g. a first-price auction analog (Martin & Munoz-Rodriguez 2022; Cason & Plott 2014)
   - *Payoff function opacity* — subjects cannot evaluate the payoff consequences of their report for each possible random number (Martin & Munoz-Rodriguez 2022: CBC helps by making contingencies explicit; Brown et al. 2026: only for ≤7 states)

2. **The MPL comparison is the sharpest diagnostic tool.** BDM and MPL implement the same mechanism (Healy & Leo 2025; Holt & Smith 2016) but MPL makes contingent reasoning explicit row-by-row. If BDM fails BIC but MPL does not, the failure is specifically about *simultaneous contingent reasoning*, not about the incentive structure. Holt & Smith (2016) found this for values (LC outperforms BDM, p=0.021 on exact responses). The belief domain is untested.

3. **Monotonicity itself may depend on format.** Brown & Healy (2018) show that monotonicity — the IC assumption — is violated in list format (p=0.041) but not in separated format (p=0.697). This is more fundamental than "comprehension of the mechanism." It means the IC *assumption* holds or fails depending on how the decision is presented.

4. **The binding cognitive skill is probabilistic reasoning, not general intelligence.** Burfurd & Wilkening (2022) show SBDM amplifies heterogeneity in probabilistic reasoning but NOT in Raven's/CRT. Burdea & Woon (2022) show numeracy dwarfs treatment effects (−42.9pp). This means cognitive competition (old Hypothesis D) should be reframed: it's not BDM competing for general cognitive resources, but BDM specifically requiring the same probabilistic reasoning faculty that belief formation requires.

5. **Preference for control is ruled out by design.** Benoit et al. (2022) show 68% of "overconfidence" in self-belief settings is preference for control. But in our urn-draw design (objective events, no agency), control cannot operate. If BDM still fails BIC here, the failure is cognitive, not motivational.

6. **Static BDM almost never has obviously dominant strategies.** Tsakas (2019) proves this formally. Even the ascending clock (Karni mechanism) is dominant but NOT obviously dominant. Only the descending Karni mechanism achieves obvious dominance. This provides theoretical grounding for why comprehension fails: the dominant strategy exists but subjects cannot identify it from the mechanism's description alone.

### Reformulated Hypotheses

**H1: BDM fails BIC in belief elicitation with induced probabilities.**
Subjects' reported beliefs under single-report BDM will systematically deviate from induced (known) probabilities, even after comprehension scaffolding (instructions + quiz).
- *Predicted by:* Hao & Houser (2012): 53% non-optimal; Burdea & Woon (2022): BDM ≤ flat fee; Tsakas (2019): static BDM lacks obvious dominance
- *Tested via:* Comparison of BDM reports to known induced probabilities

**H2: The MPL format achieves better behavioral IC than single-report BDM, despite implementing the same mechanism.**
The belief MPL (synchronized lottery choice menu per Holt & Smith 2016) will produce reports closer to induced probabilities than single-report BDM, with fewer boundary responses, despite both being theoretically identical mechanisms (Healy & Leo 2025).
- *Predicted by:* Holt & Smith (2016) for values (35.7% vs 20.0% exact Bayesian); Chakraborty & Kendall (2025): MPL is UJS, BDM is not; Brown et al. (2026): PL outperforms BDM regardless of refinements
- *Tested via:* BDM vs. MPL comparison (between-subjects), same induced probabilities
- *This is the core diagnostic:* If H2 is confirmed, the failure is specifically about the *single-report format* requiring simultaneous contingent reasoning, not about the incentive structure itself.

**H3: BDM's BIC failure is driven by contingent reasoning failure, not game-form misconception or effort.**
Among subjects who fail BIC in BDM:
- (a) Errors will NOT cluster around a specific misconception (e.g., systematic shading toward 50% or toward extremes) but will show diffuse noise — inconsistent with a coherent alternative game form but consistent with inability to identify the dominant strategy among many "justifiable" alternatives (Chakraborty & Kendall 2025)
- (b) Comprehension quiz performance will predict BIC compliance — subjects who understand the mechanism's contingent structure (not just the procedure) will report more accurately (Burfurd & Wilkening 2018: quiz effect nearly doubles accuracy)
- (c) Response time will NOT predict BIC compliance after controlling for comprehension — effort is not the binding constraint (Burfurd & Wilkening 2022: no mechanism × effort interaction)
- *Tested via:* Error pattern analysis, quiz scores as mediator, response time as mediator

**H4: BIC failure worsens when the belief task is cognitively demanding.**
The accuracy gap between BDM and MPL (or BDM and flat fee) will be larger for posterior beliefs (requiring Bayesian updating) than for prior beliefs (given directly), because both BDM comprehension and Bayesian updating draw on the same probabilistic reasoning faculty.
- *Predicted by:* Burfurd & Wilkening (2022): SBDM amplifies heterogeneity in probabilistic reasoning specifically; the mechanism and the task compete for the same cognitive skill
- *Caveat:* Burfurd & Wilkening (2022) found no mechanism × general ability interaction. Our test is about task complexity (situational), not ability (trait). These are distinct.
- *Tested via:* Within-subject comparison of easy (prior) vs. hard (posterior) belief reports, interacted with mechanism treatment

**H5: Providing information about BDM's incentive structure does NOT improve (and may worsen) behavioral IC.**
Telling subjects that truthful reporting maximizes their payoff, or showing them the payoff structure, will not significantly increase accuracy — and may decrease it by adding cognitive load or inducing strategic overthinking.
- *Predicted by:* Danz et al. (2024 JEP): "information on the incentives increases the rate of false reports" for BQSR; Healy & Leo (2025): recommend NOT showing incentive details on screen; Burdea & Woon (2022): BDM comprehension quiz accuracy is only 47% — subjects find the incentive logic confusing
- *Tested via:* BDM full-info vs. BDM minimal-info (between-subjects)
- *Importance:* If confirmed, this means the standard experimental practice of explaining BDM incentives is actively harmful.

### Hypotheses NOT Tested (and Why)

**Preference for control (Benoit et al. 2022):** Ruled out by urn-draw design. No treatment arm needed — the design eliminates this channel by construction.

**OSP/clock mechanisms (Tsakas 2019; Hao & Houser 2012):** The descending Karni mechanism (the only OSP belief elicitation mechanism) has never been tested experimentally. Including it would be interesting but adds substantial design complexity (different interface, timing issues). Better as a follow-up study.

**Ternary price list (Healy & Leo 2025):** The TPL doubles incentive strength while maintaining MPL's weak IC assumption, but has never been lab-tested. Could be included as an exploratory arm but is not central to the diagnostic question.

### Proposed Design (Sketch — to be refined via `/design experiment`)

| Arm | Mechanism | Information | What it tests |
|-----|-----------|-------------|---------------|
| 1 | Single-report BDM | Full incentive explanation + quiz | Baseline — does BDM fail BIC? (H1) |
| 2 | Belief MPL | Full incentive explanation + quiz | Format comparison — does MPL fix BIC? (H2) |
| 3 | Single-report BDM | Minimal ("rewards accuracy") | Does incentive info help or hurt? (H5) |
| 4 | Flat fee | Accuracy encouragement | No-mechanism benchmark |

**Within-subject (all arms):**

- Easy beliefs: induced priors (given directly, e.g., "the probability is 30%")
- Hard beliefs: posteriors after signals (requires Bayesian updating)
- → Tests H4 (complexity interaction) via easy × hard comparison within each arm
- Comprehension quiz (mechanism-specific) → mediator for H3
- Response time → mediator for H3
- Numeracy / probabilistic reasoning measure → moderator for H3-H4

**Key comparisons:**

- H1: Arm 1 vs. induced truth (is BDM accurate?)
- H2: Arm 1 vs. Arm 2 (BDM vs. MPL)
- H4: (Arm 1 hard − Arm 1 easy) vs. (Arm 2 hard − Arm 2 easy) — does the format gap widen with complexity?
- H5: Arm 1 vs. Arm 3 (full info vs. minimal info within BDM)
- Benchmark: Arm 4 vs. Arms 1-3 (do incentivized mechanisms beat flat fee at all?)

### What Makes This Different From the v3 Design

| v3 (March 2026) | v4 (April 2026) | Why changed |
|---|---|---|
| 4 hypotheses (A-D), broadly framed | 5 hypotheses (H1-H5), precisely grounded in specific papers | Literature review sharpened the channels |
| No MPL arm | MPL arm is central (Arm 2) | Holt & Smith 2016 showed this is the cleanest diagnostic |
| "Comprehension intervention" arm (vague) | Dropped — replaced by MPL comparison | Brown et al. 2026 showed CBC doesn't scale; the MPL IS the comprehension intervention |
| Preference-for-control arm considered | Dropped — ruled out by design | Benoit et al. 2022 operates only in self-belief settings |
| Cognitive competition = general resources | Refined: competition for probabilistic reasoning specifically | Burfurd & Wilkening 2022 null on Raven's/CRT |
| BIC test + why | Same, but "why" is now specifically "simultaneous contingent reasoning" | Chakraborty & Kendall 2025 (UJS), Tsakas 2019 (not obviously dominant) |

### What Would Make This a Top-Field Publication

1. **Clean identification of WHY BDM fails:** BDM and MPL are the same mechanism (we prove this formally citing Healy & Leo 2025 and Holt & Smith 2016). If BDM fails BIC but MPL does not, the failure is entirely about format — specifically, about requiring subjects to reason through all contingencies simultaneously rather than row-by-row. This is a precise, falsifiable claim with clear theoretical grounding (Chakraborty & Kendall 2025 UJS framework).

2. **The complexity interaction is genuinely novel.** Nobody has tested whether mechanism format interacts with task difficulty for belief elicitation. If the BDM-MPL gap widens with task complexity, this has immediate practical implications: use MPL (not BDM) for any experiment where subjects must also think hard about their beliefs.

3. **The information result has policy implications.** If explaining BDM's incentives actively hurts accuracy, the standard practice of every experimental economics paper using BDM is wrong. This is a strong practical recommendation.

4. **Self-contained and clean.** Four arms, induced probabilities (ground truth known), within-subject complexity variation, clear hypotheses with pre-specified comparisons. No need to cite or depend on any forthcoming paper.
