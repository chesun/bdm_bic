# 0008: Multi-switching is a descriptive outcome, not an invalidation threshold

- **Date:** 2026-04-14
- **Status:** Decided
- **Data quality:** Full context

## Context

An earlier draft of `mpl_format_decision_analysis.md` (2026-04-13, §4) treated MPL multi-switching as an *ex ante threat* that could invalidate H2 (MPL > BDM) if the rate exceeded some to-be-specified threshold. Section 10 criterion 1 originally asked "what rate invalidates H2?" — framing multi-switching as a gating condition on whether the paper's central comparison could be tested at all.

Reviewing Chakraborty & Kendall (2025), Christina observed that the field's own precedent already rejects the gating framing. C&K 2025 report multi-switching rates of **29.7% among attentive subjects** and **43.7% in the full sample**, and they report those rates *directly as results* alongside their mechanism comparison — not as disqualifying features. Their paper does not ask "is 29.7% too high to run the test?"; it asks "here is the rate, and here is how MPL compares to BDM on the other margins."

Additionally, Burfurd & Wilkening (2018) report 17% "reverse reports" in a belief titration, and Holt & Laury (2002) report ~16% multi-switching in risk MPL. These are treated as features of the data, not as invalidation signals.

An ex ante threshold would also be arbitrary — there is no principled reason to pick 25% over 20% or 30%.

## Decision

Treat MPL multi-switching as a **primary descriptive outcome**, not an invalidation threshold. Specifically:

**Within the MPL arm, report:**

- Percent single-crossers
- Percent single-crossers with crossing within ε of induced π
- Percent multi-switchers

Benchmark multi-switching rate against C&K 2025 (29.7% attentive / 43.7% full sample).

**For the H2 test (MPL vs. BDM), compare on the comparable margin:**

- Success rate = percent of subjects within ε of π (|report − π| < ε for BDM; single-cross within ε of π for MPL).

There is no "multi-switching" analog in single-report BDM since BDM yields one report per subject. We do not force an artificial analog.

**Closest BDM-internal diagnostic** (reported descriptively, not compared to MPL multi-switching): focal/boundary-report rate (0, 50, 100), echoing B&W 2018's 26% boundary-report finding. Both multi-switching in MPL and focal reports in BDM capture "coherent belief identification failed," but they are not structurally the same object.

## Consequences

- **Commits us to:** C&K 2025 as the citation for the descriptive framing. H2 is always testable; whatever multi-switching rate we observe becomes a reported result.
- **Commits us to:** no pre-registered threshold for multi-switching. Supersedes the earlier Section 10 criterion 1 framing.
- **Rules out:** a referee response that says "the paper threw out all multi-switchers." Multi-switchers are counted as failures on the comparable margin; the full distribution is reported.
- **Opens a modest design question:** should we run *repeated* BDM elicitations at the same induced π (within-subject) to get a tight BDM analog to multi-switching? Noted in `mpl_format_decision_analysis.md` §13 item 6; not decided, placement options flagged (inside main experiment vs. post-main diagnostic).
- **One-line robustness note planned:** "If multi-switchers are excluded rather than coded as failure, results are [X]." — this addresses the selection-on-success concern without rebuilding the analysis.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §4 title change + framing note (lines 92–94), §10 criterion 1 reframe (lines 336–342), §11 tentative-recommendation update (line 391)
- `quality_reports/session_logs/2026-04-14_mpl-format-decision-continued.md` :: Design Decisions table; Incremental Work Log item on Section 10 criterion 1
- Git commit: `66f2f43` ("MPL format decision: Section 10 criteria 1-3 resolved; p-BDM incentive-only gap flagged")
