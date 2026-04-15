# 0010: Hao-Houser instruction format for all MPL variants

- **Date:** 2026-04-14
- **Status:** Decided
- **Data quality:** Full context

## Context

Three instruction-format families appear in the belief-MPL literature:

- **Hao-Houser (HH) 2012.** Brief, payoff-focused instructions; no formal case enumeration.
- **Holt-Smith (HS) 2016.** Formal case enumeration (each possible r value's outcome explained).
- **Trautmann-van de Kuilen (TK) 2015, as adapted by Burfurd & Wilkening 2018.** Bundled with a two-stage list presentation; more elaborate walk-through.

Christina noted that instruction format and presentation format (list vs. separated, single-stage vs. two-stage) are **separable** decisions. B&W 2018 directly compared the three instruction styles on the same task and found:

- HH: 850 seconds total task time.
- HS: 1089 seconds.
- TK: 1212 seconds.

HH is ~22% faster than HS and ~30% faster than TK, with no measured accuracy cost. B&W's own recommendation is HH.

This came up while resolving Section 10 of `mpl_format_decision_analysis.md`: the earlier framing implicitly tied HS-style instructions to the Holt-Smith two-stage list presentation. Decoupling these clarifies that we can pair HH instructions with whatever presentation format we choose (currently leaning coarse separated — see ADR-0007).

## Decision

Use **Hao-Houser instruction style for all MPL variants** regardless of presentation format. Instructions and presentation are orthogonal; HH dominates on speed with no accuracy penalty per B&W 2018.

Concretely this means:

- Brief, payoff-focused explanation of the MPL task.
- No exhaustive case enumeration over all r values (what HS and TK both do).
- Preserve the core "one binary choice per row" framing that is common across all three styles.

## Consequences

- **Commits us to:** HH-style instruction drafting when we write the Qualtrics survey, regardless of the final presentation-format decision.
- **Commits us to:** citing Burfurd & Wilkening (2018) for the timing evidence.
- **Rules out:** copying the HS instruction text verbatim from Holt & Smith (2016) even if we use a list-style presentation. If a list format is later selected, we still use HH instructions.
- **Saves experiment time:** ~4–6 minutes per subject vs. HS or TK instructions, at no measured accuracy cost. At 600 subjects this is meaningful on Prolific time-based pricing.
- **Added a new sub-section to analysis doc:** §7.8 "Instruction format is a separable decision" (written 2026-04-14) — makes this decoupling visible to future readers of the analysis doc.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` :: §7.8 "Instruction format is a separable decision"
- `quality_reports/session_logs/2026-04-14_mpl-format-decision-continued.md` :: Design Decisions table row "Use HH-style instructions regardless of presentation format"
- Burfurd & Wilkening (2018, *Experimental Economics*) reading notes in `master_supporting_docs/literature/reading_notes/`
- Git commit: `66f2f43` ("MPL format decision: Section 10 criteria 1-3 resolved; p-BDM incentive-only gap flagged")
