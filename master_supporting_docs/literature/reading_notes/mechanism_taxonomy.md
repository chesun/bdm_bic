# Mechanism Taxonomy: BDM, MPL, Simplicity Refinements, and Terminology

**Purpose:** This document maps out the precise relationships between elicitation mechanisms, simplicity refinements, and the confusing terminology used across different papers. It covers both **value elicitation** and **belief elicitation** domains, which use related but distinct mechanisms.

Last updated: 2026-04-06

---

## 1. The Two Domains

A fundamental source of confusion: the same mechanism names (BDM, MPL, clock) are used in both value elicitation and belief elicitation, but the implementations differ in important ways.

### Value Elicitation
- **Goal:** Elicit a subject's certainty equivalent (CE) or willingness-to-pay/accept for a good or lottery.
- **Payoff structure:** Outcomes involve **different monetary amounts**. E.g., keep a $2 card vs. sell it for price $π.
- **IC requirement:** Expected utility (for standard BDM); weaker for refinements.
- **Key papers:** Becker, DeGroot & Marschak (1964); Cason & Plott (2014); Brown, Liu & Tsoi (2026); Martin & Munoz-Rodriguez (2022).

### Belief Elicitation
- **Goal:** Elicit a subject's subjective probability p that some event E occurs.
- **Payoff structure:** Both outcomes are **lotteries with identical prizes** (e.g., $15 or $0) that differ only in **probabilities**. This makes the mechanism robust to risk preferences.
- **IC requirement:** Statewise monotonicity (weakest; for BDM/MPL family) or subjective-objective reduction (stronger; for scoring rules). See Healy & Leo (2025) for the hierarchy.
- **Key papers:** Karni (2009); Healy & Leo (2025); Hao & Houser (2012); Burfurd & Wilkening (2018, 2022); Burdea & Woon (2022).

