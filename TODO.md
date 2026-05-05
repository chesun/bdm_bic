# TODO — BDM Incentive Compatibility

Last updated: 2026-05-05

## Resume here

**State as of 2026-05-05:** Christina is doing her own deep read of Healy & Leo (2025) Chapter 3 §2.1–§2.3 (~18 pages) before any ADR / paper / deck edits. The published reconciliation of Anujit's Point 4 vs. ADR-0012 is in `quality_reports/advisor_meeting_2026-04-23/03_karni-close-read-implications.md` and the per-paper notes at `master_supporting_docs/literature/reading_notes/healy_leo_2025.md`.

**Next concrete action**, in order of dependency:

1. **Wait for Christina's reaction to the H&L deep read.** Specifically: does she agree the published "probability equivalent vs. belief" terminology resolves Anujit Point 4 cleanly, or does she see a stronger reading of Anujit's claim that H&L actually contradicts? Until this lands, no ADR/paper/deck edits.
2. **If H&L reaction confirms the reconciliation:** start P1-1 (ADR-0012 interpretive subsection on probability equivalents). This is the unblocker for everything downstream.
3. **If Christina wants to continue P0 reading first:** next paper is Azrieli et al. (2018) for completeness — useful for the supplement appendix but not blocking the IC argument since H&L Proposition 4 cites ACH directly.
4. **Independent threads still open** (no dependency on Point 4 resolution): Dustan et al. (2023) for Point 2 (ROCL-for-BDM); complexity literature scan for Point 1 (Oprea, Enke-Graeber, Alós-Ferrer-Garagnani).

## Active (doing now) — P0: Anujit 2026-04-23 feedback resolution

Anujit raised four points on 2026-04-23. Full capture: `quality_reports/advisor_meeting_2026-04-23/01_feedback-capture.md`. Analysis: `quality_reports/advisor_meeting_2026-04-23/02_point-4-probabilistic-sophistication-deep-dive.md`. Implications post-Karni-and-H&L: `quality_reports/advisor_meeting_2026-04-23/03_karni-close-read-implications.md`. Primary-source re-reads come BEFORE any ADR updates, paper edits, or deck edits.

- [x] **P0-1: Karni (2009) close-read** — completed 2026-04-23. Notes: `master_supporting_docs/literature/reading_notes/karni_2009.md`. Finding: Karni's IC proof requires probabilistic sophistication (load-bearing in Case 3 of the proof). But this is Karni's framework, not the only IC framework.
- [x] **P0-2: Healy & Leo (2025) Chapter 3 close-read** — completed 2026-04-24. Notes: `master_supporting_docs/literature/reading_notes/healy_leo_2025.md`. **Decisive finding:** the published reconciliation is in §2.2 (pp. 90–91). BDM/MPL IC requires only T-statewise monotonicity (Proposition 4, citing Azrieli et al. 2018). Without PS, the elicited quantity is a "probability equivalent," not a belief. Replaces the made-up "mechanism IC vs. belief IC" labels with H&L's published terminology. Christina is doing her own deep read of H&L before any ADR/paper/deck edits.
- [ ] **P0-3 (downgraded from P0): Azrieli, Chambers, Healy (2018) primary-source read** — useful for completeness (FOSD dominance Axiom 2*; Fact 1.2 ambiguity-aversion example) but no longer blocking. H&L Proposition 4 cites Azrieli et al. directly; the substantive IC result we need is grounded.
- [ ] **P0-4: Brief read of Machina & Schmeidler (1992 or 1995)** on probabilistic sophistication — definition plus characterization. Grounds the PS half of the H&L framework on the original axiomatization. Not blocking.
- [ ] **P0-5: Primary-source read of Dustan, Koutout, Leo (2023)** — does the ROCL argument apply to BQSR only, or also to BDM? Produces `dustan_koutout_leo_2023.md`. Closes Point 2 (separate from Point 4).
- [ ] **P0-6: Literature scan on "complexity" in behavioral/experimental economics** — Oprea (2020), Enke & Graeber, Alós-Ferrer & Garagnani as candidate leads. Closes Point 1.

## Up Next — P1: ADR updates and reframings (after the user finishes the H&L deep read)

The post-H&L direction is softer than the pre-H&L plan. ADR-0012 needs an interpretive addition, not a supersession. The deck Frame 4 needs an extension, not a teardown.

