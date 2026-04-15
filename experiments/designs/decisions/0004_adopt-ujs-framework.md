# 0004: Adopt UJS (Chakraborty & Kendall 2025) as primary theoretical framework

- **Date:** 2026-04-07
- **Status:** Superseded by #0013
- **Data quality:** Full context

> **Superseded 2026-04-15 by ADR-0013.** This entry conflated two theoretical jobs — the IC foundation and the behavioral failure story — under "primary theoretical framework." ADR-0012 now names Azrieli et al. (2018) monotonicity as the IC foundation; ADR-0013 scopes UJS to behavioral theory only. All substantive reasoning below remains valid *when applied to behavioral theory*; do not treat this entry as the IC-assumptions reference. Body preserved below for history.

## Context

Two formalizations of "BDM is cognitively hard" exist in the literature:

- **Obvious Strategy-Proofness (OSP; Li 2017; Tsakas 2019 for BDM).** The dominant strategy's worst-case payoff is at least the best-case payoff of any deviation, at every information set. Tsakas (2019) proved that static and ascending Karni BDM are *not* OSP; only the descending Karni variant is.
- **Unique Justifiable Strategy (UJS; Chakraborty & Kendall 2025).** The dominant strategy is the *only* justifiable action at each decision point. C&K 2025 proved that BDM is *not* UJS (many non-truthful reports remain justifiable at each report), while MPL is UJS (truth-telling is the only justifiable action at each row).

OSP and UJS are **mutually exclusive** for binary allocation with 3+ types (C&K 2025, Proposition 2). No mechanism can be both.

Both frameworks apply to our question, but they explain different facets. OSP requires a dynamic format (clock mechanism) to hold; our static belief MPL would not be OSP but could be UJS. The BDM vs. MPL comparison — the core diagnostic for H2 — is directly explained by UJS: MPL's row-by-row decomposition makes truth-telling uniquely justifiable at each row, which single-report BDM cannot.

## Decision

Use **UJS as the primary theoretical framework** for the paper. Cite Tsakas (2019) as supporting evidence (static BDM lacks obvious dominance — a parallel formalization of the same cognitive difficulty), but build the core theoretical story around UJS.

Rationale:

- UJS directly explains the BDM-MPL format comparison, which is the sharpest diagnostic for H2.
- OSP-style obvious dominance requires a dynamic (clock) format that is not in our design; making it the primary framework would create a gap between theory and design.
- UJS and OSP are mutually exclusive, so committing to one framework is a substantive choice, not a cosmetic one.

## Consequences

- **Commits us to:** framing H3 in UJS language — "BDM fails because many non-truthful reports are justifiable; MPL succeeds because truth-telling is uniquely justifiable per row." Error patterns should show diffuse deviation, not coherent alternative-game-form shading.
- **Commits us to:** citing Chakraborty & Kendall (2025) and Tsakas (2019) as load-bearing theoretical references.
- **Rules out:** a paper built primarily around obvious dominance or a Karni-descending-clock treatment arm. If we ever add a clock treatment, that becomes a separate (UJS-incompatible) research question.
- **Opens a future question:** could a UJS-incompatible mechanism (e.g., descending Karni clock) outperform our UJS-compliant MPL? Our current design cannot address this; it would be a follow-up study.

## Sources

- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 5 (lines 83–102)
- `quality_reports/mpl_format_decision_analysis.md` :: §3 (mechanism invariance discussion referencing UJS)
- `master_supporting_docs/literature/reading_notes/` :: Chakraborty & Kendall (2025) notes; Tsakas (2019) notes
- Git commit: `cef9ffb` ("Literature deep dive: 23 papers with detailed reading notes, mechanism taxonomy, cross-paper themes")
