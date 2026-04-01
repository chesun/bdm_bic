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

**Hypothesis B: Preference for control (Benoit, Dubra & Romagnoli channel)**
Subjects prefer the event lottery because it's tied to an event they feel they can influence or have a stake in, even when this is irrational. This predicts that BIC failures would be larger for events subjects feel connected to (own performance) than for "neutral" events (urn draws). Benoit et al. (2022, AEJ:Micro) provide strong evidence for this channel: using probabilistic BDM (matching probabilities / Karni mechanism) for self-beliefs about task performance, they find subjects inflate beliefs by 18 percentage points due to preference for control. At least 68% of what is normally measured as "overconfidence" is actually preference for control, not genuine belief distortion. Critically, the control motive is asymmetric — subjects want to bet on doing WELL (not just on themselves); betting on doing badly triggers an opposing "anti-control" motive. Their proposed fix: have subjects bet on themselves in BOTH arms (one task vs. another), eliminating the control confound. **Key open question for our design:** Benoit et al.'s context is confidence elicitation (beliefs about own performance), where subjects have a natural stake in the event. Whether preference for control operates when the event is an urn draw (no personal stake) is untested. If it does, this would suggest the control motive is about the mechanism structure (event lottery vs. number lottery), not about the event content. If it does not, this would bound the control channel to self-referential belief tasks.

**Hypothesis C: Effort/attention costs (Mamadehussene & Sguera channel)**
Subjects can't be bothered to think through the mechanism. They report naively and the complex incentive structure goes unused. This predicts that BIC failures would be similar across mechanism types (if subjects ignore all mechanisms equally) and that effort-inducing interventions would help more than comprehension interventions. Ersoy (2025) provides partial support: incentives initially increase effort but effects fade.

**Hypothesis D: Cognitive resource competition (novel)**
BDM comprehension and belief formation compete for the same limited cognitive resources. When the belief task is easy (induced probabilities), there's enough bandwidth for both. When the belief task is hard (Bayesian updating), the mechanism gets crowded out. This predicts an interaction: BIC failure worsens as task complexity increases. **Important caveat from Burfurd & Wilkening (2022, Experimental Economics):** They tested a related but distinct hypothesis — whether SBDM performance interacts with cognitive ability (Raven's Progressive Matrices, CRT). They found NO significant interaction between elicitation mechanism and cognitive ability/effort. SBDM is more sensitive to heterogeneity in *probabilistic reasoning* specifically, but not to general cognitive ability. This complicates the simple "cognitive resource competition" story, because if the binding constraint were general cognitive capacity, more able subjects should differentially benefit from SBDM. However, their design tests ability (a stable trait) not task complexity (a situational state), and they compare SBDM vs. Introspection rather than BDM with vs. without incentive information. Our proposed test — varying task complexity within-subject while holding ability constant — is distinct from and complementary to their approach.

**Why identifying the mechanism matters:** Different causes imply different remedies. If it's comprehension → simplify the mechanism. If it's preference for control → redesign what the event lottery pays on. If it's effort → make incentives more salient or use flat fee. If it's cognitive competition → use simpler mechanisms for complex tasks.

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
3. **Identify the mechanism** — which behavioral channel (comprehension, preference for control, effort, cognitive competition) drives the failure?
4. **Test the complexity interaction** — does BIC failure worsen for posterior beliefs vs. prior beliefs?
5. **Practical recommendation** — given the mechanism, what should experimenters do?

**Core design:** Between-subject, with treatment arms designed to isolate channels:

| Arm | Mechanism | Info | What it tests |
|-----|-----------|------|---------------|
| 1 | BDM | Full incentive info | BIC condition (i) — baseline |
| 2 | BDM | No incentive info ("rewards accuracy") | BIC condition (i) — does info hurt? |
| 3 | Flat fee | Accuracy encouragement | Benchmark — no IC mechanism at all |
| 4 | BDM | Full info + comprehension intervention | Isolates comprehension channel (Hypothesis A) |
| 5 | BDM (neutral event) | Full info | Isolates preference-for-control (Hypothesis B) — compare to Arm 1 if Arm 1 uses an event subjects feel connected to |

**Within-subject variation (all arms):**
- Induced priors (easy) vs. posteriors after signals (hard) → tests Hypothesis D (cognitive competition)
- Comprehension quiz after mechanism explanation → mediator for Hypothesis A
- Response time → mediator for Hypothesis C (effort)
- BIC condition (ii): direct lottery choice diagnostic → within-subject test of whether subjects understand what they're choosing

**Task:** Induced probabilities via urns (priors: 20/40/60/80%) + Bayesian updating with two signals (60% accuracy). Same as existing pilot.

**Sample size:** 5 arms x 150/arm = 750 subjects. ~$9,000 on Prolific.
**Reduced design (drop Arm 5):** 4 arms x 150 = 600 subjects. ~$7,200.
**Minimal design (Arms 1-3 only):** 3 arms x 150 = 450 subjects. ~$5,400. (Loses mechanism identification but keeps BIC test + complexity interaction.)

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
- Parsimonious: 4 cells, ~400 subjects, ~$4,800
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