- [ ] **P1-1: ADR-0012 update.** Add an interpretive subsection on "what is elicited" using H&L's "probability equivalent" terminology. Clarify: PS is not required for IC; PS is required for the elicited quantity to BE a belief (rather than a probability equivalent). Keep ADR-0012 Decided. This is an addition, not a supersession.
- [ ] **P1-2: ADR on precision and report-grid matching across mechanisms.** Commits pBDM to 5pp precision aligned with MPL; decides discretized vs. continuous q; decides display mode. Single ADR covering the three tightly-coupled decisions.
- [ ] **P1-3: ADR on the H3 "complexity" hypothesis.** Adopt one of: relabel as "endogenous vs. induced beliefs"; add auxiliary measures of ambiguity attitude; or accept the joint-variation framing and discuss in the paper. The Bayesian arm does not need to be dropped — H&L confirms BDM/MPL is still IC under monotonicity in that arm; what changes is the *interpretation* of the elicited quantity (probability equivalent rather than belief).
- [ ] **P1-4: Commit to MPL format selection** across the remaining options after ADR-0020's reopening. Anujit endorsed 5pp precision (confirming coarse); the format-within-coarse question still depends on whether the MS/Stage-2 dilemma has a workaround.

## Waiting On

- [ ] Update paper draft framing (`main.tex`) — waiting on P1-1 (ADR-0012 update) and P1-3 (H3 hypothesis). Adopt H&L's "probability equivalent" terminology in the IC-defense section.
- [ ] Update deck (`04_slides.tex`) — Frame 4 (IC approaches) and H3 slide both need rewriting post-P1. Frame 4 extension: monotonicity ⇒ IC + probability equivalent; PS upgrades probability equivalent to belief; S-O reduction ⇒ BSR IC.
- [ ] Clean up references.bib duplicates (~300 Key/Keyb pairs) — low priority.
- [ ] Design the p-BDM incentive-only test from scratch — DVW 2024 JEP reports only headline result (69% choose q=0); WP methodology not public. See Section 12 of `mpl_format_decision_analysis.md` for design questions. Awaiting P1-1/P1-3 resolution before final commitment.
- [ ] Pressure-test research directions via `/discover interview`.
- [ ] Finalize research direction and write research spec.

## Backlog

- [ ] **Code hygiene: clean up commented-out code in `analysis/do/*.do` files.** Currently large blocks of dead/commented-out code accumulate without explanation; either revive into active code or delete. Per `.claude/rules/stata-code-conventions.md`, comments should explain WHY, not WHAT — and should not preserve dead code.
- [ ] **Code hygiene: add header comment to every `.do` file documenting purpose.** Currently most `.do` files have no header explaining what the script does, what it depends on, or what it produces. Adopt the standard header from `.claude/rules/stata-code-conventions.md`.
- [ ] Re-open whether the Bayesian-updating arm design can be modified to preserve probabilistic sophistication (e.g., finite-hypothesis presentation with Bayes-rule computation shown). Lower priority post-H&L since the arm is no longer at risk of being dropped.
- [ ] Revisit ADR-0005 (B&H belief transfer) and ADR-0015 (B&H ROCL canonical) after P0-5 confirms ROCL-for-BDM status.
- [ ] Read Trautmann & van de Kuilen (2015) — origin of the TK two-stage list format.
- [ ] Operationalize Condition 2 for BDM — subsumed by p-BDM design work.
- [ ] Compile reference set of published SBDM/BDM instructions.
- [ ] Experiment design via `/design experiment` — after research spec.
- [ ] Power analysis — after design.
- [ ] Pre-registration — after design.
- [ ] IRB update — after design.
- [ ] Update Qualtrics survey for new design.
- [ ] Add CS Comments to librarian-filled entries (papers 3, 4, 5, 7, 9, 11, 12).
- [ ] Optional: populate `.claude/state/primary_source_surnames.txt` with the cited authors we use frequently (per the updated primary-source-first rule). Reduces hook false-positives like the "DVW (2022)" / "ACH (2018)" abbreviation mis-parses we hit this session.

## Done (recent)
- [x] **Healy & Leo (2025) Chapter 3 close-read (theory sections §2.1–§2.4, pp. 81–100)** — published "probability equivalent" vs. "belief" framework recovered. Resolves the Karni-vs-ADR-0012 tension: BDM/MPL is IC under monotonicity (no PS needed); without PS, elicited quantity is a "probability equivalent." Updated `03_karni-close-read-implications.md` to reflect the softer revision path. Notes: `master_supporting_docs/literature/reading_notes/healy_leo_2025.md` (2026-04-24).
- [x] **Karni (2009) close-read** — confirmed PS is load-bearing in Karni's IC proof (Case 3, p. 604). Without PS, the act-vs-lottery comparison via π(E) does not go through. Notes: `master_supporting_docs/literature/reading_notes/karni_2009.md` (2026-04-23).
- [x] **Advisor meeting with Anujit (2026-04-23)** — captured four points (complexity-not-strict, ROCL-for-BDM, precision-matching, probabilistic-sophistication-for-IC). Point 4 directly challenges ADR-0012. Produced feedback-capture and Point-4 deep-dive under `quality_reports/advisor_meeting_2026-04-23/`. Priority re-ordered: primary-source re-reads (P0) → ADR updates (P1) → paper/deck edits (P2). Session log: `2026-04-23_advisor-meeting-anujit.md` (2026-04-23)
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
