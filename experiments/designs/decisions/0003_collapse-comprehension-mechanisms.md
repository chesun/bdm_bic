# 0003: Collapse three comprehension sub-mechanisms into contingent-reasoning failure

- **Date:** 2026-04-07
- **Status:** Decided
- **Data quality:** Full context

## Context

An earlier version of the hypothesis framework (v4, 2026-04-06) listed three distinct sub-mechanisms within the broad "comprehension failure" channel for why BDM fails BIC:

1. Contingent reasoning failure — inability to reason through all possible realizations of the random number simultaneously (Chakraborty & Kendall 2025).
2. Game-form misconception — subjects confuse BDM with a more familiar game form (e.g., first-price auction; Martin & Munoz-Rodriguez 2022).
3. Payoff function opacity — subjects cannot evaluate payoff consequences of their report for each random number (Brown et al. 2026).

During discussion on 2026-04-07, Christina flagged that the three sub-mechanisms are not really distinct once restricted to the belief-elicitation domain. Payoff opacity and contingent reasoning describe the same bottleneck from different sides. Game-form misconception — well documented for *value* BDM — has no known analog for *belief* BDM (there is no "first-price auction for beliefs").

## Decision

Use **contingent-reasoning failure** as the single comprehension channel in the paper. The UJS framework (Chakraborty & Kendall 2025) and the "not obviously dominant" result (Tsakas 2019) formalize the same bottleneck from different angles and both apply.

Specifically:

- Payoff function opacity is collapsed into contingent-reasoning failure — if a subject cannot evaluate what happens at each possible r, that *is* contingent-reasoning failure, described from the payoff side.
- Game-form misconception is dropped as a hypothesized channel for belief BDM. Whether subjects confuse belief BDM with some other game form is an open empirical question, but no paper has identified a specific misconception analogous to the BDM-as-first-price-auction story for values.

## Consequences

- **Commits us to:** H3 framed specifically as contingent-reasoning failure, not a broader "comprehension" claim. Mediator tests (comprehension quiz, response time, error patterns) must align with this specific construct.
- **Rules out:** a treatment arm or measurement specifically targeting game-form misconception for belief BDM.
- **Creates an open question:** if subjects *do* exhibit systematic misconception patterns (e.g., shading toward 50% or toward extremes), we need an explanation that is not game-form confusion. The UJS framework's "many non-truthful reports are justifiable" provides one (Chakraborty & Kendall 2025).
- **Simplifies the narrative:** one comprehension channel, two theoretical framings (UJS from C&K 2025, obvious-dominance from Tsakas 2019). Section on "what drives BIC failure" becomes tractable.

## Sources

- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 1 (lines 7–17)
- `quality_reports/research_ideas_bdm_bic.md` :: §6 "What We Now Know That Reshapes the Hypotheses" #1 (lines 301–306)
- Git commit: `01b0f3a` ("Research direction reformulation, theory intuition docs...")
