---
citation: "Chakraborty, A. & Kendall, C. (2025). Uniquely Justifiable Strategies and Mechanism Design with Boundedly Rational Players. Working Paper, September 10, 2025. Supersedes Chakraborty & Kendall (2022) SSRN #4032946."
bibtex_key: chakraborty_kendall_2025
primary_source: master_supporting_docs/literature/papers/Chakraborty_Kendall_2025_UJS_elicitation.pdf
date_read: 2026-04-22
reader: Claude
supplements: bdm_bic_2026-03.md#9
---

# Chakraborty & Kendall (2025) — Uniquely Justifiable Strategies and Mechanism Design with Boundedly Rational Players

**Relation to compiled notes:** See `bdm_bic_2026-03.md#9` for the original summary and numerical results from the March 2026 literature sprint. This file supplements those notes with (a) verbatim definitions, (b) a "NOT claiming" section calibrated to prevent the UJS-as-distinct-from-CR misreading that propagated through bdm_bic session logs and ADRs in April 2026, and (c) the parts of the paper most directly load-bearing for this project's H2 and for the 2026-04-23 Anujit meeting.

## Core claims this paper makes

- UJS is a formalization of contingent reasoning — specifically, a mechanism is UJS iff the dominant action is the *only* action that survives quantification over all payoff-relevant CR paths.
- UJS and OSP (Li 2017) are **mutually exclusive** in binary allocation settings with three or more types (Proposition 2 of the paper; full proof follows formal definitions in §2).
- UJS mechanisms for binary allocation take the form of a **generalized multiple price list (MPL)**. Characterization theorem in the paper.
- Empirically, both UJS-E and OSP-E greatly outperform BDM, "which suggests that contingent reasoning failures play a role in the failures of the BDM mechanism" (p. 5).
- There is a design tradeoff: OSP reduces CR over Nature but requires CR about one's own future actions; UJS eliminates CR entirely at the decision node but allows subjects to switch back and forth (multi-switching). This tradeoff is the framing the paper lands on in §1.
- An extension (footnote 1, p. 3) allows UJS via a "simplified representation" where players treat multiple future contingencies as equivalent. This admits reasoning-failure classes akin to cursed players (Eyster & Rabin 2005) or analogy-based expectations (Jehiel 2005), with the novel step of applying the grouping to one's own future decisions as well.

## Definitions I should cite verbatim

**Abstract (p. 1):**

> A strategy is *uniquely justifiable (UJ)* if, at each decision point, the prescribed action is the unique best response to any contingency the player may consider. We define *UJS mechanisms* as mechanisms in which the dominant strategy is also uniquely justifiable, so that boundedly rational players do not have to perform contingent reasoning.

**Justifiable action (p. 3):**

> We first introduce the notion of a *justifiable action*, an action which can be justified as the best response to some payoff-relevant contingency — that is, to some move of Nature and sequence of a player's own and others' future actions for which a player's current action affects her payoff. Importantly, the set of payoff-relevant contingencies may include non-optimal future actions of oneself or others.

**Justifiable strategy, uniquely justifiable (p. 3):**

> A *justifiable strategy* for any player then consists of some sequence of *justifiable actions*. A strategy is *uniquely justifiable* if, at each decision, it prescribes the only action that can be justified as a best response to *any* payoff-relevant contingency.

**UJS mechanism (p. 3):**

> We define a mechanism to be a UJS mechanism if, for every player-type there exists a uniquely justifiable strategy that coincides with the dominant strategy of that player-type. To expand the scope for such mechanisms, we allow the uniquely justifiable strategy to exist either in the original game or in a simplified representation of the game in which the players treat multiple future contingencies as equivalent.

**The core motivation (p. 3):**

> With such examples in mind, in this paper, we introduce the concept of *Uniquely Justifiable Strategy (UJS)* mechanisms which take a novel approach to **eliminating the need for contingent reasoning**.

**On the BDM failure mechanism (p. 2):**

> To bid optimally, the player must reason through many contingencies. At every contingency in which the random price is above her true valuation, she can justify any bid below that price because all of these bids maximize her payoff by selling the item at the random price. Conversely, at every contingency in which the random price is below her valuation, any bid above that price is justifiable. The challenge is to think through all possible contingencies in order to realize that bidding her true valuation is optimal.

