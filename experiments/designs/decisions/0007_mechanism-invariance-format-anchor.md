# 0007: Mechanism invariance is the anchor for MPL format choice

- **Date:** 2026-04-13
- **Status:** Superseded by #0014
- **Data quality:** Full context

> **Superseded 2026-04-15 by ADR-0014.** This entry's Consequences section claimed "Commits us to: separated or coarse-separated MPL format." That was a backfill overreach — the 2026-04-13 session log records that format as *tentative*, not decided. ADR-0014 narrows this decision to the framing only (mechanism invariance + acts-vs-outcomes exposition); format selection is an open Pending decision. All reasoning in the body below about the mechanism-invariance framing remains valid; disregard only the format-commitment claim. Body preserved for history.

## Context

While drafting `mpl_format_decision_analysis.md`, an earlier framing attributed Brown & Healy's (2018) identifying assumption (IA) for the monotonicity test to **reduction of compound lotteries** (ROCL). Christina observed that ROCL is not in B&H's IA section. A careful reading with her clarified:

- B&H's identifying assumption is **mechanism invariance** — the subject's preferences *over outcomes* do not change based on which payment mechanism (RPS vs. Framed Control) the experimenter uses. Being told "we'll pay via RPS" vs. "we'll pay row 14 only" does not shift the fundamental taste for money.
- Reduction is one of several preference-level routes to monotonicity violation (along with ambiguity aversion, source preference, preference reversals, straight cognitive errors). ROCL is a *candidate mechanism* for why monotonicity might fail; it is not an assumption required to run the B&H test.

This distinction is load-bearing for how we justify the MPL format choice. If we claim "separated format makes subjects satisfy monotonicity," we commit to a specific (and probably false) story about preferences. If we claim "separated format restricts the strategy space so non-monotone preferences cannot be expressed," we commit to a much weaker and more defensible story.

The clarification pivots on the **acts vs. outcomes** distinction in decision theory. Preferences over outcomes are primitive (\$15 > \$10). Preferences over acts (complete contingent plans) are derived — they depend on outcome-preferences *together with* the structure of the decision problem. Monotonicity, ROCL, expected utility, and probabilistic sophistication are all restrictions on how act-preferences relate to outcome-preferences, not restrictions on outcome-preferences themselves. A subject who violates monotonicity has not changed their mind about money; their act-preferences for some decision problems simply do not line up with a naïve row-by-row reading of their outcome-preferences.

## Decision

Anchor the MPL format defense on **mechanism invariance + strategy-space restriction**, not on ROCL or any specific preference-level assumption:

1. B&H's IA is mechanism invariance. Outcome-preferences are stable across payment mechanisms. Reduction is a candidate mechanism for how monotonicity might fail, not part of the IA.
2. The row-14 action can differ across mechanisms (RPS vs. Framed Control) even under mechanism invariance, because the *decision problem* at row 14 is different. Under RPS, row 14 is one of 20 payment candidates (a portfolio component). Under Framed Control, row 14 fully determines payoff.
3. Separated format does not change subjects' preferences; it restricts the *strategy space* so non-monotone preferences cannot be expressed. Observed behavior is forced to look monotone regardless of whether the underlying preferences are.

This framing is what the paper's IC-assumptions section will rest on. It is robust to any specific answer about *why* monotonicity fails.

## Consequences

- **Commits us to:** separated or coarse-separated MPL format. A list-format MPL allows portfolio-level strategies and inherits the B&H concern without the strategy-space restriction that makes separated format defensible.
- **Commits us to:** a paper passage explicitly distinguishing outcome-preferences from act-preferences when defending the format. This is not standard in belief-elicitation papers and will require care in exposition.
- **Rules out:** a defense that invokes ROCL or assumes a specific preference class. The test (and our design) is robust to why monotonicity fails; we do not need to commit to a reason.
- **Corrected an earlier claim:** a prior draft suggested "multi-switching in MPL supports H3." This was wrong (flagged by Christina during the same session) — multi-switching in MPL threatens H2, not supports H3. This correction is preserved in the April 13 session log under Learnings & Corrections.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (lines 38–88)
- `quality_reports/session_logs/2026-04-13_mpl-format-decision.md` :: Design Decisions table (line 22) and Learnings & Corrections (lines 36–39)
- Git commit: `20b1324` ("MPL format decision analysis with acts-vs-outcomes foundation")