### Why This Matters
A result about "BDM" in value elicitation (e.g., Brown et al.'s finding that CBC only works for ≤7 states) does not automatically transfer to belief elicitation. The cognitive demands differ: value BDM requires reasoning about monetary trade-offs; belief BDM requires reasoning about probability comparisons. The simplicity refinements may have different effectiveness across domains. **Always specify which domain when discussing results.**

---

## 2. Base Mechanisms

### 2.1 BDM (Single-Report Format)

**Value elicitation version (Becker, DeGroot & Marschak 1964):**
- Subject states a minimum selling price (or WTP) for a good.
- Computer draws a random price π from a known distribution.
- If subject's bid ≥ π: subject sells (gets π). If bid < π: subject keeps the good.
- Dominant strategy: bid = true value.
- Also called: "sealed-bid" mechanism, "direct-revelation" mechanism.

**Belief elicitation version (Karni 2009; also called "probabilistic BDM," "SBDM," "matching probabilities," or "declarative mechanism"):**
- Subject reports a probability p (0-100) that event E occurs.
- Computer draws a random number r from Uniform[0,100].
- If p ≥ r: subject gets the **event bet** (pays $H if E occurs, $L otherwise).
- If p < r: subject gets an **objective lottery** (pays $H with probability r/100, $L otherwise).
- Dominant strategy: report p = true subjective probability of E.
- Key feature: both outcomes pay the same prizes ($H, $L) — they differ only in probabilities. This makes the mechanism IC under statewise monotonicity alone, without requiring risk neutrality or EU.
- **Historical lineage:** First experimental implementation: Ducharme & Donnell (1973, "bets mode" — in psychology). First in economics: Grether (1981). Independently rediscovered by Karni (2009, Econometrica — with formal IC proof under probabilistic sophistication + dominance), Holt & Smith (2009, 2016), Mobius et al. (2013). Note: Savage (1971) developed the *proper scoring rule* method for probability elicitation, which is a different mechanism family — do not conflate with the BDM-for-beliefs. The belief BDM is an instance of the general Random Problem Selection (RPS) mechanism, whose IC under the weaker assumption of statewise monotonicity was established by Azrieli, Chambers & Healy (2018, JPE). Healy & Leo (2025, Proposition 4) derive belief BDM IC as "a simple application of Azrieli et al. (2018)."
- **IC conditions — two formulations:** Karni's (2009) original IC conditions are *probabilistic sophistication* (Machina & Schmeidler 1995) + *dominance*. Azrieli et al. (2018) / Healy & Leo (2025) restate this under the weaker assumption of *statewise monotonicity* alone. The Azrieli et al. formulation is more general (does not require well-defined subjective probabilities), but Karni's formulation is more specific to the belief elicitation context.

**Terminology alert:** Different papers call the belief elicitation version different things:
| Term | Used by | Notes |
|------|---------|-------|
| SBDM (Stochastic BDM) | Burfurd & Wilkening (2018, 2022) | Emphasizes the stochastic element |
| Probabilistic BDM | Healy & Leo (2025) | Emphasizes the probability comparison |
| Matching probabilities | Benoit, Dubra & Romagnoli (2022) | Emphasizes the indifference condition |
| Declarative mechanism | Hao & Houser (2012) | Contrasts with "clock mechanism" |
| BDM | Burdea & Woon (2022); Brown et al. (2026) | Unmodified, context determines domain |
| RBC (Random Binary Choice) | Healy (2020) note | Healy's umbrella term for the entire class; dropped in the 2025 chapter |
| Synchronized lottery choice menu | Holt & Smith (2016) | First explicit MPL representation of the BDM for beliefs |

**For this project, we use "probabilistic BDM" or "single-report BDM" for the belief elicitation version, and "standard BDM" or "value BDM" for the value elicitation version.**

### 2.2 MPL (Multiple Price List)

**Value elicitation version:**
- Subject sees a list of rows, each offering a choice: keep the good vs. sell at price $X.
- Prices increase (or decrease) across rows.
- Subject indicates where they switch from "keep" to "sell" (or vice versa).
- Switch point = elicited value.
- One row is randomly selected for payment.
- Also called: "price list," "descending price list" (if prices go high to low).

**Belief elicitation version (Healy & Leo 2025, Section 5.1.1):**
- Subject sees a list of rows, each offering a choice: **event bet** (pays $H if E, $L otherwise) vs. **objective lottery** (pays $H with probability r, $L otherwise).
- The objective lottery probability r increases across rows (e.g., 0%, 1%, 2%, ..., 100%).
- Subject indicates where they switch from preferring the event bet to preferring the objective lottery.
- Switch point = elicited probability belief.
- One row is randomly selected for payment.
- Also called: "belief price list." Holt & Smith (2016) were the first to explicitly represent the BDM as an MPL format, calling it a "synchronized lottery choice menu."

**Iterative MPL (Healy & Leo Section 6.1.3):**
- Two-stage procedure: coarse grid first (e.g., {10%, 20%, ..., 90%}), then "zoom in" to a finer grid (e.g., {30%, 31%, ..., 40%}) around the switch point.
- Used by Holt & Smith (2016) and Burfurd & Wilkening (2018, TK format).
- **Critical IC caveat:** The randomly selected row for payment must be drawn from ALL rows that *could have been encountered* (the full 100-row list), not just the rows actually shown. Otherwise subjects can manipulate the first stage to encounter more favorable rows in the second stage.

**Ternary Price List / TPL (Healy & Leo 2025, Section 5.1.2 — new mechanism):**
- Three options per row instead of two: (A) bet on event E, (B) bet on complement E^c, (C) objective lottery with probability p.
- Subject first indicates whether E or E^c is more likely, then faces an MPL covering only probabilities from 50% to 100% for that event.
- **Key advantage:** Half the rows achieve the same precision as a standard binary MPL (or same rows = double precision), because beliefs about E and E^c must sum to 100%, so one must be ≥ 50%.
- **IC requirement:** Statewise monotonicity (Axiom 5) — same as MPL, does NOT require S-O reduction. Additional assumption: beliefs about E and E^c sum to 100%.
- **Incentive strength:** Same marginal and absolute incentive strength as BQSR (double that of standard MPL).
- **Status:** Not yet tested in the laboratory as of Healy & Leo (2025).

**Terminology alert:** "MPL" in value elicitation (e.g., Holt & Laury 2002 for risk preferences) is a well-established term. In belief elicitation, Healy & Leo (2025) use "MPL" as their primary term. Burfurd & Wilkening call their list-based format "TK" (Trautmann-van de Kuilen). Holt & Smith (2016) call theirs a "synchronized lottery choice menu." **The format is the same; only the objects being compared differ (monetary amounts vs. lotteries with different probabilities).**

**Note on "RBC":** The term *random binary choice (RBC)* originates in Healy (2020), "Explaining the BDM — or Any Random Binary Choice Elicitation Mechanism — to Subjects," an unpublished pedagogical note. Healy uses RBC as an umbrella term for the entire class of mechanisms where subjects answer binary questions and one is randomly selected for payment — encompassing BDM (value), belief elicitation (Karni 2009), Holt-Laury (risk), cardinal utility elicitation, and even full preference ranking. His key insight: "there is an entire class of elicitation mechanisms — which I call *random binary choice (RBC)* mechanisms — that are procedurally identical to the BDM mechanism and can be explained in the same way" (p. 1). All are IC under monotonicity alone (Azrieli et al. 2018). The term was dropped in the published Healy & Leo (2025) chapter, which uses "MPL" and "single-response BDM" instead.

### 2.3 Clock (Sequential Format)

**Value elicitation version:**
- A price counts down (descending clock) or up (ascending clock).
- Subject decides when to stop the clock (= accept/reject the current price).
- The clock may or may not stop at the unknown random price, depending on the variant.

**Belief elicitation version (Karni 2009; Hao & Houser 2012):**
- A number counts up from 0 to 100 (ascending clock).
- At each step, subject can "switch" — accepting the current objective lottery instead of the event bet.
- If the subject doesn't switch before the clock reaches the unknown random number r, the subject gets the event bet.
- Also called: "clock mechanism," "ascending clock," "English clock" (by analogy with English auctions).

---

## 3. The Formal Equivalence

**All three formats (single-report, MPL, clock) implement the same underlying mechanism.** They differ only in how the subject interacts with it:

| Format | Subject's task | Information structure | Decision points |
|--------|---------------|----------------------|-----------------|
| Single-report (BDM) | Report one number p | Sees nothing; reasons about all possible r simultaneously | 1 (the report) |
| MPL / Price list | Choose event bet vs. lottery at each row | Sees all rows; decides row by row | Many (one per row) |
| Clock | Decide at each tick whether to switch | Sees prices sequentially; each tick reveals new information | Many (one per tick) |

Healy & Leo (2025, Section 5.1.3) make this explicit. They write: "For pedagogical purposes we believe it is useful to imagine the BDM as an MPL but with the list hidden from view," with r serving as "the randomly chosen row of the 'hidden' MPL." When you report p=67 in BDM, you are implicitly answering 100 binary questions ("would I prefer the event bet or a lottery with probability r?" for r = 0, 1, 2, ..., 100). The MPL makes these implicit choices explicit. The clock makes them sequential.

**The key behavioral difference:** In BDM, the subject must reason through all contingencies simultaneously to identify the dominant strategy. In the MPL, each row is an independent binary choice — the subject can decide each row on its own merits. In the clock, the subject makes sequential binary choices but under time pressure and with evolving information.

---

## 4. Simplicity Refinements (Brown, Liu & Tsoi 2026)

Brown et al. test three formal simplicity properties, each applied to one base mechanism. The refinement is designed to make the dominant strategy easier to identify, holding the base mechanism format constant.

### 4.1 CBC — Contingency-by-Contingency (applied to BDM)

**Source:** Martin & Munoz-Rodriguez (2022)

**What it does:** Takes the standard BDM and reframes each possible random price as a **separate computerized player**. Instead of "the computer will draw a random price," subjects are told "there are N computerized players, each offering a different price; one will be randomly selected." Subjects also see payoff tables that enumerate all contingencies explicitly. **The "computer bidder" framing and the contingency-by-contingency payoff tables both originate from Martin & Munoz-Rodriguez (2022, EER)** — Brown et al. adopted their design for the CBC treatment.

**What it simplifies:** The **payoff function**. By presenting each contingency separately (what happens if the price is $0.25, what happens if the price is $0.50, etc.), it reduces the cognitive cost of understanding the mechanism's payoff structure. Subjects don't need to reason through all contingencies simultaneously — they can inspect each one.

**How it relates to MPL:** CBC and MPL both decompose the BDM into consideration of individual contingencies. The difference:
- **CBC** keeps the BDM frame (subject still submits a single bid) but presents payoff information contingency-by-contingency via tables. It simplifies the *information presentation* while keeping the *action space* the same (one number).
- **MPL** changes the action space entirely — instead of submitting one number, the subject makes a separate binary choice at each contingency (each row). It changes both the *information presentation* AND the *decision format*.

**Key result:** CBC doubles the optimal bidding rate relative to standard BDM in Martin & Munoz-Rodriguez's online experiments (17% → 34%), but **only when the state space is small (≤7 possible prices)**. In Brown et al.'s lab with a larger state space (17-33 possible prices), CBC does NOT significantly improve bidding. The specific implementation does not scale.

**However:** Brown et al. note (p.4) that "the PL-based mechanisms may very well succeed because they make subjects go row-by-row over each contingency in isolation, suggesting the underlying principle of considering contingencies in isolation may be sound, even if the specific CBC implementation does not scale to larger state spaces." In other words, the MPL may achieve the spirit of CBC through its format.

### 4.2 OSP — Obviously Strategy-Proof (applied to Clock)

**Source:** Li (2017)

**What it does:** Modifies the descending clock so that it stops **either** when the subject stops it **or** when it reaches the unknown price (whichever comes first). In the non-OSP clock, the clock only stops when the subject stops it — the subject doesn't know whether the clock has passed the unknown price.

**What it simplifies:** The **dominant strategy** is made "obvious" — at any point during the clock, the worst-case outcome from continuing is at least as good as the best-case outcome from stopping (for prices above your value). The subject doesn't need to reason about future contingencies.

**Key result:** OSP improves bidding in multiplayer auctions (Li 2017; Breitmoser & Schweighofer-Kodritsch 2022) but does NOT improve bidding in Brown et al.'s single-player elicitation environment. The single-player context may already be simple enough that OSP adds no benefit.

**Connection to belief elicitation:** Hao & Houser's (2012) clock mechanism for beliefs has OSP-like features (it stops when the clock reaches the unknown random number r), but Chakraborty & Kendall (2025, p. 6) explicitly note that it does NOT formally satisfy OSP (citing Tsakas 2019). Note: C&K misspell the author as "Hauser" — the correct name is Houser. Their finding that the clock outperforms the declarative mechanism may reflect the sequential format rather than the OSP property per se.

### 4.3 GSO — Game-Structure Obviousness (applied to Price List)

**Source:** Brown et al. use the term "game-structure obvious (GSO)" to refer to mechanisms satisfying Chakraborty & Kendall's (2025) UJS property in their experimental context. **Note on terminology:** GSO and UJS are related but not formally identical concepts:
- **GSO** originates in Chakraborty & Kendall's 2022 working paper ("Future Self-Proof Elicitation Mechanisms"), defined via four structural game properties (last mover, similar future actions, no cycles, salient contingency).
- **UJS** is the reformulated concept in the 2025 published version, defined via justifiability in simplified games — a more general framework.
- Brown et al. (2026) adopt the "GSO" label but define it using C&K 2025's UJS conditions (their Definitions 2-4 on p. 11), effectively treating them as equivalent for the binary allocation mechanisms they study.
- **For our paper, cite the concept as UJS (following the 2025 published version) and note the earlier GSO terminology where needed for clarity.**

**What it does:** Modifies the descending price list so that it **terminates at the unknown price** rather than continuing to zero. Subjects cannot make choices at prices below the unknown price. This means that at every decision point the subject encounters, the dominant strategy (reject at prices above value, accept at prices below) is the **uniquely justifiable action** — no alternative action can be rationalized as a best response under any payoff-relevant contingency.

**What it simplifies:** The **game structure**. By eliminating decision points where the dominated action could be justified (because the subject might reason "maybe the price will go lower, so I should wait"), it makes the dominant strategy the only action that makes sense at each decision point, regardless of what the subject believes about future contingencies or their own future behavior.

**Key result:** The PL (GSO) generates higher rates of optimal bidding than BDM (NOT CBC), confirming Chakraborty & Kendall's experimental results. But PL (NOT GSO) performs equally well — the GSO/UJS property adds nothing beyond what the price list format already provides.

**Connection to belief elicitation:** Chakraborty & Kendall (2025) prove that UJS mechanisms for binary allocation (including belief elicitation) take the form of **generalized MPLs**. The single-report BDM is NOT UJS because many non-dominant reports are justifiable at the single decision point. The MPL IS UJS because each row has a uniquely justifiable action. This provides a formal theoretical explanation for why MPL outperforms BDM: in the MPL, truth-telling is the *only justifiable* action at each row, while in BDM, many non-truthful reports can be rationalized.

---

## 5. Summary Table: Mechanisms, Refinements, and Properties

### Value Elicitation (Brown et al. 2026)

| Mechanism | Refinement | Simplicity property | Format | Subject's action | Result |
|-----------|-----------|-------------------|--------|-----------------|--------|
| BDM (NOT CBC) | — | — | Single bid | Report one number | 26% optimal (baseline) |
| BDM (CBC) | CBC | Payoff simplification | Single bid + payoff tables | Report one number (with contingency info) | No significant improvement over BDM; only works for ≤7 states |
| CLOCK (NOT OSP) | — | — | Descending clock | Stop the clock | Fewer optimal than BDM |
| CLOCK (OSP) | OSP | Obvious dominance | Descending clock (stops at unknown price) | Stop the clock | No significant improvement over CLOCK |
| PL (NOT GSO) | — | — | Descending price list | Binary choice at each row (all rows shown) | ~50% optimal; significantly outperforms BDM |
| PL (GSO) | GSO / UJS | Game-structure obviousness | Descending price list (terminates at unknown price) | Binary choice at each row (rows stop at unknown price) | ~50% optimal; no improvement over PL (NOT GSO) |

**Bottom line for value elicitation:** The price list format outperforms all others. None of the three formal simplicity refinements (CBC, OSP, GSO) adds significant value beyond the format itself.

### Belief Elicitation (synthesized from multiple papers)

| Mechanism | Equivalent term(s) | Format | Subject's action | IC requirement | Key behavioral evidence |
|-----------|-------------------|--------|-----------------|----------------|----------------------|
| Single-report BDM | Probabilistic BDM, SBDM, matching probabilities, declarative mechanism | Report one probability | Type a number 0-100 | T statewise monotonicity (Axiom 5) | 47-53% non-optimal (Hao & Houser; Burdea & Woon); 47% comprehension (Burdea & Woon) |
| Belief MPL | TK format (Burfurd & Wilkening), synchronized lottery choice menu (Holt & Smith 2016) | List of binary choices | Choose event bet vs. objective lottery at each row | T statewise monotonicity (Axiom 5) | ~50% optimal on first play (Brown et al., value domain); superior learning (Brown et al.) |
| Iterative MPL | Two-stage MPL, drill-down MPL | Coarse list → zoom-in list | Two-step switching | T statewise monotonicity (Axiom 5); must randomize from full grid | Used by Holt & Smith (2016), Burfurd & Wilkening (2018 TK format) |
| Ternary Price List (TPL) | — (new in Healy & Leo 2025) | List of ternary choices (bet E, bet E^c, lottery) | Choose among 3 options per row | T statewise monotonicity (Axiom 5) + beliefs sum to 100% | Double incentive strength of MPL; NOT YET LAB-TESTED |
| Belief Clock | Clock mechanism (Hao & Houser), ascending clock | Sequential binary decisions | Decide when to switch | T statewise monotonicity (Axiom 5) | 39% optimal among all novice observations, 64% among non-censored (Hao & Houser); censors 39% of naive responses; NOT formally OSP per Tsakas (2019) |
| BQSR | Binarized quadratic scoring rule | Report one probability | Type a number 0-100 | S-O reduction (Axiom 6, strictly stronger) | 73% comprehension (Burdea & Woon); strongest uniform incentives (G''(p)=2 for all p) |

**IC hierarchy (Healy & Leo 2025):** T-statewise monotonicity (Axiom 5, weakest — for MPL/BDM/TPL) < S-O reduction (Axiom 6 — for all binarized scoring rules) < Risk-neutral EU (strongest — for dollar-denominated scoring rules). Axiom 5 is strictly weaker than Axiom 6 (Healy & Kagel 2023). Note: The "T" prefix in Healy & Leo refers to the extended preference over the random-question-selection state space T — it is their notation for statewise monotonicity applied to the compound lottery created by random round selection.

**Attribution note:** The IC result for belief BDM/MPL combines two contributions: (1) **Karni (2009)** proves IC for the specific probabilistic BDM for beliefs (building on Savage 1971 and Grether 1981); (2) **Azrieli, Chambers & Healy (2018, JPE)** proves the general result that any Random Problem Selection (RPS) mechanism is IC under monotonicity. Healy & Leo (2025, Proposition 4) derive belief BDM IC as a special case of Azrieli et al. Cite Karni (2009) for the specific mechanism, Azrieli et al. (2018) for the general framework.

**Note:** CBC, OSP, and GSO/UJS have NOT been formally tested in the belief elicitation domain. Brown et al.'s results are for value elicitation. The translation to beliefs is an open empirical question and relevant to our project. The TPL has also not been lab-tested.

---

## 6. The BDM–MPL Relationship: Three Perspectives

The relationship between single-report BDM and MPL can be understood from three different theoretical angles:

### Perspective 1: Formal Equivalence (Healy & Leo 2025)
BDM and MPL are **the same mechanism** implemented differently. As Healy & Leo (2025) put it: "imagine the BDM as an MPL but with the list hidden from view." The subject's task in BDM (report p) implicitly answers all the binary questions that the MPL asks explicitly. The MPL just makes the implicit explicit.

### Perspective 2: Different Simplicity Properties (Brown et al. 2026)
BDM and MPL are **different mechanism formats** that can each be further refined:
- BDM can be refined via CBC (contingency-by-contingency payoff tables)
- MPL can be refined via GSO (termination at the unknown price)

In this framework, the MPL is not a "refinement of BDM" — it is a different base format. But Brown et al. themselves note that the MPL may succeed *because* it achieves the same goal as CBC (row-by-row contingency consideration) through its format rather than through explicit framing.

### Perspective 3: Different Game-Theoretic Properties (Chakraborty & Kendall 2025)
BDM is NOT UJS; MPL IS UJS. The MPL has a strictly stronger game-theoretic simplicity property: at each row, truth-telling is the *uniquely justifiable* action, while in BDM, many non-truthful reports are justifiable at the single decision point. In this framework, the MPL is a **structurally simpler** mechanism than BDM, not merely a different format.

### Synthesis
These three perspectives are complementary, not contradictory:
1. Formally, BDM and MPL implement the same mapping from beliefs to outcomes.
2. Behaviorally, they differ because the MPL decomposes the decision into independent binary choices (one per row), reducing the contingent reasoning required.
3. Game-theoretically, this decomposition gives the MPL a stronger simplicity property (UJS) that BDM lacks.

The practical upshot: **the MPL achieves what CBC tries to do (make contingent reasoning row-by-row) but through its format rather than through explicit payoff tables, and it also achieves what GSO/UJS provides (uniquely justifiable dominant strategy at each decision point) without needing the termination-at-unknown-price modification.** This is why the plain price list outperforms all other mechanisms and refinements in Brown et al.'s experiments.

---

## 7. Implications for Our Project

1. **When we say "BDM" in our paper, we mean the single-report probabilistic BDM for belief elicitation (Karni 2009).** Not value BDM. We should define this clearly in the paper.

2. **The simplicity refinement literature (Brown et al.) is for value elicitation.** We should be cautious about transferring results directly. Testing whether CBC/GSO help in belief elicitation could be a contribution, but it is not our main focus.

3. **The MPL is the natural comparison mechanism for our BDM BIC tests.** It has the same IC requirements (statewise monotonicity), implements the same underlying mechanism, but achieves UJS (each row independently justifiable). If BDM fails BIC but MPL does not, the failure is attributable to the single-report format, not the underlying incentive structure.

4. **We should avoid calling the MPL a "simplicity refinement of BDM."** In Brown et al.'s taxonomy, they are different base formats. The MPL achieves the *goals* of simplicity refinements (particularly CBC and GSO) through its format, but it is not classified as a refinement. We can say: "the MPL makes explicit the implicit contingent reasoning that BDM requires, providing a structurally simpler decision format (UJS per Chakraborty & Kendall 2025) while implementing the same underlying mechanism (Healy & Leo 2025)."

5. **Terminology discipline for the paper:**
   - "Single-report BDM" or "probabilistic BDM" for our mechanism of interest
   - "Belief MPL" or "belief price list" for the list-format equivalent
   - "Matching probabilities" only when discussing Benoit et al.'s specific implementation
   - Never unmodified "BDM" without specifying value vs. belief domain
   - Never "SBDM" without defining it (the "S" is ambiguous — stochastic? standard?)
