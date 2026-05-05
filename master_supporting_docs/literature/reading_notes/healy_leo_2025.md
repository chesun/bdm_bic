---
citation: Healy, P. J., & Leo, G. (2025). Belief elicitation: a user's guide. Chapter 3 in *Handbook of Experimental Methodology*, Vol. 1, Snowberg & Yariv (eds.), Elsevier. ISSN 3051-1674. DOI: 10.1016/bs.hbem.2025.09.002.
bibtex_key: healy_leo_2025
primary_source: master_supporting_docs/literature/papers/Chapter-3-healy_leo_belief_elicitation_guide.pdf
date_read: 2026-04-24
reader: Claude
session_log: quality_reports/session_logs/2026-04-23_advisor-meeting-anujit.md
pages_read_closely: 81–100 (front matter, §2 theory, §2.4 BSR IC). Remaining sections (§2.5–§5 mechanisms, §6 implementation, appendix) skimmed via TOC; will be re-read if specific sections become relevant.
---

# Healy & Leo (2025) — Belief Elicitation: A User's Guide

**Reading mandate for this session.** Two questions:
1. Does H&L make the "elicits a probability" vs. "truth-telling is dominant" distinction explicit, and what terminology do they use?
2. Does H&L treat Karni's dominance over lotteries and ACH's statewise monotonicity over acts as the same condition?

**Short answer.**
1. **Yes.** H&L make the distinction explicit and rigorously. The terminology is: "probability equivalent" (what BDM/MPL elicit when PS fails) vs. "belief" / "probability" (what they elicit when PS holds). Crucially, **H&L state that BDM and MPL IC does NOT require PS** (p. 90); only the *interpretation* of the elicited quantity as a belief requires PS. This validates the Karni-vs-ADR-0012 reconciliation in substance, and replaces my made-up labels ("mechanism IC" / "belief IC") with H&L's published terminology.
2. **No** — they are distinct axioms. H&L's framework distinguishes Axiom 2 (statewise monotonicity over pure bets) from Axiom 4 (monotonicity over pure lotteries). Karni's "dominance" is Axiom 4. ACH-style "monotonicity" maps to Axiom 2 (for pure bets) or Axiom 5 (T-statewise monotonicity for BDM/MPL extension). All three (Axioms 2, 4, 5) are special cases of the more general FOSD dominance Axiom 2*. Anujit's claim that they are "the same" is loose — it is true that they are *related* (both are dominance/monotonicity-style axioms in the AA framework), but they are *not the same axiom*. Belief existence requires Axiom 2 AND Axiom 4 (Proposition 1), not just one of them.

## Summary

Comprehensive 82-page handbook chapter surveying belief-elicitation theory and practice. Designed as a "choose your own adventure" reference. Sections 2.1–2.4 are the theoretical core: define what a belief is in choice terms (using Anscombe-Aumann acts), give axioms for belief existence and uniqueness, derive IC for BDM/MPL (Proposition 4, citing ACH 2018) and for binarized scoring rules (Fact 1, requires S-O reduction), and discuss what BDM/MPL elicit under ambiguity aversion (probability equivalents, §2.2). Sections 5–6 provide an encyclopedic cookbook for specific elicitation tasks. The IC hierarchy: monotonicity (BDM/MPL) < S-O reduction (BSR) < EU (dollar-denominated SR).

## Core claims this paper makes

### Theoretical framework (§2.1)

- A *belief* about event E is the indifference probability μ(E): the unique p such that f^E ∼ L^p (Definition 2, p. 86).
- A *revealed belief* μ^r(E) is the unique switching point in any increasing sequence of objective lottery probabilities {p_1,...,p_n} (Definition 3, p. 87). Defined without continuity.
- Existence of belief follows from Axioms 1 (preference relation), 2 (statewise monotonicity over pure bets: E ⊇ F ⇒ f^E ≽ f^F), 3 (continuity), 4 (monotonicity over pure lotteries: p ≥ q iff L^p ≽ L^q). (Proposition 1, p. 87.)
- Existence of *revealed* belief follows from Axioms 1, 2, 4 (no continuity needed). (Proposition 2, p. 88.)
- A subject is *probabilistically sophisticated* (in the Machina-Schmeidler 1995 sense) if their preferences satisfy Axioms 1*, 2* (FOSD dominance), 3* (mixture continuity), 4* (horse/roulette replacement). Theorem 1 (p. 89): under these axioms, preferences admit a probability + utility representation. Crucially, well-behavedness — finite additivity, reduction — comes from Axiom 4*, not from monotonicity alone.

### IC for BDM/MPL (§2.3)

