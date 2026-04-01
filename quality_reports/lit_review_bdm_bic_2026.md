# Literature Review: Behavioral Incentive Compatibility of BDM Belief Elicitation

**Author:** Claude (Librarian agent)
**Date:** 2026-03-29 (updated)
**Commissioned by:** Christina Sun
**Scope:** BDM belief elicitation, behavioral incentive compatibility, comprehension/misconception, elicitation interfaces. Primary focus on belief elicitation; value elicitation included where it informs mechanisms.
**Update from:** `master_supporting_docs/literature/bdm_literature_review.md` (2022 vintage)

---

## 1. What Has Changed Since 2022

The field has moved substantially. Three developments reshape the landscape:

1. **The BIC concept is now mainstream.** Danz, Vesterlund & Wilson published a JEP survey (2024) generalizing BIC beyond BSR. A 2025 replication confirms their AER results. BIC is no longer a single-paper claim — it's a framework the field is adopting.

2. **The "simplicity" literature has exploded.** New theoretical concepts (OSP, GSO, future self-proof) have been tested experimentally for value elicitation. The consistent finding: MPL-type interfaces outperform BDM in value contexts, but making BDM "obviously strategy-proof" (clock mechanism) does not help. This literature has NOT been applied to belief elicitation.

3. **Interface and presentation effects are now first-class concerns.** Multiple papers (2023-2025) show that *how* you present the elicitation task matters as much as the mechanism's formal properties. Click-and-drag interfaces outperform sliders; Distribution Builder outperforms Sliders; direct parametric elicitation outperforms bins. None of this work connects to BIC testing.

---

## 2. Core Papers (Updated)

### (a-0) Seminal Papers

**Becker, DeGroot & Marschak (1964)**, *Behavioral Science*, 9(3), 226-232.
- **Proximity:** 4 (foundational)
- **Method:** Theory + lab experiment
- **Key contribution:** The original BDM mechanism paper. Proposes a single-response sequential method for measuring utility (willingness to pay) that is incentive compatible under expected utility. Over 3,400 citations. Karni (2009) later extended the BDM logic from value elicitation to belief elicitation, showing dominant-strategy IC for probability reports under weaker assumptions than EU.

**Karni (2009)**, "A Mechanism for Eliciting Probabilities," *Econometrica*, 77(2), 603-606.
- **Proximity:** 1 (theoretical foundation for this project)
- **Method:** Theory
- **Key contribution:** Extended BDM from value elicitation to belief elicitation. Proved incentive compatibility for probability reports under three assumptions: probabilistic sophistication, dominance, and no-stakes — crucially, does NOT require expected utility or risk neutrality. The mechanism works by having subjects choose between an "event lottery" (pays if the event occurs) and a "number lottery" (pays with a fixed probability), with the probability varied to find the indifference point. This is the theoretical foundation that this project tests behaviorally. The IC result holds in theory — the question is whether subjects can actually navigate the mechanism correctly in practice.

**Hossain & Okui (2013)**, *Review of Economic Studies*, 80(3), 984-1001. [In library]
- **Proximity:** 2
- **Method:** Theory + lab experiment
- **Key contribution:** The original BSR paper. Proposes binarizing any proper scoring rule: the agent receives a fixed prize when her prediction error (defined by a loss function) is smaller than an independently generated random number, and a smaller prize otherwise. This makes the scoring rule incentive compatible regardless of risk preferences — a key advantage over QSR. Experiments show subjects' predictions are closer to the true probability under BSR than QSR. BSR is the primary comparator mechanism to BDM for belief elicitation in this project: both aim for risk-attitude robustness, but through fundamentally different approaches (scoring rule binarization vs. direct revelation via lottery matching).

**Cason & Plott (2014)**, *JPE*, 122(6), 1235-1270. [In library]
- **Proximity:** 1
- **Method:** Lab experiment with induced values
- **Key finding:** The landmark paper on "game form misconception" in BDM value elicitation. Subjects with a known-value object systematically misreport, consistent with confusing BDM with a first-price auction. Misconception persists even after experience and feedback. **This is about WTP elicitation, not belief elicitation**, but the cognitive mechanism — subjects failing to understand the strategy-proof structure — is directly analogous to the comprehension problems expected in BDM belief elicitation. An anchor paper for this project: if BDM fails for values (where subjects KNOW their true value), it is likely to fail for beliefs (where subjects must FORM their belief AND understand the mechanism).

### (a) The Danz-Vesterlund-Wilson Program

**Danz, Vesterlund & Wilson (2022)**, *AER*, 112(9), 2851-83. [106 citations]
- **Proximity:** 1
- **Method:** Lab experiment with induced probabilities
- **Key finding:** BSR fails two BIC conditions: (i) incentive information increases false reporting; (ii) most subjects don't choose the theorized maximizer in a direct choice task. Misreports are systematic and center-biased.
- **Relevance:** Foundational. Defines the BIC framework. Tests BSR only, not BDM.

