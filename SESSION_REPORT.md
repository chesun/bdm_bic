# Session Report — BDM Incentive Compatibility

## 2026-04-13 22:00 — MPL Format Decision Analysis

**Operations:**

- Created `quality_reports/mpl_format_decision_analysis.md` — 13 sections on format trilemma, multi-switching, B&H transfer, acts-vs-outcomes foundation, accuracy metrics, format options, decision criteria
- Added new Section 3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" mid-session; renumbered all downstream sections and internal cross-references
- Updated `TODO.md` with MPL format decision as new active item; added Condition 2 operationalization to Up Next
- Created `quality_reports/session_logs/2026-04-13_mpl-format-decision.md`

**Decisions:**

- Tentative format: coarse separated (15-20 rows, random order) — preserves monotonicity per Brown & Healy; burden tolerable; 5pp precision sufficient for BIC test
- Tentative accuracy metric: M3 hybrid with success rate as primary; multi-switchers coded as failures symmetric to BDM subjects who report far from π
- Correct identification of B&H's IA: mechanism invariance (not reduction of compound lotteries). Reduction is a mechanism, not an assumption

**Results:**

- Points 2 and 3 of April 7 decision list now have a dedicated analysis document
- New problem surfaced and addressed: multi-switching in separated-format MPL threatens H2 interpretability
- Conceptual foundation (acts vs. outcomes, mechanism invariance, strategy-space restriction) documented for downstream design defense

**Commits:** None this session — session is in-progress drafting.

**Status:**

- Done: Analysis doc with acts-vs-outcomes foundation; session log; TODO update
- Pending: Christina reviews Section 10 of analysis doc and commits to seven decision criteria; Condition 2 operationalization (Point 6); CS Comments for papers 3, 4, 5, 7, 9, 11, 12

## 2026-04-14 — MPL Format Decision (continued)

**Operations:**

- Section 2 trilemma table restructured — split into 4 format columns, separated cognitive vs. navigation burden
- Section 7.2 and 7.7 renamed for LIST/SEPARATED legibility; Section 7.3 updated to credit Trautmann & van de Kuilen (2015, *EJ*) as TK origin; new Section 7.8 added on HH instruction format (B&W 2018)
- Section 10 criteria 1-3 resolved (multi-switching as descriptive outcome, accuracy metric subsumed by criterion 1, Danz 2022 dual-metric ε adopted)
- Section 4 reframed ("Descriptive Outcome, Not a Threat"); Section 11 tentative recommendation cleaned up
- New Section 12 added: "Related Design Note: p-BDM Incentive-Only Test" — records JEP 2024 content gap, design questions for our own version
- Azrieli et al. definitional clarification on monotonicity (≽ on X → ≽* on P(X); acts framing is correct in their setup)
- Deep web search for DVW's forthcoming "Pure-Incentives Test" paper — confirmed not publicly available; email to Danz drafted and scheduled for 2026-04-15
- TODO updated: p-BDM incentive-only test design added as Up Next (subsumes Point 6 of April 7 discussion)

**Decisions:**

- Criterion 1 (multi-switching): report as descriptive outcome, not invalidation threshold. Follow Chakraborty & Kendall 2025 precedent (29.7% / 43.7% benchmarks)
- Criterion 2 (accuracy metric): subsumed by criterion 1 framing. Compare on % within ε margin. Asymmetry between MPL (3-way) and BDM (2-way + focal diagnostic) handled explicitly
- Criterion 3 (ε): Danz 2022 dual metric — false reports (ε = 0) and distant reports (ε = 5pp) in parallel
- Instruction format: use HH-style (Hao-Houser "chips-in-a-bag") regardless of presentation format
- Framing throughout: separated format preserves monotonicity by restricting strategy space, not preferences

**Results:**

- Analysis doc now 14 sections, internally consistent, with new p-BDM incentive-only test section as bridge to separate design work
- Three of seven Section 10 criteria locked in
- Email drafted and scheduled for Danz 2026-04-15

**Commits:** (pending end-of-session commit)

**Status:**

- Done: Section 10 criteria 1-3 resolved; p-BDM incentive-only test gap flagged; Danz email drafted
- Pending: Section 10 criteria 4-7 (B&H auxiliary, revise screen, burden budget, precision); p-BDM incentive-only test design work (new); Danz email reply; TvdK 2015 read; CS Comments backlog

## 2026-04-17 — Advisor Meeting Prep + ROCL Canonical Framing Correction

**Operations:**

