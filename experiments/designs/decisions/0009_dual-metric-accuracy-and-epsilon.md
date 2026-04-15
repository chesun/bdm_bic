# 0009: Dual-metric accuracy — success rate + conditional distance; ε ∈ \{0, 5pp\}

- **Date:** 2026-04-14
- **Status:** Decided
- **Data quality:** Full context

## Context

If BDM and MPL are compared on accuracy (H2), the accuracy metric must be operationally consistent across arms. Three options were on the table in `mpl_format_decision_analysis.md` §5:

- **M1. Distance-based, conditional on single crossing.** BDM = |report − π|; MPL single-crossers = |crossing − π|; MPL multi-switchers excluded. *Problem:* selects on success; biases MPL to look better.
- **M2. Binary success with multi-switching = failure.** BDM succeeds if |report − π| < ε; MPL succeeds if single-cross within ε of π. *Problem:* discards "how close" information; ε choice arbitrary.
- **M3. Hybrid.** Report both success rate (binary) and conditional accuracy (continuous, given success). Pre-register success rate as primary.

Separately, ε tolerance needed selection. Danz, Vesterlund & Wilson (2022) use a dual metric: **false reports** (any deviation from induced belief, ε = 0) and **distant reports** (deviation > 5pp, ε = 5pp).

## Decision

Adopt the **M3 hybrid** with the **DVW 2022 dual-ε structure**, with the asymmetry between MPL (three categories) and BDM (two categories + focal diagnostic) handled explicitly rather than forced into a symmetric coding.

**For MPL — report three numbers:**

- Multi-switching rate (descriptively, benchmarked to C&K 2025; see ADR-0008).
- Percent single-crossers with crossing within ε of π.
- Conditional accuracy among single-crossers (mean |crossing − π|, continuous).

**For BDM — report two numbers plus a diagnostic:**

- Percent within ε of π.
- Mean |report − π| (continuous).
- Focal/boundary-report rate (as a parallel-in-spirit diagnostic, per B&W 2018 — see ADR-0008).

**For the H2 test — compare on:**

- Primary: success rate (% within ε of π) — the comparable margin.
- Secondary: conditional accuracy (continuous) — retains information about "how close" when both succeed.

**ε tolerance:** Danz et al. 2022 dual metric, applied in parallel:

- **False reports:** ε = 0 (strict — any deviation).
- **Distant reports:** ε = 5pp (substantively meaningful error).

H2 is tested on both margins; MPL should dominate BDM on at least one (probably distant reports, if the story is about comprehension-driven large errors).

**Mapping to MPL single-crossers:**

- False report = crossing ≠ π exactly.
- Distant report = |crossing − π| > 5pp.

Multi-switchers remain a separate descriptive category (ADR-0008), not forced into the ε framework.

## Consequences

- **Commits us to:** pre-registered dual-metric analysis with success rate as primary. Conditional accuracy is secondary; multi-switching is descriptive (not directly compared across arms).
- **Commits us to:** Danz et al. 2022 as the citation for the ε choice, not a within-project defense of 5pp.
- **Rules out:** a single "accuracy" verdict. H2 is tested on two margins (ε = 0 and ε = 5pp) and two dimensions (binary success and conditional distance). If they disagree, we report that honestly.
- **Superseded:** the earlier Section 5 framing (M1 vs. M2 vs. M3 as separate options). Section 5 is now historical context; criterion 1 + criterion 2 together define the metric.
- **Defensibility:** covers the referee concern "you threw out the hard cases" (multi-switchers get a rate, not an exclusion) and "you conditioned on success" (we report both unconditional success rate and conditional accuracy).

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §5 "Accuracy Metrics Must Be Consistent Across Arms" (lines 138–179), §10 criteria 2 and 3 (lines 343–356)
- `quality_reports/session_logs/2026-04-14_mpl-format-decision-continued.md` :: Design Decisions table
- Git commit: `66f2f43` ("MPL format decision: Section 10 criteria 1-3 resolved; p-BDM incentive-only gap flagged")