- The BDM and MPL generate three-stage acts (a randomization over which row gets paid, then the subjective vs. objective lottery within the row). Preferences must extend from two-stage AA acts A to three-stage acts Φ.
- **Axiom 5 (T statewise monotonicity, p. 93):** the extended preference ≽* over Φ is monotone with respect to ≽: if φ(τ) ≽ φ'(τ) for every τ, then φ ≽* φ'.
- **Proposition 4 (p. 93):** A BDM or MPL is IC for ≽ whenever the extension ≽* satisfies T-statewise monotonicity. **"The following is then a simple application of Azrieli et al. (2018)."**
- Plain-English IC argument: "If they lie about their belief, they change their answer on some rows of the list to something they prefer less. Thus, the only way they get their most-preferred lottery/bet on every row is to tell the truth." (p. 93)

### IC for BSR (§2.4)

- BSR generates a compound lottery with one subjective stage (E or E^c) and one objective stage (the lottery indexed by report q).
- **Axiom 6 (subjective-objective reduction, p. 96):** the participant evaluates the BSR compound lottery as a single one-stage lottery with overall probability `U(q|p) = p·s_1(q) + (1-p)·s_0(q)`.
- **Fact 1 (p. 96):** S-O reduction implies BSR is IC.
- **Fact 2 (p. 98):** if a participant accepts that *every* proper binarized scoring rule is IC for them, then their preferences must satisfy S-O reduction.
- BSR IC strictly stronger than BDM/MPL IC. To compute U(q|p), the participant must HAVE a belief p (PS) AND apply S-O reduction. BDM/MPL IC needs only monotonicity over the extended preference.

### Probability equivalents under ambiguity aversion (§2.2)

This is the section that directly answers the project's Point-4 question. Verbatim:

> "There are some cases where probabilistic sophistication is known to be violated. For example, in the Ellsberg paradox players choose bets that reveal μ(·) must sum to less than one. Our Definition 2 does not rule out this possibility. Thus, we can elicit "beliefs" even when those beliefs do not sum to one. However, binarized scoring rules require probabilistic sophistication for incentive compatibility (see below) and thus should not be used to elicit non-additive beliefs. **The BDM and MPL mechanisms do not require probabilistic sophistication and therefore can still be used.**" (p. 90, emphasis mine)

> "When probabilistic sophistication is violated (for example, due to ambiguity aversion) we arguably should not refer to the elicited quantities as 'beliefs' or 'probabilities' as they do not satisfy the standard properties of a probability distribution. Instead, we will refer to them as 'probability equivalents,' since they are simply the objective probabilities that the participant views as equivalent to the ambiguous bet." (p. 90)

> "Under the Maxmin Expected Utility model (Gilboa and Schmeidler, 1989) the participant is assumed to (behave as if they) have a closed interval of probabilities, and their stated probability equivalent for each event will be the minimum probability in that interval. In that case, the elicited probability equivalents have a clear meaning. But for other models of ambiguity aversion (such as Klibanoff et al., 2005) the interpretation is less clear. In general, the elicited probability equivalent captures both the participant's 'likelihood' of the event and their degree of ambiguity aversion, and disentangling these is impossible unless the question is viewed through the lens of a specific model." (p. 91)

## Definitions I should cite verbatim

**Belief (Definition 2, p. 86):**
> A participant has a belief μ(E) ∈ [0,1] about event E ⊆ Ω if μ(E) is the unique number such that f^E ∼ L^{μ(E)}.

**Revealed belief (Definition 3, p. 87):**
> A decision maker with preference ≽ has a revealed belief μ^r(E) ∈ [0,1] about event E ⊆ Ω if, for any increasing sequence of probabilities {p_1,...,p_n} (meaning 0 ≤ p_1, p_i < p_{i+1} for all i < n, and p_n ≤ 1), μ^r(E) is the unique number satisfying p_i < μ^r(E) ⇒ f^E ≻ L^{p_i}, and p_i > μ^r(E) ⇒ L^{p_i} ≻ f^E.

**Axiom 2 — Statewise monotonicity over pure bets (p. 87):**
> If E ⊇ F then f^E ≽ f^F.

**Axiom 4 — Monotonicity over pure lotteries (p. 87):**
> p ≥ q if and only if L^p ≽ L^q.

**Axiom 5 — T statewise monotonicity (p. 93):**
> Given ≽ over A, a consistent extension ≽* over Φ satisfies statewise monotonicity if φ(τ) ≽ φ'(τ) for every τ implies φ ≽* φ', with strict preference if φ(τ) ≻ φ'(τ') for some τ' ∈ T.

**Axiom 6 — Subjective-objective reduction (p. 96):**
> A participant satisfies subjective-objective reduction (S-O reduction) if they evaluate compound lotteries of the form shown in Fig. 2 according to their overall reduced probability U(q|p) = p·s_1(q) + (1-p)·s_0(q).

