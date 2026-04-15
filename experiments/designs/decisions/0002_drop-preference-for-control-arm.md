# 0002: Drop preference-for-control arm — urn-draw design eliminates Hypothesis B

- **Date:** 2026-04-06
- **Status:** Decided
- **Data quality:** Full context

## Context

Benoit, Dubra & Romagnoli (2022, *AEJ: Micro*) show that preference for control inflates belief reports under probabilistic BDM by roughly 18 percentage points in confidence-elicitation settings — subjects prefer to bet on events they can influence (their own task performance). This was originally listed as Hypothesis B among the competing mechanisms that could drive BDM's BIC failure, with an implied need for a dedicated treatment arm to test or rule it out.

After reading Benoit et al. and its cited evidence (Goodie 2003; Goodie & Young 2007; Heath & Tversky 1991), we found that all documented preference-for-control effects operate in settings where subjects have a personal stake, agency, or domain expertise. The cited references on "objective events" concern domain competence/familiarity, not agency-free events.

Our experimental paradigm elicits beliefs about objective urn draws. Subjects do not select the urn, cannot influence the draw, and have no domain expertise about the event. The mechanism preference-for-control *requires* is absent by construction.

## Decision

Rule out Hypothesis B by design, not by measurement. No dedicated treatment arm for preference for control. The urn-draw paradigm eliminates the channel by construction, so the four-arm design becomes:

1. BDM, full incentive info
2. BDM, minimal info ("rewards accuracy")
3. Belief MPL (same induced probabilities)
4. Flat fee benchmark

If BDM still fails BIC in an urn-draw setting, the failure is cognitive (comprehension, effort, or cognitive competition), not motivational.

A secondary, stronger within-mechanism argument (documented 2026-04-07 Point 4): even if residual control motive existed for objective events, it would be constant across the BIC treatment comparison (full-info vs. no-info, same event, same mechanism), so it cannot confound the test. Both arguments appear in the paper.

## Consequences

- **Commits us to:** urn-draw framing throughout. Any design drift toward self-belief elicitation (confidence tasks, forecasting of own performance) reopens this question.
- **Rules out:** a fifth arm varying "event controllability." That was under consideration in v3 research ideas (§3 Direction 1, Arm 5) and in the "alternative agenda" section — now dropped.
- **Saves:** ~150 subjects and ~\$1,800 in Prolific costs vs. a design that included a control-manipulation arm.
- **Paper positioning:** we get to claim a clean "design by subtraction" (Danz et al. 2024 language) that eliminates one of the leading competing hypotheses by construction, not by null results.

## Sources

- `quality_reports/research_ideas_bdm_bic.md` :: §2 Gap 1, Hypothesis B (lines 74–76); §6 "Preference for control is ruled out by design" (line 313); §6 "Hypotheses NOT Tested" (line 351)
- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 4 (the within-mechanism argument)
- Git commits: `5bfefdb` ("finish reading Benoit et al, update research directions"), `cef9ffb` ("Literature deep dive...")
