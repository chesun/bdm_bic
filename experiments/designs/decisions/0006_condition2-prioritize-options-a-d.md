# 0006: Condition 2 operationalization — prioritize Options A and D; defer B/C/E

- **Date:** 2026-04-07
- **Status:** Proposed
- **Data quality:** Reconstructed — partial context

> **Reconstructed entry.** Christina did not formally select options; the April 7 discussion document records a "current thinking" leaning toward A and D. This ADR promotes that leaning to a Proposed decision so it enters the log. Full selection and detailed design happen in the dedicated p-BDM design task (see ADR-0011).

## Context

Danz et al. (2024, JEP) frame BIC as two weak conditions: (1) revealing incentives increases accuracy; (2) when presented as a pure choice over incentives, subjects pick the theoretical maximizer. For BSR, Condition 2 is cleanly operationalized via an 11-option menu of event-contingent winning-probability pairs. For BDM, there is no clean single-task analog, because BDM's incentive structure is *inherently* about a threshold comparison across contingencies, not a single payoff function that can be displayed.

Five operationalizations were considered on 2026-04-07 (Point 6 of research-direction discussion):

- **A. Induced-probability scenario questions.** Tell subjects the induced π, then ask at specific contingencies: "you reported X, r drew Y, you got [outcome] — would you have preferred [alternative]?"
- **B. Belief MPL as a decomposed Condition 2 test.** Present the MPL with induced probabilities; correct switch point = π.
- **C. Single-report BDM with induced probabilities.** "Probability is 70%. Report a number 0–100." Deviations = failure.
- **D. Direct ex post lottery choice.** After the BDM report, present the realized outcome and ask which option (received vs. alternative) the subject prefers.
- **E. Hypothetical third-person report comparison.** "Person A reported 70%, Person B reported 50%. Who is better off after r = 60%?"

## Decision

Prioritize **Option A** (scenario questions as a within-subject diagnostic) and **Option D** (ex post lottery choice). Defer B, C, and E:

- **B** conflates Condition 2 with the H2 format comparison (MPL is a different mechanism, not a pure-incentives version of BDM). Better framed as testing H2 than Condition 2.
- **C** is just the basic BDM accuracy test — doesn't strip anything to isolate incentives.
- **E** is hypothetical, cognitively demanding, and requires processing multiple scenarios simultaneously — defeats the "strip to pure incentives" purpose.

Final selection between A and D (or combining both) happens in the dedicated p-BDM design task (ADR-0011 flags this as open).

## Consequences

- **Commits us to:** a within-subject Condition 2 diagnostic in the main experiment, distinct from the H2 format comparison.
- **Commits us to:** induced probabilities with known π — this is already the main experiment design, but reinforces the commitment.
- **Opens a design question:** how many scenarios (Option A) or ex post comparisons (Option D) are needed; how they integrate with the primary BDM elicitation without contaminating it.
- **Flags an insight:** Condition 2 for BDM may not have a clean single-task implementation like it does for BSR, because BDM's incentive structure is inherently cross-contingency. Any Condition 2 test for BDM is itself a test of contingent reasoning. This may be a paper-level framing point, not just a design detail.

## Sources

- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 6 "Options for operationalizing Condition 2 for BDM" (lines 116–166), "Current thinking" (lines 160–164)
- `quality_reports/mpl_format_decision_analysis.md` :: §12 "Related Design Note: p-BDM Incentive-Only Test" (see ADR-0011)
- Git commit: `01b0f3a` ("Research direction reformulation...")
