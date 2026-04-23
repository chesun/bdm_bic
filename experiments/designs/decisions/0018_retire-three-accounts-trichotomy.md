# 0018: Retire "three competing accounts" framing for pure-incentives failure

- **Date:** 2026-04-22
- **Status:** Decided
- **Scope:** Research framing
- **Data quality:** Full context

## Context

Prior project materials — specifically `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` §2 and §7, and earlier versions of the advisor-meeting slide deck — framed a pure-incentives test failure as a puzzle to be decomposed into three competing theoretical accounts:

1. EV-calculation failure — subjects cannot compute expected value from the menu.
2. Ambiguity aversion or non-EU preferences — subjects treat the event bet as ambiguous relative to the objective lottery.
3. UJS / contingent-reasoning failure — per Chakraborty & Kendall (2025).

The trichotomy was used to motivate the choice among Proposals A, B, and C: Proposal A was said to test account 1; Proposal B to test account 3; Proposal C to discriminate among all three.

On 2026-04-22, Christina asked Claude to justify the trichotomy. On reflection, the framing does not hold:

- **The accounts overlap.** UJS, per C&K 2025, formalizes which contingent-reasoning paths can justify each action. "EV-calculation failure" is plausibly a sub-case of CR failure (subjects cannot compute the EV because the CR burden is heavy). Treating UJS and EV-calc as competing accounts is not supported by the underlying theory — one subsumes the other.
- **"Ambiguity aversion" at known θ is misapplied.** Classical Ellsberg-style ambiguity requires unknown probabilities. Under our induced θ with a concrete urn composition (e.g., 20 red, 80 blue), the event bet's probability is stated. What this account was trying to capture — non-EU preferences producing systematic deviations — would under known probabilities be probability weighting, not ambiguity aversion. Probability weighting has its own predictions that don't obviously map to "pick q = 0."
- **The trichotomy was reverse-engineered to justify A/B/C.** The tell: when Proposal C was dropped (ADR-0016), the discrimination logic that the trichotomy was said to provide collapsed. If the trichotomy had been load-bearing for identification, it would not have collapsed as a side effect of a sample-size decision. The accounts were constructed to rationalize a design space, not derived from theory.
- **A pure-incentives failure IS the BIC failure.** DVW 2022's Condition 2 direct test says: if subjects cannot pick the payoff-maximizer when beliefs are stripped from the task, BIC is violated — full stop. Decomposing "why" into competing psychological accounts is secondary analysis, not a structural requirement of the test.

## Decision

**Retire the "three competing accounts" framing for pure-incentives failure.**

Concretely:

- The pure-incentives test is a direct BIC diagnostic. Failure on the test is BIC violation. This is the headline finding; it does not need to be decomposed into causes to be valid.
- When comparing proposal designs (A vs. B vs. both within-subject), describe them in terms of *how much of the p-BDM mechanism remains visible to the subject* — a design-level decomposition, not a claim about psychological causes:
    - A strips the mechanism: subjects see only event-contingent payoff pairs.
    - B preserves the native p-BDM mechanism: subjects must reason contingently across $r$.
    - Running both within-subject isolates menu-level failure (subject can't read the payoff table) from CR-level failure (subject can read the table but can't reason through the mechanism).
- Do not invoke "EV-calculation failure," "ambiguity aversion," or "non-EU preferences" as competing theoretical accounts in the deck, the paper draft, or future session logs.
- If secondary analysis after data collection wants to decompose causes of observed failure (e.g., via process data, response times, error patterns), that is a separate exercise. It is not required to motivate the design.

## Consequences

- **Commits us to:** framing the pure-incentives test as a BIC diagnostic, not a puzzle. Proposal choice is about design-level task variation (mechanism visible vs. stripped), not about which theoretical account each proposal discriminates.
- **Requires:** retirement notes on `01_p-bdm-design-space-synthesis.md` §2 and §7 pointing to this ADR. Applied 2026-04-22.
- **Already applied:** `04_slides.tex` Q2 frame was rewritten 2026-04-22 to remove the three-accounts enumeration; this ADR formalizes that rewrite as a project-level framing decision rather than a one-off slide edit.
- **Rules out:** reintroducing the trichotomy or its variants in future materials. A feedback memory captures this so future sessions don't re-invent it (`feedback_no_post_hoc_trichotomies.md`).
- **Preserves:** the A / B / both-within-subject proposal structure (ADR-0016) and the between-subject / within-subject-θ integration (ADR-0017). Those design decisions stand; what changes is the rhetorical framing used to motivate them.
- **Preserves:** the possibility that secondary analysis identifies specific failure channels in the data. That is a post-data, secondary-analysis question, not a design-motivation question.
- **Methodological lesson.** See `feedback_no_post_hoc_trichotomies.md` — don't construct "N competing accounts" enumerations to motivate design decisions when the accounts aren't theoretically derived. A direct diagnostic test is diagnostic by construction.

## Sources

- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` §2 and §7 — retired sections (header notes added 2026-04-22).
- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` Q2 frame — already rewritten 2026-04-22.
- `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` — UJS as a CR formalization, not independent of CR.
- `master_supporting_docs/literature/reading_notes/danz_vesterlund_wilson_2022.md` — DVW Condition 2 pure-incentives test as direct BIC diagnostic.
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` — session discussion.
- ADR-0016 (dropped Proposal C; revealed the trichotomy was scaffolding for a design space now partially retired).
- ADR-0017 (between-subject arm, within-subject θ; preserves design structure under new framing).
- Discussion: 2026-04-22 with Christina — "get rid of the trichotomy since they are not founded on theory and do not make sense."
