# Research Journal — BDM Incentive Compatibility

### 2026-04-13 22:00 — Claude (Design analysis)
**Phase:** Strategy / Design
**Target:** `quality_reports/mpl_format_decision_analysis.md`
**Score:** N/A (draft for user review)
**Verdict:** MPL format decision deepened from a single-paragraph open question into a 13-section analysis document. Key moves: trilemma framing (IC / interpretability / burden); multi-switching as a central diagnostic with four candidate mechanisms; acts-vs-outcomes conceptual foundation; tentative recommendation of coarse separated (15-20 rows) with M3 accuracy metric.
**Report:** `quality_reports/mpl_format_decision_analysis.md`, `quality_reports/session_logs/2026-04-13_mpl-format-decision.md`

### 2026-04-14 — Claude (Design analysis, continued)
**Phase:** Strategy / Design
**Target:** `quality_reports/mpl_format_decision_analysis.md`; TODO.md
**Score:** N/A
**Verdict:** Section 10 criteria 1-3 locked in (multi-switching as positive descriptive outcome per C&K 2025; accuracy metric subsumed by criterion 1; Danz 2022 dual-metric ε = 0 / 5pp adopted). Section 2 trilemma table restructured to separate cognitive and navigation burden. Sections 7.2/7.3/7.7 renamed and recredited; new Section 7.8 on HH instruction format (B&W 2018). New Section 12 records gap in public knowledge of DVW's p-BDM incentive-only methodology (confirmed via deep search) and flags design questions for our own version. Email to David Danz drafted and scheduled.
**Report:** `quality_reports/mpl_format_decision_analysis.md`, `quality_reports/session_logs/2026-04-14_mpl-format-decision-continued.md`

### 2026-04-15 — Claude (ADR decision log scaffolding)
**Phase:** Strategy / Design infrastructure
**Target:** `experiments/designs/decisions/` (new directory); `.claude/rules/decision-log.md`; `CLAUDE.md`; `TODO.md`
**Score:** N/A
**Verdict:** Scaffolded ADR (Architecture Decision Record) log as append-only canonical decision record. Backfilled 11 ADRs from three weeks of scattered records — 8 Decided (Full context), 3 Proposed (Reconstructed — partial context: 0005 B&H transfer, 0006 Condition 2 A/D priority, 0011 p-BDM design-from-scratch). After Christina flagged ADR-0004's "primary theoretical framework" as too broad, split into 0012 (Azrieli et al. 2018 monotonicity as IC foundation — lightweight minimal sufficient assumption, no EU/ROCL required) and 0013 (UJS as behavioral-failure framework; supersedes 0004 via append-only protocol). Added Scope field to template with 5-category taxonomy (Research framing / IC foundation / Behavioral theory / Experimental design / Methodology); retro-tagged all 13 entries. Rule file `.claude/rules/decision-log.md` codifies the process; CLAUDE.md Core Principles updated. Worked example (0012+0013) embedded as the canonical supersession pattern.
**Report:** `experiments/designs/decisions/README.md`, `quality_reports/session_logs/2026-04-15_adr-decision-log-scaffold.md`

### 2026-04-15 — Claude (ADR audit + corrections + deep-dive)
**Phase:** Strategy / Design infrastructure
**Target:** ADRs 0005, 0007, 0014; `quality_reports/strategy_space_restriction_intuition.md`
**Score:** N/A
**Verdict:** Audited 11 backfilled ADRs for overreach — found two definite (0005/0007 promoted tentative format preference to commitment) and two minor (0001/0009 forward-looking wording). Superseded 0007 with 0014 (mechanism invariance framing-only, no format commitment); edited 0005 (Proposed) to remove same overreach. Wrote 13-section conceptual deep-dive on why separated random-order format restricts the strategy space so non-monotone preferences cannot be expressed — covering the acts/outcomes distinction, worked ambiguity-aversion example, five loopholes (memory, predictable order, within-row non-monotonicity, noise, sophisticated subjects), and the key design takeaway: the honest defense is "prevents violation from expressing in observed behavior" not "makes the assumption hold." MPL format selection now explicitly open across all seven §7 options.
**Report:** `quality_reports/strategy_space_restriction_intuition.md`, `quality_reports/session_logs/2026-04-15_adr-decision-log-scaffold.md` (addendum)