**On the OSP residual CR demand (p. 2):**

> Critically however, OSP mechanisms, such as this clock auction and the OSP-Top-Trading Cycle matching mechanism (Troyan, 2019), do not eliminate all contingent reasoning requirements. In such dynamic mechanisms, the player must first reason contingently about her *own* future actions in order to be able to compare the best- and worst-case outcomes for each current action.

**On the OSP-UJS tradeoff (p. 5):**

> OSP mechanisms require subjects to think through their future actions. UJS mechanisms, as in an MPL, make thinking about future actions unnecessary by allowing the player to make independent choices in a price list. But, in doing so, UJS mechanisms allow for another possible form of bounded rationality as players can switch back and forth between the price and the item. This multiple switching behavior makes up the vast majority of the failures of the UJS-E mechanism we observe.

**Positioning against OSP/SOSP (p. 6):**

> The OSP and SOSP concepts are microfounded by a notion of simplicity in which a player doesn't need to know the structure of the game they are playing as long as they can recognize the sets of outcomes. We instead microfound simplicity by allowing a player to best-respond to any payoff-relevant contingency, rather than having to reason through all payoff-relevant contingencies.

**On the broader CR-failure literature (footnote 2, p. 6):**

> Many of the failures of contingent reasoning observed in this literature can be explained by multiple actions being justifiable. For brevity, in this paper we focus on failures of mechanisms.

## What this paper is NOT claiming (common misreadings)

**This section is load-bearing. Derivative docs in this project have previously propagated the first misreading for weeks; the fix is this section.**

1. **Misreading:** UJS is a formal mechanism property *independent of* contingent reasoning. "UJS tests the structural property; CR tests the cognitive channel — they need separate identification."
   **Correction:** UJS is a formalization *of* contingent reasoning, not an alternative framework. A mechanism is UJS iff the set of CR paths that can justify a non-dominant action is empty (equivalently: the dominant action is uniquely justifiable). Abstract and §1 both state this explicitly. "UJS vs. CR" is not a valid framing for experimental identification — UJS is the precise statement of what the CR claim is about.

2. **Misreading:** The UJS framework predicts that mechanisms with fewer justifiable actions always perform better.
   **Correction:** The paper identifies a **tradeoff** (§1, p. 5). UJS mechanisms eliminate CR demand at the decision node but admit multi-switching as a separate bounded-rationality failure. OSP mechanisms eliminate CR-over-Nature but require CR about one's own future actions. Neither dominates.

3. **Misreading:** BDM is not UJS because subjects can't figure it out.
   **Correction:** BDM fails UJS as a *formal property of the mechanism* — many non-dominant bids are justifiable at each random-price contingency, independent of any subject's cognitive state (p. 3). The formal failure is what predicts the observed behavioral failure.

4. **Misreading:** UJS requires exact truthful reporting.
   **Correction:** UJS is about the uniqueness of the *justifiable action* at each decision, not the accuracy of the reported value. In belief MPL (UJS), each row has a uniquely justifiable binary choice; multi-switching across rows is a separate form of bounded rationality that UJS mechanisms admit.

5. **Misreading:** The "simplified representation" clause in the UJS definition is an ad-hoc weakening.
   **Correction:** The clause (footnote 1, p. 3) links UJS to the broader bounded-rationality literature: cursed-player equilibria (Eyster & Rabin 2005), analogy-based expectations (Jehiel 2005). Its novel step is applying grouping of contingencies to the player's *own* future decisions, not just others'.

## Method (experimental)

Single-player WTA elicitation for a \$1 item. Five treatments:

1. **BDM** — standard probabilistic Becker-DeGroot-Marschak mechanism.
2. **OSP-E** — descending clock auction; subject can accept the current price or exit by choosing \$1. OSP-E is OSP (Li 2017) but not UJS.
3. **UJS-E** — same clock structure; terminates at a randomly selected period; no early-exit. UJS-E is UJS (as a generalized MPL structure) but not OSP.
4. **UJ-OSP** (diagnostic) — OSP-E but with forced exit at \$1, making the dominated action (exit) uniquely justifiable.
5. **OSP-L** (diagnostic) — elicits subjects' conjectured future actions.