**Danz, Vesterlund & Wilson (2024)**, *JEP*, 38(4), 131-54. [1 citation]
- **Proximity:** 1
- **Method:** Review/survey
- **Key finding:** Generalizes BIC framework. Separates indirect tests (behavior within mechanism) from direct tests (how subjects respond to mechanism's incentives). Reviews evidence across mechanism types. Introduces the "incentives-only test." Concludes: most popular elicitations are not BIC, and incentives *discourage* truthful revelation.
- **Relevance:** Critical. This is the state-of-the-art synthesis. They discuss BDM in passing but no BDM-specific BIC test exists. The paper explicitly frames the open question of whether BIC failures generalize beyond BSR.
- **Status:** Was NOT in library per existing review. CS reports downloaded.

**Agyeah, Samad & Trujano-Ochoa (2025)**, I4R Discussion Paper No. 255.
- **Proximity:** 2
- **Method:** Replication study
- **Key finding:** Confirms Danz et al. (2022) findings. Center-bias in BSR is robust.
- **Relevance:** Strengthens the empirical foundation that BSR has BIC problems. BDM not tested.
- **Status:** NOT in library. VERIFIED — confirmed via IDEAS/RePEc and author website (dariotrujanoochoa.github.io). Note: third author's surname is Trujano-Ochoa (corrected from earlier "Drujano-Ochoa" typo).

### (b) BDM Value Elicitation: The Simplicity Revolution

**Brown, Liu & Tsoi (2025)**, SSRN Working Paper #4476764.
- **Proximity:** 2
- **Method:** Lab experiment with induced values (sellers)
- **Key finding:** Tests BDM against three cognitively-simpler alternatives: (1) descending price clock (OSP), (2) BDM with contingent protocols (improves understanding), (3) dynamic MPL. **MPL improves game-form misconceptions but not overall accuracy. Neither OSP clock nor contingent protocols outperform standard BDM in the lab.** This is a surprising null: simplicity refinements don't help for value elicitation in the lab.
- **Relevance:** Directly tests whether making BDM simpler helps. The answer is discouraging for value elicitation. The belief elicitation equivalent has NOT been done.

**Chakraborty & Kendall (2022)**, SSRN Working Paper #4032946.
- **Proximity:** 3
- **Method:** Theory + lab experiment
- **Key finding:** Introduces "future self-proof" mechanisms and "game-structure obvious" (GSO) as new simplicity concepts. GSO (resembling MPL) outperforms OSP mechanism, but has its own source of mistakes. Suggests an inherent tradeoff in designing robust mechanisms.
- **Relevance:** Theoretical foundation for why BDM is hard — subjects can't forecast their own future actions in the game tree. BDM is not GSO. Applied to value elicitation only.

**Badio, Palma, Drichoutis, Zapata & Nayga (2026)**, Working Paper.
- **Proximity:** 3
- **Method:** Online experiment, homegrown WTP for oranges
- **Key finding:** Tests GSO vs BDM in homegrown (not induced) preference elicitation. GSO is perceived as simpler and more intuitive, but counterintuitively does not clearly outperform BDM.
- **Relevance:** Extends the simplicity literature to homegrown values (more ecologically valid). Belief context untested.
- **Status:** VERIFIED — confirmed on Drichoutis's website: https://www.andreasdrichoutis.com/publication/2026-badio-palma-drichoutis-zapata-nayga/ (PDF, data, codes, and slides available). Full author list: Badio, Palma, Drichoutis, Zapata, and Nayga.

**Mamadehussene & Sguera (2023)**, *Management Science*, 69(2), 1166-79.
- **Proximity:** 3
- **Method:** Theory + lab experiment
- **Key finding:** BDM WTP is sensitive to the price distribution. Proposes an effort-based theory: subjects need to exert effort to learn their preferences, and the price distribution affects effort incentives. Preserves incentive compatibility while explaining distribution sensitivity.
- **Relevance:** Offers an alternative to "context-dependent preferences" for explaining BDM failures. The effort story may translate to belief elicitation — effort to think carefully about one's belief.

**Drichoutis & Palma (2024)**, *Theory and Decision*.
- **Proximity:** 3
- **Method:** Lab experiment
- **Key finding:** BDM bids affected by experimenter's design choices (random binding price, framing). Consistent with expectations-based reference points, anchoring, and no-loss-in-buying. Concludes BDM is "not incentive compatible" in practice. **Strong claim.**
- **Relevance:** Adds to the evidence that BDM value elicitation is behaviorally fragile. The specific mechanisms (reference dependence, anchoring) may or may not apply to belief elicitation.

**Drichoutis & Nayga (2022)**, *JEBO*. [Already in library]
- **Proximity:** 3
- Updated note: Their finding (cognitive load does NOT exacerbate game-form misconception) is now complemented by Brown et al. (2025) finding that simplicity refinements don't help either. Together, these suggest the problem may not be purely cognitive difficulty.

**Martin & Munoz-Rodriguez (2022)**, *EER*. [Already in library]
- **Proximity:** 2
- Updated note: Their cost-reduction theory (reducing cognitive costs is more robust than increasing incentive magnitude) is still the best theoretical framework for BDM comprehension interventions. **Has NOT been tested for belief elicitation.** Brown et al. (2025) tested the contingent-protocol approach (which is similar) and found it didn't help for value elicitation in the lab.

### (c) BDM Belief Elicitation: Direct Evidence (Still Thin)

The four papers from the existing review remain the core evidence. No new paper since 2022 has directly tested BDM belief elicitation performance.

**Holt & Smith (2016)**, *AEJ: Micro*. [In library] — Proximity 1
**Hao & Houser (2012)**, *J. Risk & Uncertainty*. [In library] — Proximity 1
**Burfurd & Wilkening (2018)**, *JESA*. [In library] — Proximity 1
**Burdea & Woon (2022)**, *Journal of Economic Psychology*, 90, 102496. [In library] — Proximity 1
- Note: Originally cited as CESifo WP; published in *Journal of Economic Psychology* in 2022.

**No new direct BDM belief elicitation papers found (2022-2026).** This is itself a significant finding — the literature gap identified in the existing review is still completely open.

**Search documentation:** This conclusion is based on: (1) forward citation searches of Karni (2009), Burfurd & Wilkening (2018), and Holt & Smith (2016) conducted via Google Scholar and Consensus (Semantic Scholar); (2) keyword searches on Consensus and SSRN for "BDM belief elicitation," "stochastic BDM belief," and "probability matching mechanism belief"; (3) review of author pages for Danz, Healy, Leo, Wilkening, Brown, Drichoutis, and Martin. These searches returned papers on BDM value elicitation, BSR belief elicitation, and belief elicitation interfaces, but no new paper that directly tests BDM (or SBDM) for belief elicitation in the Karni (2009) framework with empirical data since 2022.

### (c-ii) Behavioral Mechanisms in Belief Elicitation

**Benoit, Dubra & Romagnoli (2022)**, "Belief Elicitation When More Than Money Matters: Controlling for 'Control'," *American Economic Journal: Microeconomics*, 14(3), 837-888.
- **Proximity:** 1
- **Method:** Lab experiment with probabilistic BDM (matching probabilities / Karni mechanism) for self-beliefs about task performance
- **Key finding:** Subjects inflate beliefs by 18 percentage points due to "preference for control" — they prefer betting on their own performance over equivalent random devices, even when the probabilities are identical. At least 68% of what is normally measured as "overconfidence" is actually preference for control, not genuine belief distortion. The control motive is asymmetric: subjects want to bet on doing WELL (not just bet on themselves); betting on doing badly triggers an "anti-control" motive that works in the opposite direction. The authors propose a novel mechanism that mitigates control by having subjects bet on themselves in BOTH arms of the BDM comparison (one task vs. another task), eliminating the control confound. They also show that control concerns affect the binarized scoring rule (BSR).
- **Relevance:** CRITICAL for this project. This is the strongest evidence for Hypothesis B (preference for control as a driver of BDM belief misreporting). The 18pp effect size is enormous — larger than most comprehension-driven biases documented in the literature. Their finding that 68%+ of measured "overconfidence" is actually control preference fundamentally reframes BIC failure: the mechanism may be understood but subjects have a non-monetary reason to misreport. Their proposed fix (bet on self in both arms) suggests a design path for our Arm 5 (neutral event). The asymmetry finding (control for doing well, anti-control for doing badly) predicts that BDM misreporting should be directional, not symmetric — which is testable. However, their context is confidence elicitation (self-beliefs about own performance), which is different from our induced-probability setting. Whether preference for control operates when the event is an urn draw rather than own performance is an open question.
- **Status:** Published in AEJ:Micro (top field journal). Cited by Danz et al. (2024 JEP) as key evidence on non-comprehension channels in BDM belief misreporting.

**Burfurd & Wilkening (2022)**, "Cognitive Heterogeneity and Complex Belief Elicitation," *Experimental Economics*, 25, 557-592.
- **Proximity:** 1
- **Method:** Lab experiment with two-part design: (1) "Bucket Game" to classify participants as consistent/inconsistent with probabilistic reasoning, (2) belief elicitation under SBDM vs. Introspection for easy and hard problems
- **Key finding:** SBDM encourages more careful thinking but is MORE sensitive to heterogeneity in probabilistic reasoning ability. Less variation in belief errors between easy and hard problems for SBDM vs. Introspection, but greater difference in errors between consistent and inconsistent participants under SBDM. Critically, NO significant interaction between elicitation mechanism and cognitive ability/effort (as measured by Raven's Progressive Matrices and CRT).
- **Relevance:** DIRECTLY relevant to Hypothesis D (cognitive competition). Their null finding on the mechanism x ability interaction complicates the simple "cognitive resource competition" story. If more able subjects do not differentially benefit from SBDM, the mechanism's cognitive demands may not be the binding constraint. However, their design tests ability (a stable trait) not task complexity (a situational state), and they compare SBDM vs. Introspection rather than BDM with vs. without incentive information. The finding that SBDM amplifies heterogeneity in probabilistic reasoning (but not general cognitive ability) suggests that the relevant dimension is specifically probabilistic sophistication, not general intelligence.
- **Status:** Published in *Experimental Economics* (top field journal). NOTE: This is a DIFFERENT paper from Burfurd & Wilkening (2018, *JESA*), which tested implementation formats of SBDM. The 2018 paper compares direct vs. MPL-style SBDM interfaces; this 2022 paper tests the interaction between SBDM, task complexity, and cognitive heterogeneity. Same authors, different research question, different experiment.

### (d) New Theoretical Foundations

**Peski & Stewart (2025)**, arXiv:2506.12167.
- **Proximity:** 2
- **Method:** Theory
- **Key finding:** Identifies necessary and sufficient conditions for eliciting beliefs about a choice without distorting the choice. Characterizes all incentivizable questions. Shows how to elicit beliefs using BDM variants for three canonical problems (confidence, cognitive uncertainty).
- **Relevance:** New theoretical foundation for BDM belief elicitation. Extends Karni (2009) to settings where beliefs are about one's own choice. Empirically untested. Could reframe what BDM belief elicitation is good for.

**Dynamic Belief Elicitation — Chambers & Lambert (2021)**, *Econometrica*, 89(1), 375-414.
- **Proximity:** 3
- **Method:** Theory
- **Key finding:** Designs protocols that induce subjects to reveal priors AND anticipated information flows AND posterior updates, all as strict best responses. General strategyproof protocols exist for any number of periods.
- **Relevance:** Relevant if the experimental design involves sequential belief updating (as Christina's does). Provides theoretical tools for multi-period elicitation.

### (d-ii) Papers from Prior Review (Restored)

The following papers were present in the 2022-vintage review (`master_supporting_docs/literature/bdm_literature_review.md`) and remain relevant. They were inadvertently omitted from the initial draft of this update.

**Eyting & Schmidt (2021)**, *European Economic Review*. [In library]
- **Proximity:** 3
- "Belief Elicitation with Multiple Point Predictions." Proposes an alternative belief elicitation approach using multiple point predictions rather than a single report. Relevant as a design alternative to BDM that may reduce comprehension burden.

**Gachter & Renner (2010)**, *Experimental Economics*. [In library]
- **Proximity:** 3
- "The Effects of (Incentivized) Belief Elicitation in Public Goods Experiments." Documents how incentivized belief elicitation itself can change behavior in the underlying game. Important for understanding the interaction between elicitation and the environment being studied.

**Baillon, Halevy & Li (2022)**, *Experimental Economics*. [In library]
- **Proximity:** 4
- "Experimental Elicitation of Ambiguity Attitude Using the Random Incentive System." Tests the random incentive system for eliciting ambiguity attitudes. Relevant as background on how payment protocols interact with elicitation mechanisms.

**Henckel, Menzies, Moffatt & Zizzo (2022)**, *Experimental Economics*. [In library]
- **Proximity:** 3
- Sequential belief updating with payoffs linked to reported beliefs. Models updating as a double-hurdle process. Directly relevant because the paper's design uses sequential updating — their methodology for controlling risk aversion (Offerman et al. 2009 technique) and modeling the decision to update are informative for design choices.

**Andersen, Harrison, Lau & Rutstrom (2006)**, *Experimental Economics*. [In library]
- **Proximity:** 4
- Framing effects in MPL elicitation. While about risk preferences, establishes the general principle that elicitation format affects behavior independent of formal mechanism properties. Relevant for understanding why interface and presentation matter.

**Hollard, Massoni & Vergnaud (2010)**, Working Paper / Published. [In library]
- **Proximity:** 3
- Finds BSR/BDM outperform QSR for belief elicitation. One of the few direct mechanism comparisons that favors BDM, providing a counterpoint to the generally pessimistic evidence on complex mechanisms.

### (e) Comprehension and Simplicity in Mechanisms

**Li (2017)**, "Obviously Strategy-Proof Mechanisms," *American Economic Review*, 107(11), 3257-3287.
- **Proximity:** 3 (theoretical foundation for the simplicity literature)
- **Method:** Theory
- **Key finding:** Defines "obvious dominance": a strategy is obviously dominant if, at any information set where it first diverges from an alternative, the best outcome from deviating is no better than the worst outcome from the dominant strategy. A mechanism is OSP if it has an equilibrium in obviously dominant strategies. Behavioral interpretation: obviously dominant if and only if a cognitively limited agent (who cannot do contingent reasoning across information sets) can recognize it as weakly dominant. Key applied result: ascending auctions are OSP while second-price sealed-bid auctions are not — explaining the longstanding experimental regularity that ascending auctions outperform sealed-bid auctions despite theoretical equivalence.
- **Relevance:** The foundational paper for the simplicity refinements literature that Tsakas (2019), Chakraborty & Kendall (2022), Brown et al. (2025), and Badio et al. (2026) all build on. Li's framework is the theoretical lens through which we understand WHY BDM is cognitively hard: BDM requires subjects to reason about what would happen at information sets they will never reach (contingent reasoning), which OSP mechanisms avoid. The standard BDM mechanism (sealed-bid) is NOT OSP. Whether an OSP implementation of BDM-for-beliefs (e.g., a clock mechanism) would help is an open question — Tsakas (2019) shows the theory, Brown et al. (2025) show it does not help for values.

**Tsakas (2019)**, "Obvious Belief Elicitation," *Games and Economic Behavior*, 118, 374-381.
- **Proximity:** 2
- **Method:** Theory
- **Key finding:** Applies Li's (2017) OSP framework specifically to belief elicitation mechanisms. Proves that the static Karni (2009) mechanism does NOT have obviously dominant strategies. Proves that the ascending Karni mechanism (clock auction format) also does NOT have obviously dominant strategies. Introduces a novel DESCENDING Karni mechanism that always has obviously dominant strategies. Under the assumption that subjects choose an obviously dominant strategy, the descending mechanism can approximate true beliefs with arbitrary precision. Results hold for a very broad class of likelihood relations, well beyond expected utility.
- **Relevance:** This is the belief-elicitation-specific application of Li (2017). The key theoretical result for our project: standard BDM-for-beliefs (Karni 2009) is NOT OSP, and even the "obvious" fix (ascending clock) is NOT OSP either. Only the descending mechanism achieves OSP — and this has NEVER been tested experimentally for belief elicitation. Brown et al. (2025) tested a descending clock for value elicitation and found it did not help, but the belief context is different. The gap between Tsakas's theory and experimental evidence is a potential research opportunity, though not our primary focus. Published in *Games and Economic Behavior* — addresses the GEB journal coverage gap noted by the librarian-critic.

**Brown, Stephenson & Velez (2025)**, "Testing the Simplicity of Strategy-Proof Mechanisms," *Economic Theory*.
- **Proximity:** 3
- **Method:** Lab experiment (uniform rationing problems)
- **Key finding:** OSP does not always outperform direct revelation. **Non-binding real-time feedback during reporting greatly improves performance.** Sequential revelation produces modest improvements. General lesson: feedback > simplicity.
- **Relevance:** The "feedback helps more than simplicity" finding is potentially very important for BDM belief elicitation design. If showing subjects real-time consequences of their report helps more than simplifying the mechanism, this suggests a different design direction.

**Strategy-proofness in experimental matching markets — Guillen & Hakimov (2021)**, *Experimental Economics*, 24(2), 650-668.
- **Proximity:** 3
- **Method:** Lab experiment (school allocation)
- **Key finding:** ~50% of truth-telling in strategy-proof mechanisms (TTC, DA) is naive behavior — subjects follow a focal default without understanding incentives. Only 14-31% of participants demonstrate genuine strategic understanding.
- **Relevance:** Deeply relevant for interpreting any BDM result. If subjects who report "correctly" under BDM are doing so by default (just reporting what they think) rather than because they understand the incentive to do so, then BDM's apparent success may be as misleading as its failures.

### (f) Interface, Presentation, and Mechanism Alternatives

**Crosetto & de Haan (2023)**, *Judgment and Decision Making*, 18, e27.
- **Proximity:** 3
- **Method:** Pre-registered online experiment (MTurk)
- **Key finding:** Click-and-drag interface outperforms text, sliders, and distribution-manipulation interfaces for belief distribution elicitation. More accurate, faster, less frustrating. Free oTree and Qualtrics plugins available at https://beliefelicitation.github.io/
- **Relevance:** Practical tool for experiment implementation. Raises the question: does the input interface interact with BIC? If you use a better interface, do BIC problems shrink?
- **Status:** CS already noted this paper. Confirmed published 2023.
- **Note (psychology journal):** Published in JDM, a psychology/decision science journal. The study uses accuracy scoring (not incentive-compatible elicitation in the economics sense) — subjects are scored on how well their reported distributions match realized outcomes. No BDM/BSR/QSR incentive scheme is used. The interface comparison is informative for design, but results should be interpreted with the caveat that incentive structures differ from standard economics experiments. Sample is MTurk, which is standard for both fields.

**Hu & Simmons (2024)**, "Different Methods Elicit Different Belief Distributions," *JEP: General*.
- **Proximity:** 3
- **Method:** 10 pre-registered studies (N=14,553)
- **Key finding:** Distribution Builder elicits more accurate belief distributions than Sliders. Slider users start with lowest bins, putting excessive mass there. Interface drives behavior independent of mechanism.
- **Relevance:** Different interfaces produce different belief distributions. This means the choice of interface is not neutral — it's a treatment. Experimenters who use BDM with different interfaces are studying different things.
- **Status:** NOT in library.
- **Note (psychology journal):** Published in JEP: General, a psychology journal. The studies do not use incentivized elicitation in the economics sense (no BDM, BSR, or other IC mechanism). Beliefs are evaluated against realized outcomes using accuracy metrics, not incentive-compatible payment. Very large samples (N=14,553 across studies) provide strong statistical power, but inference standards differ from economics conventions — no clustering at session level (online individual-level data), and the focus is on mean accuracy differences rather than structural modeling of reporting behavior. The interface findings are nonetheless highly relevant for experimental design.

**Schlag & Tremewan (2021)**, "Simple Belief Elicitation: An Experimental Evaluation," *Journal of Risk and Uncertainty*, 62, 137-155.
- **Proximity:** 2
- **Method:** Lab experiment comparing the "frequency method" to the Karni (direct BDM) method
- **Key finding:** Proposes and tests the "frequency method" for belief elicitation: uses multiple realizations of an outcome to identify bounds on beliefs, is IC for any reasonable utility function, and is highly transparent and simple. Compared experimentally to the Karni (direct BDM) method. The frequency method is easier to understand, faster to complete, and produces fewer 50%-focal reports. The Karni method shows confusion-driven 50% bias specifically for low cognitive ability subjects. The frequency method produces more correct Bayesian updating answers. Trade-off: the frequency method identifies bounds on beliefs rather than point beliefs, trading precision for generality and simplicity.
- **Relevance:** Directly relevant as another "simpler alternative to BDM" paper — a different approach from the OSP/GSO simplicity refinements (which keep BDM's structure but change the interface) and from flat-fee elicitation (which abandons IC entirely). The frequency method preserves IC while radically simplifying the cognitive task, at the cost of recovering bounds rather than point estimates. The finding that BDM confusion concentrates in low-ability subjects is consistent with Burfurd & Wilkening (2022) on cognitive heterogeneity. Karl Schlag is also a co-author on the Schlag, Tremewan & van der Weele (2015) belief elicitation survey already in section (g). Published in *Journal of Risk and Uncertainty* (economics journal, peer-reviewed).

**Gonzalez-Fernandez, Bosch-Rosa & Meissner (2025)**, "Direct Elicitation of Parametric Belief Distributions," *JEBO*.
- **Proximity:** 3
- **Method:** Pre-registered survey experiment, representative US sample
- **Key finding:** Two-slider beta-distribution interface yields higher mean estimates, substantially lower SDs, and is reported easier/more engaging than the Fed's SCE "Bins" method. Distributions more accurately reflect participants' beliefs.
- **Relevance:** Methodological innovation for full-distribution elicitation. Different from point-estimate BDM but relevant if Christina's redesign considers eliciting distributions rather than point probabilities.
- **Status:** NOT in library.

**Grapow (2026)**, "Eliciting Belief Distributions: A Comparative Study," Working Paper, Ghent University (RISLab), January 2026.
- **Proximity:** 2
- **Method:** Lab experiment (Beauty Contest + Ultimatum game), between-subject comparison of three methods
- **Key finding:** Compares Money Method (binary choices between sure amount and ambiguous lottery — elicits beliefs AND preferences under ambiguity), Bet-Based Method (binary choices between events to win fixed prize — robust to utility curvature and probability distortions), and Introspective Method (unincentivized self-report). All three reliably recover subjective probabilities. Bet-Based Method is best for minimal functional assumptions. Money Method best if you also want ambiguity attitudes. Introspective Method is fastest but requires participants to understand probability.
- **Relevance:** This is exactly the kind of "mechanism horse race" the gap analysis called for, but for belief DISTRIBUTIONS rather than point estimates. Shows new alternatives to BSR/BDM that use non-chained binary choices (simpler). Very recent (Jan 2026). Directly relevant to Gap B.
- **Status:** NOT in library. % UNVERIFIED venue. Lab experiment with incentives; economics standards.

**Leo & Stelnicki (2025)**, "Eliciting Subjective Real-Valued Beliefs," *Experimental Economics*, 28, 880-899.
- **Proximity:** 2
- **Method:** Theory + lab experiment (math test beliefs at Ohio State)
- **Key finding:** Proposes quantile price list methodology for eliciting quantiles of subjective belief distributions over real-valued random variables. IC under weak assumptions (replacement axiom + act/objective lottery monotonicity). Can approximate entire belief CDF. Proof-of-concept shows it recovers richer belief distributions than the standard Holt & Smith (2016) price list for probabilities.
- **Relevance:** Greg Leo is a central author in the belief elicitation space (Healy & Leo handbook chapter, Dustan-Koutout-Leo reduction paper). The quantile price list is a genuine methodological innovation that offers an alternative to both BDM and BSR for rich belief elicitation. Published in *Experimental Economics* (top field journal). Directly relevant to the "what should experimenters use?" question.

### (g) Measurement Error, Elicitation Quality, and Survey/Handbook Papers

**Gillen, Snowberg & Yariv (2019)**, *JPE*. [Background reference]
- **Proximity:** 4
- Updated note: The ORIV technique and the finding that ~50% of variance is measurement error is increasingly recognized. The 2025 Handbook of Experimental Methodology (ed. Snowberg & Yariv) devotes substantial attention to this. For BDM belief elicitation, measurement error is a first-order concern: if a single BDM elicitation is 50% noise, then using it as a covariate in regressions is severely problematic.

**Niederle (2025)**, "Experiments: Why, How, and A Users Guide for Producers as Well as Consumers," NBER Working Paper No. 33630 / Chapter in *Handbook of Experimental Methodology* (eds. Snowberg & Yariv).
- **Proximity:** 4 (methodological reference)
- **Key contribution:** Comprehensive guide to designing and evaluating experiments. Covers when to run experiments, basic design lessons, systematic description of tools for demonstrating the importance of a new model or force, advanced toolkit, and views on pre-registration and pre-analysis plans. The definitive current methodological reference for experimental economics.

**Gneiting & Raftery (2007)**, *Journal of the American Statistical Association*, 102(477), 359-378.
- **Proximity:** 4 (theoretical foundation)
- **Key contribution:** The theoretical foundation for strictly proper scoring rules. Defines propriety and strict propriety formally. Grounds why BSR was developed as an alternative to QSR — QSR is proper but not always strictly proper for all distributions. Essential background for understanding the theoretical motivation behind different belief elicitation mechanisms and why BDM's IC properties (which don't rely on scoring rules) represent a different approach entirely.

**Snowberg & Yariv (2025)**, "Evaluating Experimental Designs," in *Handbook of Experimental Methodology*.
- **Proximity:** 4
- **Key contribution:** Framework for evaluating experimental measures. Connects measure reliability to experimental design choices. Emphasizes parameter selection discipline (which Christina's existing review correctly highlights).
- **Status:** NOT in library. Book chapter.

**Schlag, Tremewan & van der Weele (2015)**, "A Penny for Your Thoughts: A Survey of Methods for Eliciting Beliefs," *Experimental Economics*, 18(4), 507-536.
- **Proximity:** 4 (comprehensive background survey)
- **Method:** Survey/review
- **Key contribution:** Comprehensive survey of belief elicitation methods covering proper scoring rules (QSR, LogSR, SSR), lotteries (BDM-type mechanisms), and introspection (unincentivized self-report). Discusses theoretical properties (IC conditions, risk-attitude dependence) and practical implementation issues (comprehension, cognitive load, hedging). Widely cited as a standard reference for experimenters choosing a belief elicitation method. Predates the BIC framework (Danz et al. 2022) but systematically catalogues the mechanisms that BIC testing would later evaluate.

**Healy & Leo (2025)**, "Belief Elicitation: A User's Guide," Chapter 8 in *Handbook of Experimental Methodology*.
- **Proximity:** 1
- **Key contribution:** Comprehensive survey of belief elicitation mechanisms. Covers BDM, BSR, QSR, and alternatives. The definitive current reference.
- **Status:** In `master_supporting_docs/experimental_design`. Confirm this is the updated handbook version.

**Healy & Leo (2025)**, "Ternary Belief Elicitation," Working Paper (BSE presentation Feb 2025).
- **Proximity:** 2
- **Key contribution:** New belief elicitation mechanism. Details unknown (PDF not parseable). Worth investigating — if this simplifies belief elicitation, it could be a direct alternative to BDM.
- **Status:** NOT in library. % UNVERIFIED.

**Leo**, "Coarse Belief Elicitation," Working Paper.
- **Proximity:** 2
- **Key contribution:** Alternative to fine-grained point elicitation. Details unknown (PDF not parseable). Potentially addresses the concern that asking for precise probabilities is too cognitively demanding.
- **Status:** NOT in library. % UNVERIFIED.

### (h) Incentivized vs. Unincentivized Elicitation

**Gangadharan, Grossman & Xue (2024)**, "Belief Elicitation under Competing Motivations: Does It Matter How You Ask?", *European Economic Review*, 169.
- **Proximity:** 3
- **Method:** Giving experiment
- **Key finding:** When self-interest competes with accuracy incentives, beliefs are biased. Only elicitation methods that make monetary incentives prominent reduce bias. Simple incentives don't help.
- **Relevance:** Speaks to when incentivized elicitation matters most — when subjects have motivated reasoning. In "neutral" belief tasks (like induced probabilities), flat fee may be sufficient.

**Ersoy (2025)**, "Do Incentives Matter in Elicitation of Beliefs?", *Journal of Behavioral and Experimental Economics*, 119, 102477.
- **Proximity:** 2
- **Method:** Online experiment (Duolingo/Prolific), 4-week longitudinal, between-subject (incentivized absolute scoring rule vs. flat-pay)
- **Key finding:** Incentivization initially reduces bias and increases effort (more round answers, longer response times). But these effects DIMINISH and become nonexistent in later weeks — suggesting short-lived effects. Incentivization does NOT improve overall accuracy of beliefs or confidence. Uses absolute scoring rule (not BSR or BDM) to reduce cognitive complexity.
- **Relevance:** Directly speaks to Gap E ("when do incentives help?"). The finding that incentive effects are short-lived is important — it challenges the assumption that incentivized elicitation is always worth its cognitive cost. Also relevant: Ersoy explicitly chose an absolute scoring rule to reduce comprehension burden, echoing the simplicity literature. Published in *JBEE* (economics journal); study uses monetary incentives; economics inference standards.

**Canen & Chakraborty (2022)**, "Choosing The Best Incentives for Belief Elicitation with an Application to Political Protests," arXiv:2210.12549.
- **Proximity:** 3
- **Method:** Theory + application to Cantoni et al. (2019)
- **Key finding:** Different incentive schemes induce subjects to report the mean, mode, or median of their belief distribution. Mismatch between elicitation scheme and research question can flip the sign of identified effects.
- **Relevance:** Even if a mechanism is BIC for eliciting *some* statistic, it may not be eliciting the statistic the researcher needs. This is a different kind of failure than comprehension-based BIC failure.
- **Status:** VERIFIED — authors Nathan Canen and Anujit Chakraborty, confirmed via arXiv and IDEAS/RePEc.

**Lehmann (2026)**, "Mechanisms for Belief Elicitation Without Ground Truth," *Journal of Economic Surveys*, 40(1), 505-527.
- **Proximity:** 3
- **Method:** Survey/review of 25+ mechanisms
- **Key finding:** Most theoretical mechanisms for truth-telling without ground truth are too complex to convey to subjects. Empirical evidence for their effectiveness is limited and weak. Recommends simple, intuitive mechanisms.
- **Relevance:** Reinforces the "simplicity > theoretical IC" message. Even in the without-ground-truth setting (not Christina's setting), the same conclusion emerges.

### (h-ii) Belief Updating Experimental Literature

This subsection covers the experimental literature on belief updating that grounds the paper's urn-based Bayesian updating paradigm.

**Grether (1980)**, *Quarterly Journal of Economics*, 95(3), 537-557. [In library]
- **Proximity:** 3 (paradigm foundation)
- **Method:** Lab experiment with urn draws
- **Key finding:** The classic experiment on base-rate neglect. Subjects systematically underweight prior probabilities relative to sample evidence when updating beliefs. Establishes the urn-draw paradigm that this project uses. Base-rate neglect is one of the most robust findings in behavioral economics, replicated across hundreds of studies.
- **Relevance:** This is the paradigm the paper works within. The urn-based updating task in the experimental design directly descends from Grether's setup.

**Esponda, Vespa & Yuksel (2024)**, *American Economic Review*, 114(3), 752-782.
- **Proximity:** 3
- **Method:** Lab experiment with urn draws and feedback
- **Key finding:** Documents the persistence of base-rate neglect even with ample learning opportunities. The key insight: mistakes driven by incorrect *mental models* (not just cognitive errors) are self-reinforcing because wrong models induce confidence in wrong answers, limiting engagement with feedback. Subjects with correct mental models learn; those with wrong models do not.
- **Relevance:** Directly relevant for interpreting BDM belief elicitation failures in updating tasks. If subjects hold incorrect mental models of the BDM mechanism (analogous to holding incorrect models of the updating environment), their mistakes may be similarly persistent and resistant to feedback or experience. Provides theoretical grounding for why comprehension interventions may fail if they don't correct the underlying mental model.

**Conservatism bias literature (brief note):** A complementary body of work documents conservatism — subjects updating *too little* relative to Bayes' rule (Edwards 1968; Phillips & Edwards 1966). The distinction between base-rate neglect (over-weighting evidence) and conservatism (under-weighting evidence) depends on the experimental paradigm and signal structure. Ba, Bohren & Imas (2025) show that representational complexity tends to produce under-reaction. In designs using sequential signals, both biases can appear depending on the number and diagnosticity of signals. For this project, the key implication is that updating errors are systematic and interact with the cognitive demands of the elicitation mechanism.

### (i) Reduction, Compound Lotteries, and BSR Foundations

**Dustan, Koutout & Leo (2022)**, "Second-Order Beliefs and Gender," *JEBO*, 200, 752-781.
- **Proximity:** 2
- **Method:** Lab experiment
- **Key finding:** Examines gender differences in second-order beliefs. Finds women form less accurate second-order beliefs than men, driven by differences in strategic reasoning rather than risk preferences.
- **Relevance:** Uses BQSR for belief elicitation. **This is a completely separate paper from the same authors' "Reduction in Belief Elicitation" WP below** — different research question, different experiment, different contribution.

**Dustan, Koutout & Leo (2023)**, "Reduction in Belief Elicitation," Working Paper (December 2023). Pre-registered: AEA RCT Registry AEARCTR-0007939.
- **Proximity:** 2
- **Method:** Lab experiment
- **Key finding:** 70% of subjects violate compound lottery reduction for BQSR. Reducers are 33% more accurate. Their novel Rank-Ordered Elicitation (ROE), which doesn't require reduction, does NOT improve accuracy. This means the problem isn't just the reduction assumption — something else is going on.
- **Relevance:** Important for understanding WHY BSR fails. The reduction assumption is a problem, but fixing it doesn't fix behavior. Suggests deeper comprehension or motivation issues. BDM doesn't rely on reduction, which is a theoretical advantage — but BDM has its own comprehension problems. NOTE: This is a separate working paper from Dustan et al. (2022, JEBO) "Second-Order Beliefs and Gender." Same authors, different research question.

### (j) Journal of Economic Psychology: Belief Elicitation Papers

This subsection captures relevant papers found in the Journal of Economic Psychology, searched 2026-03-29.

**Burdea & Woon (2022)**, "Online Belief Elicitation Methods," *Journal of Economic Psychology*, 90, 102496.
- **Proximity:** 1
- **Method:** Online experiment (MTurk), induced probabilities, between-subject (BSR vs. SBDM vs. flat fee)
- **Key finding:** Belief quality in online environments depends less on formal IC properties than on task comprehension difficulty and how well incentives induce cognitive effort. Flat fee performs comparably to BSR and SBDM.
- **Relevance:** One of only four papers directly testing BDM (stochastic variant) for belief elicitation. Published in J. Econ Psychology. Already cited in section (c) and in Gap E.
- Note: Also cross-listed in section (c) above. Included here to document J. Econ Psychology coverage.

**Crosetto, Filippin, Katuscak & Smith (2020)**, "Central Tendency Bias in Belief Elicitation," *Journal of Economic Psychology*, 78, 102292.
- **Proximity:** 3
- **Method:** Lab experiment (first-price auction against automaton with known uniform distribution), 7 treatments
- **Key finding:** Despite being told the opponent's bid is drawn from a uniform distribution, a majority of subjects report beliefs with a peak in the interior of the range. This central tendency bias is robust across treatments. The finding offers an explanation for conservatism and overprecision biases in Bayesian updating — elicited beliefs may systematically have less variance than the true distributions.
- **Relevance:** Documents a systematic bias in belief elicitation that would affect ANY mechanism including BDM. Central tendency bias could interact with BIC failures (e.g., center-bias in BSR documented by Danz et al. may partly reflect this general phenomenon rather than mechanism-specific comprehension failure). Relevant for interpreting the paper's results.

**Erkal, Gangadharan & Koh (2020)**, "Replication: Belief Elicitation with Quadratic and Binarized Scoring Rules," *Journal of Economic Psychology*, 81, 102315.
- **Proximity:** 3
- **Method:** Lab experiment, between-subject replication of Hossain & Okui (2013)
- **Key finding:** Confirms that risk-averse subjects distort beliefs toward 0.5 under QSR more than under BSR, consistent with theory. BSR outperforms QSR. A between-subject replication (original was within-subject) that strengthens the case for BSR's theoretical advantage.
- **Relevance:** Confirms BSR's advantage over QSR. Relevant as context for understanding why BSR became the standard comparator for BDM in belief elicitation. Also relevant: demonstrates that the original Hossain & Okui (2013) results replicate under a cleaner between-subject design.

---

## 3. Gap Analysis & Research Directions

**Moved to standalone document:** `quality_reports/research_ideas_bdm_bic.md`

That document contains the full gap assessment (5 gaps with novelty/impact/feasibility scores), 5 ranked research directions with concrete designs and cost estimates, and an assessment of how the existing pilot maps onto each direction.

---

## 5. Papers to Download

| # | Paper | Why | Priority |
|---|-------|-----|----------|
| 1 | Danz, Vesterlund & Wilson (2024), *JEP* | Core BIC survey — must read carefully | HIGH |
| 2 | Brown, Liu & Tsoi (2025), SSRN | Simplicity refinements for value BDM | HIGH |
| 3 | Healy & Leo (2025), Handbook chapter | Definitive belief elicitation survey | HIGH |
| 4 | Healy & Leo (2025), "Ternary Belief Elicitation" WP | New mechanism | HIGH |
| 5 | Leo, "Coarse Belief Elicitation" WP | New mechanism | HIGH |
| 6 | Peski & Stewart (2025), arXiv | Nondistortionary BDM theory | MEDIUM |
| 7 | Chakraborty & Kendall (2022), SSRN | GSO theory | MEDIUM |
| 8 | Mamadehussene & Sguera (2023), *Mgmt Sci* | BDM reliability / effort theory | MEDIUM |
| 9 | Drichoutis & Palma (2024), *Theory & Decision* | Reference dependence in BDM | MEDIUM |
| 10 | Hu & Simmons (2024), *JEP:General* | Interface effects | MEDIUM |
| 11 | Gonzalez-Fernandez, Bosch-Rosa & Meissner (2025), *JEBO* | New elicitation interface | MEDIUM |
| 12 | Agyeah et al. (2025), I4R | Danz et al. replication | LOW |
| 13 | Snowberg & Yariv (2025), Handbook intro chapter | Design evaluation framework | LOW |
| 14 | Badio et al. (2026), WP | GSO vs BDM homegrown | LOW |
| 15 | Brown, Stephenson & Velez (2025), *Economic Theory* | Feedback > simplicity | MEDIUM |
| 16 | Esponda, Vespa & Yuksel (2024), *AER* | Mental models and base-rate neglect | HIGH |
| 17 | Niederle (2025), NBER WP 33630 | Methodological reference | MEDIUM |
| 18 | Gneiting & Raftery (2007), *JASA* | Scoring rules theory | LOW |
| 19 | Leo & Stelnicki (2025), *Experimental Economics* | Quantile price list for beliefs | HIGH |
| 20 | Grapow (2026), WP | Mechanism horse race for distributions | MEDIUM |
| 21 | Ersoy (2025), *JBEE* | Incentive effects are short-lived | MEDIUM |
| 22 | Dustan, Koutout & Leo (2023), WP | Reduction violations in BQSR | MEDIUM |
| 23 | Benoit, Dubra & Romagnoli (2022), *AEJ:Micro* | Preference for control in BDM beliefs — key for Hypothesis B | HIGH |
| 24 | Burfurd & Wilkening (2022), *Experimental Economics* | Cognitive heterogeneity x SBDM — key for Hypothesis D | HIGH |
| 25 | Schlag & Tremewan (2021), *J. Risk & Uncertainty* | Frequency method as simpler BDM alternative | MEDIUM |
| 26 | Li (2017), *AER* | OSP theory — foundation for simplicity literature | LOW |
| 27 | Tsakas (2019), *Games and Economic Behavior* | OSP for belief elicitation — theory only | MEDIUM |

---

## 6. Forward Citation Search: Key Author Pages to Check

| Author | Why | URL |
|--------|-----|-----|
| David Danz | BIC program lead | david-danz.com |
| Paul Healy | Handbook chapter, ternary elicitation, BDM explanation note | healy.econ.ohio-state.edu |
| Greg Leo | Coarse elicitation, handbook chapter, reduction paper, quantile price list | gregcleo.com |
| Kristine Koutout | Reduction paper co-author | kristinekoutout.com/research |
| Alexander Brown | Simplicity refinements in elicitation | Check SSRN |
| Andreas Drichoutis | GSO in homegrown, cognitive load, game form recognition | andreasdrichoutis.com |
| Tom Wilkening | SBDM implementation, cognitive heterogeneity | U Melbourne page |
| Daniel Martin | BDM framing/cognitive cost | Check SSRN |
| Jean-Pierre Benoit | Preference for control in BDM beliefs | Check NYU Abu Dhabi page |
| Elias Tsakas | OSP belief elicitation theory | Check Maastricht page |

---

## 7. BibTeX Entries

BibTeX entries for all new papers are in `master_supporting_docs/literature/new_references_2026-03-29.bib` and have been added to `bdm_bic_paper/paper/references.bib`.

---

## Appendix: Journal Coverage Note

**Journals systematically searched:** AER, Econometrica, JPE, QJE, REStud, JEP, AEJ: Micro, Experimental Economics, JEBO, Management Science, European Economic Review, Theory and Decision, JESA, JDM, JEP: General, JASA, Journal of Economic Psychology, Journal of Behavioral and Experimental Economics, Games and Economic Behavior, Journal of Risk and Uncertainty. Plus SSRN, arXiv, and NBER working papers.

**Journals searched since initial draft:**
- **Games and Economic Behavior** — searched 2026-03-29 via Consensus (Semantic Scholar) and Google Scholar using queries: "BDM belief elicitation," "belief elicitation mechanism design incentive compatible," "binarized scoring rule," "probability elicitation mechanism." Karni's foundational work on belief elicitation mechanisms (2009, Econometrica) was published outside GEB. One relevant GEB paper found: Tsakas (2019) on obviously strategy-proof belief elicitation, which applies Li's (2017) OSP framework to Karni mechanisms — annotated in section (e). GEB publishes mechanism design theory but the empirical belief elicitation literature clusters in AER, AEJ:Micro, Experimental Economics, and JEBO.
- **Journal of Economic Psychology** — searched 2026-03-29 via IDEAS/RePEc, ScienceDirect, and Google Scholar using queries: "belief elicitation," "BDM belief," "scoring rule belief elicitation," "incentive compatibility belief," "central tendency bias belief." Found three relevant papers: Burdea & Woon (2022) on online belief elicitation methods (already in review as CESifo WP — now updated to published venue); Crosetto, Filippin, Katuscak & Smith (2020) on central tendency bias in belief elicitation; and Erkal, Gangadharan & Koh (2020), a between-subject replication of Hossain & Okui (2013) comparing BSR vs. QSR. All three annotated in section (j). No additional J. Econ Psychology papers on BDM belief elicitation or BIC testing were found.
- **Journal of Risk and Uncertainty** — searched 2026-03-29. Found Schlag & Tremewan (2021) on the frequency method for belief elicitation — annotated in section (f). Also includes Hao & Houser (2012) already in section (c).

## Appendix: Citation Confidence Legend

| Symbol | Meaning |
|--------|---------|
| Proximity 1 | Directly competes (same question, similar method) |
| Proximity 2 | Closely related (same question, different method or setting) |
| Proximity 3 | Related (overlapping topic, different angle) |
| Proximity 4 | Background (provides theory, method, or context) |
| % UNVERIFIED | Citation details need verification before use in paper |
