# 0001: Research framing — "Why does BDM fail BIC?" not "Does it?"

- **Date:** 2026-03-31
- **Status:** Decided
- **Data quality:** Full context

## Context

The original framing of this project was a direct behavioral-incentive-compatibility (BIC) test of the probabilistic BDM mechanism for belief elicitation — i.e., *does* BDM fail BIC. Reading Danz, Vesterlund & Wilson (2024, JEP) revealed a forthcoming working paper ("The Pure-Incentives Test") by the framework's original authors that will document BDM's BIC failure first. The JEP conclusion previews: "the vast majority of participants prefer choices that differ from the intended maximizer, indeed 69 percent of participants opt for the event-independent choice corresponding to reporting q = 0.0" for p-BDM.

This eliminates the standalone "does BDM fail BIC" question as a primary contribution. Whatever we run will be replicating or confirming a result that will soon be published by others. The question is what to build on top of that.

## Decision

Reframe the primary research question from *"Does BDM fail BIC?"* to *"Why does BDM fail BIC?"* — i.e., identify the cognitive/behavioral mechanism that drives the failure, not just document that it exists.

The BIC test itself remains as a necessary foundation (independent evidence, self-contained paper) but is reclassified from headline contribution to baseline finding. The novel contributions sit in:

- Mechanism identification among competing channels (comprehension, effort, cognitive competition; preference-for-control is later ruled out by design — see ADR-0002).
- Task-complexity × mechanism interaction (does the failure worsen for harder belief tasks?).
- The BDM vs. MPL format comparison as the sharpest diagnostic (same mechanism, different format — see ADR-0004 and ADR-0007).

## Consequences

- **Commits us to:** a multi-arm design with mechanism-identification treatments, not a single-arm replication. Minimum 3 arms, target 4.
- **Commits us to:** a theoretical framework that explains *why* BDM is hard (UJS, not obviously dominant — see ADR-0004). A purely empirical "BIC fails" paper is no longer enough.
- **Rules out:** headline framing around DVW-style BIC confirmation. We cite their forthcoming work and move beyond it.
- **Open question:** what to do if the mechanism analysis is null across all channels — the fallback is the task-complexity interaction (Hypothesis D / H4), which is testable in the minimal 3-arm design.
- **Timeline pressure:** once DVW's Pure-Incentives Test paper circulates, the window for independent BIC evidence narrows. The "why" question remains open regardless.

## Sources

- `quality_reports/research_ideas_bdm_bic.md` :: "Critical Update (2026-03-31)", §1 "State of Knowledge", §3 "Research Directions — Direction 1 (Recommended)"
- `quality_reports/session_logs/2026-03-29_project-setup.md`
- Git commits: `f0d3433` ("Research direction reframed: WHY does BDM fail BIC?"), `01b0f3a` ("Research direction reformulation...")