Induced valuations drawn from \{\$0.05, \$0.10, ..., \$1.50\} in \$0.05 increments.

## Key numerical results (from the paper)

- Both UJS-E and OSP-E "greatly outperform BDM" on rational-play rate (p. 5).
- **60%** of subjects do NOT play rationally in OSP-E (p. 5).
- Of the irrational OSP-E subjects, **>70%** choose the dominated early-exit action (\$1), which is justifiable only under contingencies impossible under optimal future play.
- UJ-OSP diagnostic: dominated-action play decreases significantly when the diagnostic makes it uniquely justifiable.
- OSP-L diagnostic: subjects directly report considering contingencies that do not arise under the dominant strategy; those subjects are more likely to choose the dominated action.
- UJS-E outperforms OSP-E in the natural setting; the advantage weakens when subjects are forced to remain engaged.

## Relevance to our project

- **H2 is a direct UJS application.** MPL is the generalized-MPL form of UJS for binary allocation; BDM is not UJS. The theoretical prediction is that MPL (UJS) should outperform BDM (non-UJS), consistent with our H2.
- **The OSP-UJS tradeoff predicts MPL's remaining failure mode.** If MPL does outperform BDM in our belief elicitation setting, the residual failures should be multi-switching, not CR failures. This is testable via our multi-switching descriptive outcome (ADR-0008) and aligns with our format-separation design per ADR-0015.
- **The simplified-representation clause in UJS (footnote 1) is relevant to our "complexity" hypothesis (H3).** Subjects applying analogy classes across contingencies (grouping contingencies into equivalence classes) may still satisfy UJS in the simplified representation. Our easy/hard manipulation tests whether the simplified representation holds under cognitive load.
- **The BDM failure mechanism description (p. 2)** is the precise theoretical predicate for our H1. Subjects at contingencies above the valuation can justify any bid below; at contingencies below, any bid above. This enumerates the justifiable-action set for BDM that our p-BDM pure-incentives test (H1b) is probing.

## Open questions flagged by the paper (for our work)

- Does UJS transfer cleanly to **belief elicitation** with subjective probabilities? C&K's experiments are value elicitation with objective induced valuations. Our setting has induced beliefs but the event bet has subjective-probability structure. This is the same open question the compiled notes flagged; it remains load-bearing for how we interpret H2.
- What is the quantitative tradeoff between multi-switching in UJS mechanisms vs. CR failures in non-UJS mechanisms? Our design can contribute evidence on this for belief MPL specifically.
- Does the simplified-representation clause apply in our setting? A subject who treats all \(r \in [0.5, 1]\) as "the r-lottery wins" has simplified their CR space — potentially still uniquely justifiable in the simplified game.

## Passages worth quoting

- **On UJS as eliminating CR** (§1, p. 3, verbatim above).
- **On BDM's justifiable-action structure** (§1, p. 2, verbatim above) — directly grounds H1.
- **On the OSP-UJS tradeoff** (§1, p. 5, verbatim above) — directly grounds how to interpret H2 and multi-switching.
- **On why the framework unifies the CR literature** (footnote 2, p. 6, verbatim above) — positions UJS against Charness & Levin 2009, Carrillo & Palfrey 2011, Esponda & Vespa 2014, Magnani & Oprea 2017, Martínez-Marquina et al. 2019, Ngangoué & Weizsäcker 2021, Esponda & Vespa 2023.

## Pages read in detail

- pp. 1–6 (abstract, §1 introduction in full) — this session, 2026-04-22.
- Remaining sections (§2 formal setup; §3 binary allocation characterization; §4 experimental design and results; §5 discussion) — not read in detail this session. The compiled notes at `bdm_bic_2026-03.md#9` cover the remaining structure at high level based on Christina's earlier read.

## Citation for bibliography

Already in `bdm_bic_paper/paper/references.bib` (verify bibtex_key `chakraborty_kendall_2025` — confirm before next citation).