**Probability equivalent (p. 90):**
> When probabilistic sophistication is violated (for example, due to ambiguity aversion) we arguably should not refer to the elicited quantities as 'beliefs' or 'probabilities' as they do not satisfy the standard properties of a probability distribution. Instead, we will refer to them as 'probability equivalents,' since they are simply the objective probabilities that the participant views as equivalent to the ambiguous bet.

**Proposition 4 — BDM/MPL IC (p. 93):**
> A BDM or MPL is incentive compatible for ≽ whenever the extension ≽* satisfies T statewise monotonicity. The following is then a simple application of Azrieli et al. (2018).

**The "BDM/MPL does not require PS" sentence (p. 90):**
> The BDM and MPL mechanisms do not require probabilistic sophistication and therefore can still be used.

## What this paper is NOT claiming (common misreadings)

- **Misreading:** BDM/MPL IC requires probabilistic sophistication.
  **Correction:** Explicitly false per H&L p. 90 and Proposition 4 p. 93. BDM/MPL IC requires only T statewise monotonicity (Axiom 5). What requires PS is the *interpretation* of the elicited quantity as a belief; without PS, what is elicited is a "probability equivalent." This is the precise resolution of Anujit's Point 4 vs. ADR-0012.

- **Misreading:** Karni's "dominance over lotteries" and ACH's "statewise monotonicity over acts" are the same axiom.
  **Correction:** They are distinct. Karni's dominance is H&L's Axiom 4 (over pure lotteries). ACH's monotonicity maps to H&L's Axiom 2 (over pure bets) or Axiom 5 (over the three-stage extension). Belief existence (Proposition 1) requires Axioms 1, 2, 3, 4 — including BOTH 2 and 4 — so the two are not interchangeable. They are related: H&L's Axiom 2* (FOSD dominance over AA acts) implies both Axiom 2 (set n=3, q_1=p_2=1, q_2=q_3=0) and Axiom 4 (set E_1=Ω). But Axiom 2* is stronger than either alone.

- **Misreading:** Probability equivalents elicited under ambiguity aversion are "wrong beliefs" that need to be corrected.
  **Correction:** They are coherent quantities that capture both the agent's likelihood judgment and their ambiguity attitude (p. 91). Under maxmin, they are the minimum of the prior set — meaningful but not a single belief. Under smooth ambiguity (Klibanoff et al., 2005), the interpretation is "less clear." H&L's view: probability equivalents are useful elicitation outputs, but they should not be called "beliefs" without qualification when PS may fail.

- **Misreading:** The IC hierarchy (monotonicity < S-O reduction < EU) means BDM/MPL elicit *less* than BSR.
  **Correction:** The hierarchy is about *which* assumption gets you IC, not about what is elicited. BDM/MPL elicit beliefs (under PS) or probability equivalents (under ambiguity), under the weakest assumption. BSR also elicits beliefs (under PS + S-O reduction) but under a stronger assumption. The hierarchy ordering means BDM/MPL is IC for a *broader class of preferences* (including ambiguity-averse). This is BDM/MPL's main advantage over BSR.

## Method

Theoretical handbook chapter. No original data. Heavy use of the Anscombe-Aumann (1963) framework; key axiomatic results from Machina-Schmeidler (1995); IC results derived from ACH (2018) for BDM/MPL and from Healy-Kagel (2023) for BSR.

## Key numerical results

- BDM/MPL has incentive strength G''(p) = 1 (Reduced BDM/MPL row of Table 1, p. 99).
- BSR has G''(p) = 2 (uniformly maximizing minimum incentives among proper BSRs, Proposition 5, p. 100).
- Reduced BDM/MPL has half the incentive strength of BQSR (consistent with our compiled-notes finding).

## Relevance to our project

### For ADR-0012 (Azrieli monotonicity as IC foundation)

H&L Proposition 4 is the direct statement of ACH-monotonicity-as-IC for BDM/MPL: "A BDM or MPL is incentive compatible for ≽ whenever the extension ≽* satisfies T statewise monotonicity. The following is then a simple application of Azrieli et al. (2018)."

ADR-0012's three "no" claims (no EU, no ROCL, no PS) are confirmed for IC. PS is explicitly not required for BDM/MPL IC (p. 90). So ADR-0012 is right about IC.

What ADR-0012 leaves implicit and the paper should make explicit: under ambiguity aversion (PS failure), what BDM/MPL elicit is a *probability equivalent*, not a belief. The ADR's body should add a sentence on this. The change is interpretive, not foundational.

**Action:** Edit ADR-0012 to scope the "no PS needed" claim to IC specifically, add a "what is elicited" subsection that names probability equivalents per H&L (2025). This is an addition, not a supersession.

### For Anujit's Point 4

