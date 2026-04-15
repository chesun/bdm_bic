# 0013: UJS (C&K 2025) as primary framework for *behavioral failure*, not IC foundation

- **Date:** 2026-04-15
- **Status:** Decided
- **Scope:** Behavioral theory
- **Supersedes:** #0004
- **Data quality:** Full context

## Context

ADR-0004 (2026-04-07) named UJS (Chakraborty & Kendall 2025) the "primary theoretical framework" for the paper, with Tsakas (2019) OSP as supporting evidence. On 2026-04-15, Christina flagged that "primary theoretical framework" is too broad. The paper has two distinct theoretical jobs:

1. **IC foundation** — why is p-BDM IC in theory? Answered by Azrieli et al. (2018) monotonicity (ADR-0012) — a *lightweight* minimal sufficient assumption.
2. **Behavioral failure** — why does p-BDM fail in practice despite being IC? Answered by UJS.

Conflating the two risks: (a) making the IC claim look like it requires UJS (it does not — Azrieli monotonicity suffices); (b) making the behavioral story look like an IC-framework claim (it is not — it is about cognitive plausibility of the dominant strategy given that the mechanism is IC); and (c) losing the clean analytical structure where Azrieli explains *why the mechanism should work* and UJS explains *why subjects cannot find the strategy that works*.

UJS is load-bearing for the behavioral side because it directly predicts H2 (MPL > BDM): BDM is not UJS — many non-truthful reports remain justifiable at each report. MPL *is* UJS — truth-telling is uniquely justifiable per row. This distinction is what the paper's central diagnostic rests on.

## Decision

**Narrow the scope of ADR-0004's UJS decision to behavioral theory only.** Supersede ADR-0004 with the following:

- **UJS (Chakraborty & Kendall 2025) is the primary framework for the behavioral failure story.** It explains why BDM fails in practice (not UJS → many justifiable deviations) and why MPL succeeds (UJS → truth-telling is uniquely justifiable per row).
- **Tsakas (2019) OSP result** is cited as a supporting behavioral framework — a parallel formalization of the same cognitive difficulty (static BDM lacks obvious dominance).
- **UJS is NOT the theoretical IC foundation.** That is Azrieli et al. (2018) monotonicity — see ADR-0012.
- **OSP and UJS remain mutually exclusive** for binary allocation with 3+ types (C&K 2025, Proposition 2). This constraint still binds design choices: using a UJS-compliant MPL arm rules out pairing it with an OSP-compliant (descending Karni clock) arm in the same study. If we ever want to compare UJS vs. OSP, that is a separate study.

The scope narrowing is the essential change from ADR-0004. UJS is still load-bearing, but for the behavioral spine, not the theoretical spine.

## Consequences

- **Commits us to:** a paper structure with two distinct theoretical sections:
    - *IC-assumptions section* — Azrieli et al. (2018) monotonicity (ADR-0012).
    - *Behavioral-theory section (why BDM fails)* — UJS (C&K 2025), supported by Tsakas (2019).
- **Commits us to:** framing H3 in UJS language — "BDM fails because many non-truthful reports are justifiable; MPL succeeds because truth-telling is uniquely justifiable per row." Error patterns should show diffuse deviation, not coherent alternative-game-form shading.
- **Commits us to:** citing Chakraborty & Kendall (2025) and Tsakas (2019) as load-bearing *behavioral* references.
- **Rules out:** framing the IC-assumptions section around UJS. If we need a lightweight sufficient assumption for IC, that is Azrieli monotonicity (ADR-0012), not UJS.
- **Rules out:** a paper built primarily around obvious dominance or a Karni-descending-clock treatment arm. OSP-compatible designs are a separate research question.
- **Preserves all substantive reasoning from ADR-0004:** the content in ADR-0004's Context, Decision, and Consequences sections remains valid when applied to behavioral theory. The supersession narrows scope; it does not reverse.
- **Makes the Azrieli-UJS pairing visible:** the paper's theoretical exposition can now walk through "here is the minimal IC assumption (monotonicity) — it is satisfied — so the mechanism should work; here is the behavioral refinement (UJS) — it is not satisfied by p-BDM — which predicts the observed failure." That is a cleaner and more defensible story than the conflated version.

## Sources

- ADR-0004 (Superseded by this entry)
- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 5 (lines 83–102)
- `quality_reports/mpl_format_decision_analysis.md` :: §3 (mechanism invariance), §4 (multi-switching and behavioral identification)
- `master_supporting_docs/literature/reading_notes/` :: Chakraborty & Kendall (2025); Tsakas (2019)
- Discussion: 2026-04-15 — Christina's observation that ADR-0004's scope was too broad, separating IC foundation from behavioral theory
