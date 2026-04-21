# TODO — BDM Incentive Compatibility

Last updated: 2026-04-20

## Active (doing now)
- [ ] **Meeting with Anujit** — materials at `quality_reports/advisor_meeting_2026-04-17/` (synthesis, questions list, walkthrough, slides). Deck now 15 pages with hypotheses restructured around UJS formal property. Primary ask: p-BDM incentive-only test design (Proposals A/B/C). Secondary: MPL format (coarse separated commit + B&H transfer question). Meta-question: UJS vs. contingent-reasoning framing for H2's mechanism claim.
- [ ] **Write ADRs for 2026-04-20 design decisions** — collapsed H2 + H2a into UJS-framed H2; renumbered old H4 (complexity) to H3; deferred CR-as-cognitive-channel claim pending Anujit's input. Each decision needs its own ADR once confirmed.
- [ ] **Review backfilled ADRs** (post-audit state: 0001–0011 plus 0013/0014 supersessions) — two overreaches fixed (0004→0013, 0007→0014); minor forward-looking wording on 0001 and 0009 flagged but unchanged
- [ ] **Commit to MPL format selection** across all seven options in §7 of `mpl_format_decision_analysis.md` (full list / HS two-stage list / TK two-stage list / full separated / coarse separated / coarse separated + revise / two-stage separated). Tentative lean to 7.5 is *not* a commitment. Produces a new ADR when resolved.
- [ ] Resolve §10 criteria 4–7 (B&H auxiliary arm, revise screen, burden budget, precision) — these narrow the format selection space; each produces its own ADR. Criteria 1–3 already captured in ADR-0008 / ADR-0009.
- [ ] **Review B&H ROCL intuition doc** at `quality_reports/bh_rocl_intuition.md` (renamed 2026-04-17 from strategy_space_restriction_intuition.md; revised to canonical B&H ROCL framing with two worked examples). Key question: does §8 correctly separate cross-row ROCL from within-row ambiguity for belief elicitation?
- [ ] Add CS Comments to librarian-filled entries (papers 3, 4, 5, 7, 9, 11, 12)

## Up Next
- [ ] **Design the p-BDM incentive-only test from scratch** — DVW 2024 JEP reports only headline result (69% choose q=0); their working paper methodology is not publicly available (confirmed via deep search 2026-04-14). See Section 12 of `mpl_format_decision_analysis.md` for design questions (menu structure, payoff display, induced θ values, integration with main arm, MPL counterpart, sample size). Email to David Danz scheduled for 2026-04-15; regardless, we must design our own version.
- [ ] Read Trautmann & van de Kuilen (2015, *Economic Journal*, "Belief Elicitation: A Horse Race among Truth Serums") — origin of the two-stage list ("TK") format used by Burfurd & Wilkening 2018; directly informs Section 7.3 format option
- [ ] Operationalize Condition 2 for BDM (Point 6 of April 7 discussion) — subsumed by the p-BDM incentive-only test design task above
- [ ] Pressure-test research directions via `/discover interview`
- [ ] Finalize research direction and write research spec

## Waiting On
- [ ] Update paper draft framing (`main.tex`) — waiting on finalized research direction
- [ ] Clean up references.bib duplicates (~300 Key/Keyb pairs) — low priority

## Backlog
- [ ] Compile reference set of published SBDM/BDM instructions — decision depends on final design
- [ ] Experiment design via `/design experiment` — after research spec
- [ ] Power analysis — after design
- [ ] Pre-registration — after design
- [ ] IRB update — after design
- [ ] Update Qualtrics survey for new design