Anujit's claim ("pBDM IC requires monotonicity AND probabilistic sophistication") is partially right and partially wrong relative to H&L:
- Wrong: PS is not required for IC (H&L p. 90 explicit).
- Right: PS is required for the elicited quantity to BE a belief (H&L p. 90 explicit). Without PS, what we elicit is a probability equivalent, not a belief.

The paper / deck / ADRs should adopt H&L's terminology: "BDM/MPL is IC under monotonicity and elicits a probability equivalent; under PS, the probability equivalent is the agent's belief." This is more precise than either Karni's framing (assumes PS throughout) or my made-up "mechanism IC vs. belief IC" labels.

### For Anujit's "dominance = monotonicity" claim

H&L distinguishes Axiom 2 (over pure bets), Axiom 4 (over pure lotteries), and Axiom 5 (T statewise over extended preference). Karni's dominance corresponds to Axiom 4. ACH-style monotonicity corresponds to Axiom 2 or Axiom 5 depending on context. They are not the same axiom; both are needed for belief existence (Proposition 1). Anujit's claim is loose.

### For the deck — Frame 4

Current Frame 4 presents Karni (PS + dominance) and ACH (monotonicity) as competing IC foundations with ACH "strictly weaker." Post-H&L: rewrite Frame 4 to use H&L's framework. The clean version is something like: "Under T statewise monotonicity (Axiom 5, ACH 2018), BDM/MPL is IC and elicits a probability equivalent. Under additional PS (Theorem 1, Machina-Schmeidler 1995), the probability equivalent is the agent's belief. BSR requires the strictly stronger S-O reduction (Axiom 6) for IC."

### For H3 — the "complexity" hypothesis

H&L p. 91: "the elicited probability equivalent captures both the participant's 'likelihood' of the event and their degree of ambiguity aversion, and disentangling these is impossible unless the question is viewed through the lens of a specific model." This is exactly the Bayesian-arm contamination concern. In the ball-urn arm, ambiguity is zero (objective probability), so the probability equivalent equals the belief equals the objective probability. In the Bayesian arm, ambiguity may be nonzero; the probability equivalent then conflates likelihood with ambiguity attitude.

This does not kill the Bayesian arm. It does mean the H3 finding "gap widens with complexity" needs careful framing: under PS, the gap widens with cognitive burden; under ambiguity, the gap also reflects ambiguity aversion's interaction with the mechanism.

### For the paper's theory section

H&L Chapter 3 is the right primary reference for our IC-defense exposition. We can essentially follow H&L's framework: define belief via indifference probability, give axioms 1–5, state Proposition 4 with ACH 2018 as the underlying result, distinguish belief from probability equivalent. Karni (2009) becomes a citation for the original BDM-for-beliefs mechanism; ACH (2018) becomes the citation for the general IC result; H&L (2025) becomes the citation for the ambiguity-aversion clarification.

## Open questions flagged by this paper (for our work)

- **What model of ambiguity aversion (if any) should we assume in interpreting Bayesian-arm results?** Maxmin is clean (probability equivalent = inf of prior set); smooth ambiguity (Klibanoff et al., 2005) is less clean. The paper may not need to commit to a model — just acknowledge that the probability equivalent in the Bayesian arm captures both likelihood and ambiguity attitude.
- **Is "probability equivalent" the right term in our paper, or is something more accessible better?** H&L use it consistently. Snowberg-Yariv handbook ⇒ likely to be the field-standard term going forward. Adopt unless we have a reason not to.
- **Does H&L's Proposition 4 (T statewise monotonicity) cover discrete BDM/MPL where the q-grid is finite (e.g., 5pp)?** From the proof structure, yes — T is just the random-row state space, and discreteness of T does not matter. Worth confirming when reading ACH 2018 directly.

## Passages worth quoting

p. 86: "A participant has a belief μ(E) ∈ [0,1] about event E ⊆ Ω if μ(E) is the unique number such that f^E ∼ L^{μ(E)}."

p. 90: "The BDM and MPL mechanisms do not require probabilistic sophistication and therefore can still be used."

p. 90: "When probabilistic sophistication is violated (for example, due to ambiguity aversion) we arguably should not refer to the elicited quantities as 'beliefs' or 'probabilities' as they do not satisfy the standard properties of a probability distribution. Instead, we will refer to them as 'probability equivalents.'"

p. 91: "In general, the elicited probability equivalent captures both the participant's 'likelihood' of the event and their degree of ambiguity aversion, and disentangling these is impossible unless the question is viewed through the lens of a specific model."

p. 93: "A BDM or MPL is incentive compatible for ≽ whenever the extension ≽* satisfies T statewise monotonicity. The following is then a simple application of Azrieli et al. (2018)."

p. 93: "If they lie about their belief, they change their answer on some rows of the list to something they prefer less. Thus, the only way they get their most-preferred lottery/bet on every row is to tell the truth."
