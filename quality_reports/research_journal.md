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

### 2026-04-17 — Claude (Advisor meeting prep + ROCL canonical framing correction)
**Phase:** Strategy / Design infrastructure
**Target:** `quality_reports/advisor_meeting_2026-04-17/` (new); ADRs 0005, 0014, 0015 (new); `quality_reports/bh_rocl_intuition.md` (renamed); `quality_reports/mpl_format_decision_analysis.md` §3, §4, §6
**Score:** N/A
**Verdict:** Two arcs this session. (1) Produced three advisor-meeting artifacts ahead of today's meeting with Anujit Chakraborty (who is the "C" in C&K 2025 UJS, ADR-0013): `01_p-bdm-design-space-synthesis.md` (three concrete p-BDM incentive-only test proposals — A: DVW replication; B: UJS-aligned native framing; C: parallel BDM+MPL, the novel extension), `02_questions-for-anujit.md` (4-tier question list with Tier-1 asks on p-BDM design + MPL format), `03_walkthrough-doc.md` (live screen-share material: 5-min reorient → 25-min p-BDM → 10-min MPL → 5-min close). (2) Christina flagged that `strategy_space_restriction_intuition.md` did not match Brown & Healy's verbatim conjecture (which she located in the B&H paper). Rewrote the intuition doc to use only B&H's canonical ROCL-triggering mechanism (list triggers ROCL; ROCL + non-EU ⇒ monotonicity violation by theorem; separated does not trigger ROCL). Renamed file to `bh_rocl_intuition.md`. Wrote ADR-0015 superseding ADR-0014; edited ADR-0005 Proposed body to point at ADR-0015. Revised MPL analysis doc §3.3 (certainty-effect worked example for list-format ROCL), §3.4 (6-step causal chain with ROCL at center), §3.5 (canonical "Why Format Matters" with retirement note for strategy-space framing), §6.1–§6.3 (cross-row ROCL channel vs. within-row ambiguity channel), and §4.3 multi-switching taxonomy (mechanism (b) now explicitly list-format-only ROCL+non-EU). Meeting materials updated with corrected framing and renamed-file references. Key theoretical correction: the strategy-space framing treated non-monotonicity as a preference primitive; the canonical B&H framing treats non-EU as primitive and monotonicity violation as theorem-derived via the ROCL cognitive step. The two are genuinely different, and the canonical story is sharper for our IC defense.
**Report:** `quality_reports/session_logs/2026-04-17_rocl-canonical-framing-correction.md`; `quality_reports/advisor_meeting_2026-04-17/` (all three artifacts); `experiments/designs/decisions/0015_bh-rocl-triggering-canonical-mechanism.md`

### 2026-04-20 — Claude (Slide revisions + hypothesis restructure)
**Phase:** Strategy / Design refinement
**Target:** `quality_reports/advisor_meeting_2026-04-17/04_slides.tex`; hypothesis structure
**Score:** N/A
**Verdict:** Two-thread revision session on the Anujit meeting deck. (1) Presentation: scrubbed implementation details and residual AI patterns across two rewrite passes; added concrete implementation example slides for Proposal B (native p-BDM framing) and Proposal C (parallel MPL side); added a Proposal A CR-demand note parallel to B and C; moved B&H literature discussion from Literature slide to Q3 MPL-format section where it motivates the choice; split single Q3 slide into three (literature → options/tradeoffs → lean + question) for natural flow. (2) Substance: reviewed user's hypothesis restructure (old H3 demoted to H2a, old H4 renumbered to H3); applied three mechanical edits to H2a (tightened antecedent, nested under H2, "per UJS" → "(UJS)"). User then raised the core identification concern — p-BDM → MPL changes at least 6 things simultaneously (output format, task framing, per-decision complexity, presentation, UJS property, CR demand), so H2a's cognitive claim is not identified by the design. Enumerated confounds; proposed three paths (reframe around UJS formal property / triangulate / add direct-manipulation arm); recommended reframe. User chose reframe. Collapsed H2 + H2a into single UJS-framed H2 ("MPL achieves better behavioral IC than BDM because MPL admits a unique justifiable action per row while BDM admits many"). Added Q1 meta-bullet flagging UJS-vs-CR framing for Anujit. Final deck: 15 pages. Hypothesis count: H1 (a, b), H2, H3.
**Report:** `quality_reports/session_logs/2026-04-20_slide-revisions-and-hypothesis-restructure.md`