## Done (recent)
- [x] **Slide revisions + hypothesis restructure** — two rewrite passes on Anujit meeting deck (stripped implementation details, then AI language patterns); added concrete-example slides for Proposals B and C; added parallel CR-demand note to Proposal A; moved B&H discussion from Literature slide to Q3 where it motivates; split Q3 into three slides for natural flow (literature → options/tradeoffs → lean + question); reviewed user's hypothesis restructure; collapsed H2 + H2a into single UJS-framed H2; added UJS-vs-CR meta-question to Q1 for Anujit. Final deck: 15 pages. Session log: `2026-04-20_slide-revisions-and-hypothesis-restructure.md` (2026-04-20)
- [x] **ROCL canonical framing correction** — Christina flagged that `strategy_space_restriction_intuition.md` did not match B&H's verbatim conjecture. Rewrote intuition doc with B&H's canonical ROCL-triggering mechanism and two worked examples. Renamed file → `bh_rocl_intuition.md`. Wrote ADR-0015 (supersedes #0014); edited ADR-0005 cross-ref; revised MPL analysis doc §3.3/§3.4/§3.5/§4.3/§6.1–6.3 to use canonical framing. Meeting materials updated. Session log: `2026-04-17_rocl-canonical-framing-correction.md` (2026-04-17)
- [x] **Advisor meeting prep for Anujit (2026-04-17)** — produced three artifacts: p-BDM design-space synthesis with 3 concrete proposals (A: DVW replication; B: UJS-aligned native framing; C: parallel BDM+MPL, highest-leverage), questions-for-Anujit list (4 tiers), live walkthrough doc. Meeting strategy: lead with p-BDM (primary), MPL format (secondary) (2026-04-17)
- [x] Audited backfilled ADRs for overreach; superseded 0007→0014 (framing-only); edited 0005; wrote strategy-space deep-dive (2026-04-15) — *note: that deep-dive was later retired and replaced with canonical ROCL framing on 2026-04-17*
- [x] Split ADR-0004→0012+0013 (IC foundation vs behavioral theory); added Scope field (2026-04-15)
- [x] Scaffolded ADR decision log at `experiments/designs/decisions/`; backfilled 11 entries from prior records; added `.claude/rules/decision-log.md` + CLAUDE.md pointer (2026-04-15)
- [x] Cross-paper themes updated to 5 themes + 7 implications, incorporating all 23 papers. Critic scored 88/100, all fixes applied (2026-04-06)
- [x] Read Brown & Healy (2018), Tsakas (2019), Holt & Smith (2009), Grether (1981) — papers 20-23 added, critic scored 90/100 (2026-04-06)
- [x] Final critical review of all 19 reading notes + taxonomy — 3 critics scored 90/89/88. All fixes applied (2026-04-06)
- [x] Read Karni (2009) — foundational IC theory, critic scored 82/100, prospect theory caveat added (2026-04-06)
- [x] Read Holt & Smith (2016) and Azrieli et al. (2018) — detailed notes, critic scored 87/100 (2026-04-06)
- [x] Mechanism taxonomy created and critic-verified (GSO/UJS, RBC origin, IC hierarchy, historical lineage) (2026-04-06)
- [x] Read Healy (2020) note — RBC terminology origin documented (2026-04-06)
- [x] Read Burfurd & Wilkening 2018, Hao & Houser 2012, Burdea & Woon 2022 — detailed notes with instruction texts (2026-04-06)
- [x] Filled in Cross-Paper Themes (4 themes) and Implications for Research Direction (2026-04-06)
- [x] Read Benoit et al. (2022) fully — Hypothesis B ruled out for urn-draw design, no control arm needed (2026-04-06)
- [x] Updated research directions: dropped Arm 5 (control), design now 4 arms (2026-04-06)
- [x] Added Gonzalez-Fernandez et al. (2025) to reading notes (2026-04-02)
- [x] Reading notes completed for 12 papers, critic scored 82/100 (2026-04-01)
- [x] Lit review fixes: Chakraborty & Kendall → 2025 UJS, Healy & Leo expanded, Ersoy ↓ (2026-04-01)
- [x] Read Danz et al. (2024) JEP — forthcoming BDM BIC test discovery (2026-03-31)
- [x] Research directions v3 — "WHY does BDM fail BIC?" (2026-03-31)
- [x] Literature review — 90/100 after 4 critic rounds (2026-03-29/30)
- [x] Project setup (2026-03-29)