- Created `quality_reports/advisor_meeting_2026-04-17/` with three artifacts: p-BDM design-space synthesis (3 concrete proposals), questions-for-Anujit list (4 tiers), live walkthrough doc
- Renamed `quality_reports/strategy_space_restriction_intuition.md` → `quality_reports/bh_rocl_intuition.md` via `git mv`
- Rewrote the intuition doc with B&H's verbatim conjecture, ROCL + theorem preliminaries, two worked examples (list ⇒ ROCL triggered; separated ⇒ not triggered)
- Created ADR-0015 (canonical B&H ROCL-triggering mechanism; supersedes #0014); updated ADR-0014 Status to Superseded; edited ADR-0005 Proposed body to point at ADR-0015
- Revised `quality_reports/mpl_format_decision_analysis.md` §3.3 (certainty-effect worked example), §3.4 (6-step causal chain), §3.5 (canonical "Why Format Matters"), §6.1–§6.3 (cross-row vs. within-row channels), §4.3 (multi-switching table corrected)
- Updated README index for ADR log; updated TODO.md active task; updated meeting materials with renamed-file references

**Decisions:**

- Retire the "strategy-space restriction" framing project-wide; adopt canonical B&H ROCL-triggering mechanism as the sole framing — Christina flagged the discrepancy by comparing the intuition doc against B&H's verbatim text
- Meeting strategy: lead with p-BDM incentive-only test design (primary); MPL format as secondary; Anujit has UJS expertise (he co-authored C&K 2025), so Proposal C (parallel MPL incentive-only test) is the highest-leverage novel contribution
- ADR-0015 structure: mechanism invariance remains the IA; B&H ROCL-triggering is the cited mechanism; format selection remains open Pending decision

**Results:**

- All current-facing docs now use the canonical ROCL framing; historical records (session logs, SESSION_REPORT.md, superseded ADR bodies) preserved
- Advisor meeting prep complete: three artifacts ready to screen-share during today's meeting

**Commits:** To be created after this session (rename + ADR log + MPL doc revision + meeting materials).

**Status:**

- Done: Meeting prep artifacts; ROCL framing correction cascade (rename, ADR-0015, MPL doc §3/§4/§6 revision, cross-refs, session log, research journal)
- Pending: Anujit meeting today; review of bh_rocl_intuition §8 (belief wrinkle); paper draft check for stale strategy-space references

## 2026-04-20 — Slide Revisions and Hypothesis Restructure

**Operations:**

- Two rewrite passes on `quality_reports/advisor_meeting_2026-04-17/04_slides.tex`: (i) stripped implementation details (ADR references, internal process language, theory-stack taxonomy, meta-commentary); (ii) stripped residual AI language patterns (overhyping adjectives, labelized transitions, rule-of-three headers, fragment-bullet style)
- Added "Proposal B: Example at θ = 0.2" (native p-BDM framing, subject reasons through contingencies)
- Added "Proposal C: Example at θ = 0.2 (MPL side)" (binary-choice rows, correct pattern, format-level UJS prediction)
- Appended CR-demand note to Proposal A example for parallel structure across all three proposal examples
- Moved Brown & Healy discussion from Literature slide to Q3 MPL-format section where it motivates the choice
- Split Q3 into three slides: "MPL format: what the literature says," "MPL format: options and tradeoffs" (5-option comparison table), "Question 3: MPL format"
- Applied three edits to H2a (tightened antecedent, nested under H2, "per UJS" → "(UJS)")
- Collapsed H2 + H2a into single UJS-framed H2; removed H2a entirely
- Added Q1 bullet: "Is UJS the right framing for H2, or should the mechanism claim be contingent reasoning? UJS is cleanly identified by the design; CR would need a direct manipulation."
- Recompiled after each edit; final deck 15 pages, 169 KB

**Decisions:**

- Frame H2's mechanism claim around UJS formal property (unique vs. multiple justifiable actions), not contingent reasoning — the 4-arm design changes 6 things simultaneously, so CR as cognitive channel is not identified; UJS-as-formal-property is what the design actually identifies
- Collapse H2 + H2a into single claim rather than keep H2a as sub-hypothesis — once the mechanism claim is at the formal-property level, H2 and H2a restate the same thing
- Flag UJS-vs-CR framing as open question for Anujit — he authored UJS, strongest prior on whether direct CR identification is needed
- Split Q3 into three slides for natural flow (literature → options/tradeoffs → lean + question) rather than keeping as one dense frame

**Results:**

- Deck now Anujit-facing: 15 pages, no internal artifacts, natural academic voice, three concrete Ask moments
- Hypothesis count: H1 (a, b), H2, H3 — tighter than before, and H2's mechanism claim matches what the design identifies
- Three open meta-questions surfaced for Anujit: overall design critique (Q1), which p-BDM proposal (Q2), which MPL format / auxiliary B&H arm (Q3), plus the UJS-vs-CR framing sub-question

**Commits:** None this session — pending explicit commit trigger.

**Status:**

- Done: slide revisions, hypothesis restructure, session log, research journal entry
- Pending: meeting with Anujit (if not already held); subsequent ADRs for H2 collapse and UJS framing commitment; H3 (complexity) identification power check; p-BDM proposal commit; MPL format commit
