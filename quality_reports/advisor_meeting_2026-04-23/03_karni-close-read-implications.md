# Karni (2009) + Healy-Leo (2025) Close-Read: Implications for the Project

**Date:** 2026-04-23 (Karni); 2026-04-24 (H&L)
**Companion to:**
- `master_supporting_docs/literature/reading_notes/karni_2009.md`
- `master_supporting_docs/literature/reading_notes/healy_leo_2025.md`

**Status:** Karni and H&L re-reads complete. ACH primary-source still owed for completeness, but H&L Proposition 4 cites ACH 2018 explicitly and gives the IC result we need, so the substantive reconciliation is now grounded in the literature. ADR / paper / deck edits remain deferred until the user has reacted to the H&L findings.

<!-- primary-source-ok: karni_2009, azrieli_chambers_healy_2018, machina_schmeidler_1995, healy_leo_2025 -->

## Finding

**Anujit's Point 4 is correct as a claim about Karni's proof.** PS is a load-bearing assumption in Karni's IC argument, invoked at a specific step (Case 3 of the IC proof on p. 604, where `r > π(E)` and the proof needs `ℓ(r,x,y) ≻ β`). Removing PS breaks step 1 of the chain `β ∼ ℓ(π(E),x,y) ≺ ℓ(r,x,y)` — the act-to-lottery translation via π(E) is exactly what PS provides. The concluding remark on p. 606 confirms Karni's own view: when the no-stake condition fails, PS fails, and the mechanism fails.

**But Anujit's Point 4 is not correct as a claim about pBDM IC in general.** H&L (2025) p. 90 states explicitly: "The BDM and MPL mechanisms do not require probabilistic sophistication and therefore can still be used." H&L's IC argument (Proposition 4, p. 93) cites ACH (2018) and uses only T-statewise monotonicity (Axiom 5) — no PS. Karni's proof uses PS because Karni works in a framework where the elicited quantity is *a priori* taken to be a probability. The H&L framework shows this is not necessary for IC; what fails without PS is the *interpretation of the elicited quantity as a belief*, not the IC of the mechanism.

**The reconciliation has a published version, with H&L's terminology.** H&L distinguishes:
- *belief* / *probability* μ(E) — the indifference point f^E ∼ L^{μ(E)}, well-defined under PS;
- *probability equivalent* — what BDM/MPL elicit when PS fails (e.g., under ambiguity aversion). Under maxmin, the probability equivalent equals the lower bound of the agent's prior set; under smooth ambiguity, the interpretation is "less clear" (p. 91); in general, "the elicited probability equivalent captures both the participant's 'likelihood' of the event and their degree of ambiguity aversion, and disentangling these is impossible unless the question is viewed through the lens of a specific model" (p. 91).

**This replaces my made-up "mechanism IC vs. belief IC" labels.** The published, field-standard distinction is: BDM/MPL is IC and elicits a *probability equivalent* under monotonicity; under PS, the probability equivalent is a *belief*. Use H&L's terminology in the paper, deck, and ADRs.

## Implications by artifact

### ADR-0012 — currently commits to "Azrieli monotonicity; no PS needed"

After H&L: ADR-0012's IC claim is correct. H&L Proposition 4 (citing ACH 2018) confirms BDM/MPL is IC under T-statewise monotonicity alone — no PS, no ROCL, no EU. ADR-0012's three "no" claims hold for IC.

What ADR-0012 leaves implicit: under PS, the mechanism elicits the agent's belief μ(E); without PS, it elicits a *probability equivalent* in H&L's sense. The ADR does not currently use this language. The change needed is interpretive (add a "what is elicited" subsection), not foundational (no supersession needed).

**Action (deferred):** edit ADR-0012's body to add a subsection naming probability equivalents per H&L (2025) and clarifying that PS is not required for IC but is required for the elicited quantity to be a belief. This is an addition, not a supersession. Keep ADR-0012 Decided.

The originally proposed (a)/(b) options — scope vs. supersede — are now obsolete. The reconciliation is in the literature; ADR-0012 just needs the H&L language added.

### Deck — Frame 4 (`04_slides.tex` lines ~49–56)

Current language ("Azrieli's monotonicity is strictly weaker — the minimal sufficient assumption for IC") is correct on the IC question but incomplete on the interpretation question. After H&L: rewrite Frame 4 to use the published framework. One-frame version:
- T-statewise monotonicity (ACH 2018, H&L 2025 Axiom 5) ⇒ BDM/MPL is IC.
- Without PS, the elicited quantity is a probability equivalent (H&L 2025 §2.2), not a belief.
- Under PS (Machina-Schmeidler 1995), the probability equivalent is the agent's belief.
- BSR additionally requires S-O reduction (H&L Axiom 6) for IC — strictly stronger.

Do not edit yet. Wait until the user has reacted to the H&L findings.

### Paper theory section

The IC-defense paragraph needs the two-notion distinction made explicit. One-liner to aim for: "Under monotonicity alone, the mechanism is IC in the sense that truthful revelation of preference over each binary choice in the menu is weakly dominant (ACH 2018). Interpreting the switching point as the agent's subjective probability additionally requires probabilistic sophistication (Karni 2009)." Then: under PS, the two notions coincide; without PS, the mechanism elicits a preference switching point that is not a probability.

### H3 — the "complexity" hypothesis

Karni's p. 606 remark and H&L p. 91 together pin down the Bayesian-arm concern. H&L's clean statement: "the elicited probability equivalent captures both the participant's 'likelihood' of the event and their degree of ambiguity aversion, and disentangling these is impossible unless the question is viewed through the lens of a specific model."

In the ball-urn arm, ambiguity is zero (objective probability) ⇒ probability equivalent = belief = objective probability. Clean.

In the Bayesian arm, ambiguity may be nonzero ⇒ probability equivalent conflates likelihood with ambiguity attitude. The H3 contrast across arms then varies cognitive burden AND ambiguity attitude jointly.

The H&L finding does NOT kill the Bayesian arm. It changes the framing:
- The mechanism is still IC in the Bayesian arm (only requires monotonicity).
- The elicited quantity is a probability equivalent, which under PS is a belief.
- The "BDM fails BIC" finding in the Bayesian arm is interpretable: subjects fail to identify the action that maximizes their probability equivalent. This is still a behavioral failure of the mechanism's IC.
- What is contaminated is the interpretation of the *gap* between arms as "complexity-driven." The gap may also reflect ambiguity-attitude differences across arms.

Design resolution still pending: relabel H3 to "endogenous-vs-induced beliefs" or similar, add auxiliary measures of ambiguity attitude, or accept the joint-variation framing and discuss it in the paper. No commitment today.

### Ball-urn arm (ADR-0021)

Unaffected. Objective probability ⇒ PS trivially satisfied ⇒ Karni IC holds ⇒ the induced-probability BIC test is clean. Any "BDM fails behavioral IC" finding in the ball-urn arm is interpretable as designed.

## What must be verified before committing

1. **ACH (2018) Proposition 1 + footnote 16.** Does ACH's monotonicity result give mechanism IC only, as the reconciliation claims? Or does it claim more (e.g., "belief BDM is IC" in a sense that exceeds mechanism IC)?
2. **Machina-Schmeidler (1992 or 1995).** Brief check of the formal PS definition Karni references — specifically, what preferences satisfy it, what preferences fail it.
3. **Healy & Leo (2025) Chapter 3.** Two specific things to verify:
   - Does H&L make the "elicits a probability" vs. "truth-telling is dominant" distinction explicit anywhere? They have the IC-axiom hierarchy (monotonicity < S-O reduction < EU) but it is not yet clear whether they separately discuss what monotonicity buys you for *belief interpretation* vs. for mechanism IC. If they do, we cite them and use their language. If they don't, the conceptual distinction may be unstated in the literature and we describe it in plain language without inventing terminology.
   - Does H&L treat Karni's "dominance over lotteries" and ACH's "statewise monotonicity over acts" as the same condition or as distinct? (See Anujit's claim below.)
4. **Anujit's 2026-04-23 claim that "Karni's dominance and ACH's monotonicity are the same thing."** Worth verifying directly. My current reading: they are not the same in the strict sense — Karni's dominance is over lotteries only (`ℓ(p,x,y) ≽ ℓ(p',x,y)` iff p ≥ p'), ACH's monotonicity is over acts (statewise dominance ⇒ preference). They coincide if you identify a lottery `ℓ(p,x,y)` with an act on the canonical state space `[0,1]` paying x on `[0,p]` and y on `(p,1]` — under that identification, ACH monotonicity restricted to canonical-lottery acts implies Karni's dominance. The act-vs-lottery comparison is a third comparison that requires either PS or a stated equivalence between event spaces. So Anujit may be right that they coincide on the lottery-as-canonical-act domain, but that does not make the proof PS-free — the act-vs-lottery step in Karni Case 3 needs PS regardless. Verify whether H&L (or ACH) state the "lottery-as-canonical-act" identification explicitly and whether they use it to eliminate PS from the proof. If they do, my reconciliation is wrong; if they do not, the reconciliation stands and Anujit's claim is a vocabulary observation about a special case, not a refutation.

## Status of the P0 reading queue

- [x] Karni (2009) — complete. Reading notes at `master_supporting_docs/literature/reading_notes/karni_2009.md`.
- [x] **Healy & Leo (2025) Chapter 3 — complete (theory sections §2.1–§2.4, pp. 81–100).** Reading notes at `master_supporting_docs/literature/reading_notes/healy_leo_2025.md`. The published reconciliation is here. ACH 2018 is no longer load-bearing for our current question — H&L Proposition 4 cites ACH directly and gives the IC result we need.
- [ ] ACH (2018) — useful for completeness but not blocking. Worth reading for the §2.5 (T-statewise generalization details), the FOSD dominance Axiom 2*, and the ambiguity-aversion examples in their Fact 1.2. Not P0 anymore.
- [ ] Machina-Schmeidler (1992 or 1995) — definition reference; not blocking.
- [ ] Dustan et al. (Point 2, separate question) — independent.
- [ ] "Complexity" lit scan (Point 1, separate question) — independent.

**ADR / paper / deck edits remain deferred until the user reacts to the H&L findings.** The substantive direction has changed since the Karni-only state: ADR-0012 needs an interpretive addition, not a supersession; the deck Frame 4 needs an extension, not a teardown; the H3 hypothesis framing needs reconsideration but not necessarily a relabel.
