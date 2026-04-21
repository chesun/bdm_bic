# Session Log: 2026-04-17 — ROCL Canonical Framing Correction

**Status:** COMPLETED

## Objective

Correct a substantive framing error flagged during preparation for the 2026-04-17 advisor meeting with Anujit Chakraborty. The earlier "strategy-space restriction" framing in the IC-foundation exposition did not match Brown & Healy's (2018) verbatim conjecture (which Christina located in the paper). Retire the strategy-space framing; adopt B&H's canonical ROCL-triggering mechanism throughout the theoretical exposition and the decision log. Log every change in detail.

## Sequence of Events

1. **Meeting prep session (earlier 2026-04-17):** completed deep read of MPL analysis doc, strategy-space deep-dive, ADRs 0005/0011/0013/0014; produced three advisor-meeting artifacts under `quality_reports/advisor_meeting_2026-04-17/`. Meeting materials relied on the "strategy-space restriction" framing to ground the MPL format question.
2. **Christina's review:** Christina pulled up `strategy_space_restriction_intuition.md` and compared it against B&H's verbatim passage:

   > "Why does the list presentation cause the RPS mechanism to fail? We conjecture that it induces subjects to treat the list of decisions as one large decision. In doing so, subjects' choices become more consistent with the reduction of compound lotteries. It is well known that if a subject satisfies reduction but violates expected utility, then they must violate the axiom of monotonicity. Azrieli et al. (2016) show that, theoretically, monotonicity is crucial for the RPS mechanism to be incentive compatible. So if any of our subjects have non-expected utility preferences but were induced to satisfy reduction because of the list presentation, then they would have generated the differences across treatments that we observed. The separated presentation may prevent reduction from being satisfied, in which case violations of expected utility have no consequence for the (theoretical) incentive compatibility of the RPS mechanism."

   Flagged: the doc's framing (non-monotone preferences as primitive; separated format as restricting the feasible act set) does not match B&H's framing (non-EU preferences over simple lotteries as primitive; ROCL-triggering by format as the cognitive pivot; monotonicity violation as a theorem-derived consequence).

3. **Scope decision (by user):** rewrite the intuition doc to use only B&H's canonical framing, with worked examples of (a) ROCL triggering in list format and (b) ROCL non-triggering in separated format.
4. **Escalation decision (by user):** retire the "strategy-space restriction" framing project-wide — rename the intuition doc, supersede the affected ADRs with a new ADR, and revise the MPL analysis doc §3 to use the canonical ROCL mechanism. Log everything.
5. **Execution (this session):** all of the above, documented below.

## Changes Made

| File | Change | Reason |
|------|--------|--------|
| `quality_reports/strategy_space_restriction_intuition.md` → `quality_reports/bh_rocl_intuition.md` | Renamed via `git mv`. File history preserved. | Filename now matches content; the strategy-space framing is retired. |
| `quality_reports/bh_rocl_intuition.md` | Full rewrite (prior to this session — same morning). Now leads with B&H's verbatim conjecture (§1), defines ROCL + the theorem (§2), two worked examples in §3 (list ⇒ ROCL triggered) and §4 (separated ⇒ not triggered), plus what the argument does NOT claim (§6), limits and loopholes (§7), belief-elicitation wrinkle (§8), implications (§9), open questions (§10). Updated header with file-history note and ADR-0015 reference. | The earlier draft's "strategy-space restriction" framing was inconsistent with B&H and is now retired. |
| `experiments/designs/decisions/0015_bh-rocl-triggering-canonical-mechanism.md` | Created. Status: Decided. Supersedes #0014. Scope: IC foundation. Anchors theoretical framing on (1) mechanism invariance as the IA and (2) B&H's ROCL-triggering conjecture as the mechanism. | The canonical framing needs a Decided ADR in the decision log; 0014 was an unauthorized alternative framing. |
| `experiments/designs/decisions/0014_mechanism-invariance-framing-only.md` | Status updated: `Decided` → `Superseded by #0015`. Supersession banner added. Body intact. | Per append-only rule: only the Status field is edited when a Decided entry is superseded. |
| `experiments/designs/decisions/0005_bh-monotonicity-belief-transfer.md` | Added 2026-04-17 edit banner. Updated in-body cross-reference from "strategy-space-restriction argument (ADR-0014)" to "ROCL-triggering argument (ADR-0015, supersedes #0014)". | ADR-0005 is Proposed (editable). Substantive decision unchanged; only the framing cross-reference updated. |
| `experiments/designs/decisions/README.md` | Index updated: 0014 shown as `Superseded by [#0015]`; new row for 0015 (Decided, IC foundation). | Index must stay in sync with ADR statuses. |
| `quality_reports/mpl_format_decision_analysis.md` §3.3 | Rewrote the "optimal row-14 action can differ" example to explicitly invoke ROCL triggering, with a concrete certainty-effect subject example showing how list-format ROCL application flips the row-14 choice. Added forward reference to `bh_rocl_intuition.md` §3–§4. | §3 is the paper's IC-assumptions anchor; the example needed to reflect B&H's mechanism. |
| `quality_reports/mpl_format_decision_analysis.md` §3.4 | Rewrote the causal chain. Old 4-step chain (stable outcome-preferences → different decision problems → non-monotone preferences → detected difference) replaced with 6-step chain putting ROCL triggering at the center (MI → compound salience → ROCL applied → ROCL+non-EU ⇒ monotonicity violation (theorem) → row-14 action differs → B&H detects). Corrected the "ROCL is one route to monotonicity violation, but so are ambiguity aversion..." claim — it conflated preference structures (non-EU types) with cognitive axioms (ROCL). | The causal chain was the source of the strategy-space drift; had to be centered on ROCL. |
| `quality_reports/mpl_format_decision_analysis.md` §3.5 | Full rewrite of "Why Format Matters". Old framing (separated format "restricts strategy space"; list format lets subjects "implement portfolio strategies") replaced with canonical ROCL-triggering framing (list triggers ROCL; separated does not; non-EU has mechanism-level consequences only via ROCL). Added an explicit note that the "strategy-space restriction" framing was retired 2026-04-17 per ADR-0015. | This was the section with the clearest strategy-space drift and the most prominent exposition of the design principle. |
| `quality_reports/mpl_format_decision_analysis.md` §6.1–§6.3 | Rewrote. §6.1 now explicitly states B&H's ROCL-triggering conjecture. §6.2 now frames the transfer question at the cross-row ROCL level. §6.3 split into (a) within-row ambiguity channel (new explicit sub-section — format doesn't close this) and (b) belief-specific cross-row cognitive path (the "figure out π from structure" concern, framed as analogous to but distinct from ROCL). | Aligns §6 with the canonical framing; makes the cross-row vs. within-row distinction explicit. |
| `quality_reports/mpl_format_decision_analysis.md` §4.3 | Updated the "Four mechanisms that produce multi-switching" table. Mechanism (b) was "monotonicity violation (preference-level)" — now "Cross-row ROCL + non-EU (list-format only)" with a note that separated format suppresses this channel. Mechanism (a) expanded from "within-row comprehension failure" to also include within-row ambiguity / source preference. Added header note that (a), (c), (d) remain live in any format while (b) is list-specific. | Multi-switching taxonomy needs to reflect which channels are format-dependent. |
| `quality_reports/advisor_meeting_2026-04-17/02_questions-for-anujit.md` | Q2 setup updated to reference `bh_rocl_intuition.md` §3–§5 instead of the old filename. | Meeting materials need to match the renamed file. |
| `quality_reports/advisor_meeting_2026-04-17/03_walkthrough-doc.md` | Updated two filename references (body + appendix tabs list); §3 MPL lead-argument paragraph updated with file rename note. | Same as above. |
| `TODO.md` | Active task #3 (old "Review strategy-space restriction deep-dive") renamed to "Review B&H ROCL intuition doc" with new path and a revised key question (the old §9c/§12 question structure is superseded by the new §8 structure in the rewritten doc). Added 2026-04-17 Done entry (see below). | Reflect the rename and reframing. |

## Design Decisions

| Decision | Alternatives Considered | Rationale |
|---|---|---|
| Retire strategy-space framing project-wide rather than keep it as a "complementary lens" | Keep both framings; keep strategy-space as a secondary section | Christina's directive: use only the canonical B&H story. Keeping both would muddle the theoretical exposition and create cross-reference drift. |
| New filename `bh_rocl_intuition.md` | `bh_mechanism_intuition.md`, `rocl_triggering_intuition.md`, `bh_ic_intuition.md` | Shortest informative name. "bh_rocl" anchors the content in B&H's conjecture and the ROCL mechanism simultaneously. |
| Supersede ADR-0014 with new ADR-0015 rather than edit 0014 in place | Edit 0014 since it was only 2 days old | ADR-0014 is Decided. Append-only rule allows only Status-field edits on Decided entries; content changes require supersession. Also demonstrates the supersession protocol consistently (same-day supersessions allowed — see ADR-0004 → 0013 precedent). |
| Edit ADR-0005 body in place (not supersede) | Supersede with a new ADR | ADR-0005 is Proposed (editable per README rules). The substantive decision ("B&H transfer is an unverified assumption") is unchanged; only a cross-reference to ADR-0014 needed updating to point at ADR-0015. No supersession needed. |
| Revise MPL analysis §3 and §6 in place (no supersession) | Append a "2026-04-17 framing correction" section at the top; keep old text | Analysis docs are living documents. The old §3.3–§3.5 and §6 text was incorrect and would confuse a future reader or advisor. Revising in place and logging the change in the session log and ADR-0015 is the right pattern. Analysis docs are not append-only (that's the ADRs' job). |
| Keep historical `strategy-space` references in SESSION_REPORT.md and 2026-04-15 session log | Update them for consistency | Session logs and session reports are append-only historical records. At the time those entries were written, the framing was "strategy-space restriction" — that's the historical truth. Rewriting them would destroy the record of how the project's thinking evolved. |
| Not supersede ADR-0007 again | Write a new supersession chain 0007 → 0014 → 0015 | 0007 is already `Superseded by #0014`. Updating it to `Superseded by #0015` would obscure the chain. The chain 0007 → 0014 (retired framing) → 0015 (canonical framing) is the correct history. Anyone tracing back can follow the chain. |

## Incremental Work Log

- Session start: Christina flagged that `strategy_space_restriction_intuition.md` does not match B&H's verbatim conjecture.
- First response: articulated the discrepancy in writing — strategy-space framing treats non-monotone preferences as primitive and feasibility-set shrinkage as the mechanism; B&H's framing treats non-EU preferences as primitive and ROCL-triggering as the mechanism.
- User authorized rewrite of the intuition doc to use only the canonical framing, with worked examples.
- Rewrote `strategy_space_restriction_intuition.md` (prior to rename) with B&H's verbatim quote (§1), ROCL definition + theorem (§2), and two worked examples: certainty-effect subject in list format (§3, shows ROCL application flips row-14 choice) and same subject in separated format (§4, shows row-local evaluation recovers monotonicity). Updated meeting materials (02, 03) to reference the ROCL framing.
- User escalated scope: retire strategy-space project-wide; rename the file; supersede affected ADRs; revise MPL analysis doc §3 to match; log everything.
- Renamed file via `git mv`: `strategy_space_restriction_intuition.md` → `bh_rocl_intuition.md`.
- Drafted ADR-0015 (canonical B&H ROCL-triggering mechanism for list/separated); superseded ADR-0014 with Status edit + banner (body intact per append-only); edited ADR-0005 body (Proposed, editable) to point at 0015; updated README index.
- Revised MPL analysis doc §3.3 (certainty-effect example in list), §3.4 (6-step causal chain centered on ROCL), §3.5 (canonical "Why Format Matters" with retirement note), §6.1–§6.3 (cross-row vs. within-row channel separation), §4.3 (multi-switching taxonomy tightened).
- Updated TODO.md active task and added Done entry; updated meeting materials with renamed file references.

## Learnings & Corrections

- **[LEARN:theory]** B&H's canonical conjecture is about ROCL triggering, not strategy-space restriction. The two are not equivalent: ROCL-triggering treats non-EU over simple lotteries as primitive and monotonicity violation as theorem-derived; strategy-space restriction treats non-monotonicity as primitive and feasibility-set as the pivot. The field's citation of B&H is uniformly the ROCL version.
- **[LEARN:correction]** When paraphrasing a paper's conjecture in a theoretical exposition, *quote the verbatim passage first and then decompose*. The strategy-space framing drift happened because I summarized B&H's conjecture in my own terms without the verbatim anchor — my summary drifted away from the actual argument and took several downstream documents with it.
- **[LEARN:process]** Analysis docs, unlike ADRs, are not append-only. When a framing is corrected, revise the analysis doc in place and log the revision in a session log + a superseding ADR. The ADR log preserves the *decision history*; the analysis doc stays current for future readers.
- **[LEARN:process]** Same-day ADR supersession (0014 written 2026-04-15, superseded 2026-04-17) is fine and does not violate any protocol. The rule is "append-only," not "wait-before-superseding." The precedent of 0004 → 0013 (same-day) already established this.
- **[LEARN:theory]** The multi-switching taxonomy (§4.3) needs to distinguish *cross-row* channels (ROCL-driven, format-suppressible) from *within-row* channels (ambiguity, source preference, not format-suppressible). Both can produce observed multi-switching but have different design implications.
- **[LEARN:theory]** For belief elicitation specifically, the within-row ambiguity channel (event bet vs. r-lottery with subjective π) is a real concern that format selection does not close. Design mitigations are needed separately — instruction design emphasizing urn transparency; possibly ambiguity-aversion controls.

## Verification Results

| Check | Result | Status |
|-------|--------|--------|
| File renamed: `strategy_space_restriction_intuition.md` → `bh_rocl_intuition.md` via `git mv` with history preserved | `git status` confirms rename detection | PASS |
| ADR-0015 exists with Status: Decided, Supersedes: #0014 | File present; header correct | PASS |
| ADR-0014 Status updated to `Superseded by #0015` with banner; body intact | Status field and banner added; body unchanged | PASS |
| ADR-0005 body updated in place with 2026-04-17 edit banner | Banner + cross-ref update both present | PASS |
| ADR README index shows 0014 superseded, 0015 decided | Both entries updated | PASS |
| MPL analysis doc §3.3, §3.4, §3.5 rewritten in canonical ROCL framing | Verified via read-back of each section | PASS |
| MPL analysis doc §6.1–§6.3 rewritten with cross-row / within-row channel separation | Verified | PASS |
| MPL analysis doc §4.3 multi-switching table updated | Verified | PASS |
| Meeting materials (02, 03) updated with renamed file path and canonical framing | Verified | PASS |
| TODO.md active task renamed; historical Done entries preserved | Verified | PASS |
| Historical session log 2026-04-15 and SESSION_REPORT.md left intact | Per convention: historical records are append-only | PASS |
| No orphaned `strategy_space_restriction_intuition` references in current-facing docs | Grep confirms: only in ADR-0014 body (intact per supersession rule), ADR-0015 Context (intentional — explains what's retired), ADR-0007 body (intact, superseded ancestor), 2026-04-15 session log (historical), SESSION_REPORT.md (historical), and TODO.md Done section (historical). All current-facing references now point at `bh_rocl_intuition.md`. | PASS |

## Open Questions / Blockers

- Whether any remaining text in the paper draft (`bdm_bic_paper/paper/main.tex`) uses the strategy-space framing. Not checked this session — the paper is "draft (halfway)" per CLAUDE.md and the current MPL / IC sections may or may not be developed enough to reflect the retired framing. Flag for next paper-editing session.
- Whether the ADR-0015 ROCL framing affects the tentative MPL format lean (coarse separated / ADR Pending). The framing change shouldn't flip the format decision — separated format is still the right choice for the same reason (no ROCL triggering) — but the *defense* in the paper now cites ROCL rather than strategy-space. Confirm this at the advisor meeting.

## Next Steps

- Advisor meeting with Anujit Chakraborty (today, 2026-04-17): walk through the corrected framing. Primary ask (p-BDM incentive-only test) unchanged. Secondary ask (MPL format) now rests on the canonical ROCL argument.
- After meeting: revisit paper draft for any stale strategy-space references.
- Section 10 criteria 4–7 of MPL analysis doc (B&H auxiliary arm, revise screen, burden budget, precision) — still unresolved; each will produce an ADR when decided. The B&H auxiliary-arm question is now sharpened: it would directly test whether the ROCL-triggering mechanism transfers to belief elicitation at the cross-row level.

---

## Post-ROCL Addendum — Advisor Meeting Prep Deepening (Same Session)

After the ROCL correction cascade was logged and committed (work above), Christina requested three successive deepenings of the advisor-meeting prep for today's 2026-04-17 meeting with Anujit Chakraborty. Documented here to keep the session log complete.

### Round 1 — Concrete implementations + design walkthrough in meeting docs

**Objective:** Add concrete implementation examples for each p-BDM proposal, and include a brief walkthrough of the current overall experiment design so Anujit can give holistic feedback (not just on p-BDM / MPL format).

**Changes:**

| File | Change | Reason |
|---|---|---|
| `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` | New §5 "Concrete implementation examples (θ = 0.2)". §5.1 derives the p-BDM payoff math (P(win\|E) = q + (1 - q²)/2; P(win\|¬E) = (1 - q²)/2) and tabulates all 11 options at θ = 0.2, showing that maximizer = Option C (q = 0.2, EV = 0.520) vs. event-independent = Option A (EV = 0.500). Key insight: the EV gap is only 2pp — which is why DVW find 69% pick option A. §5.2, §5.3, §5.4 give screen mockups for Proposals A, B, C respectively. Renumbered downstream sections (old §5→§6, §6→§7, §7→§8, §8→§9). | User asked for concrete implementations. The payoff math table is load-bearing for interpreting the 69% finding and for Anujit to react to. |
| `quality_reports/advisor_meeting_2026-04-17/03_walkthrough-doc.md` | Inserted new §2 "Current experiment design" between reorient (§1) and p-BDM (now §3). Covers paradigm (urn), 4 arms (BDM-full / MPL / BDM-min / flat-fee), within-subject easy/hard manipulation, committed ADRs, open items, and a one-line ask to elicit holistic feedback. Renumbered downstream (old §2 p-BDM → §3, §3 MPL → §4, §4 Close → §5). Time budget updated from ~45 min to ~50-55 min. | User wanted Anujit to give feedback on the whole design, not just on the two design questions. The design walkthrough is intentionally brief (~5 min) so most of the time can still go to p-BDM and MPL. |
| `quality_reports/advisor_meeting_2026-04-17/02_questions-for-anujit.md` | Added new Tier-1 Q1 "Overall design: anything obviously broken or missing before we lock it?" with three sub-probes (4-arm structure, BSR arm yes/no, complexity manipulation strength). Renumbered existing Q1 → Q2, Q2 → Q3, etc. Meta-goal line updated. | Match the walkthrough doc's new §2 with an explicit question in the questions list. |

### Round 2 — Beamer slide deck

**Objective:** A short, succinct LaTeX beamer deck to screen-share during the meeting. Useful for eliciting feedback, not for lecturing.

**Changes:**

| File | Change | Reason |
|---|---|---|
| `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` | Created. 11-page deck, 16:9 aspect ratio, 11pt, default theme with minimal chrome. Structure: (1) Title; (2) Reorient (why not does; DVW scope); (3) Theory stack (Azrieli / UJS / B&H ROCL); (4) Current design (4-arm table + within-subject + measurement); (5) **Ask 1** (design sanity check); (6) p-BDM gap (69% / methodology not public / 2pp EV gap); (7) Three proposals (compact A/B/C table); (8) Payoff math at θ=0.2 (full 11-option table); (9) **Ask 2** (which proposal identifies UJS); (10) **Ask 3** (MPL format + B&H transfer); (11) Close (commitment slots). Ask slides marked with colored title and callout block stating the verbatim question. | Screen-share-ready. Three Asks visually distinct. Payoff math slide gives Anujit the full mathematical object on screen. |
| `quality_reports/advisor_meeting_2026-04-17/04_slides.pdf` | Compiled output. 11 pages, 155 KB. Only cosmetic warnings (underfull hboxes on tight p-columns). | Verified compile. |

### Design Decisions (Addendum)

| Decision | Alternatives Considered | Rationale |
|---|---|---|
| Three Ask slides in the deck (design sanity / p-BDM proposal / MPL format) vs. one big Ask at the end | One summary Ask slide | Three explicit moments create three natural beats for feedback. Matches the questions doc structure (three Tier-1 questions). |
| Use pdflatex-compatible theme (default + minor customization) vs. Metropolis | Metropolis is visually nicer | Metropolis requires XeLaTeX or LuaLaTeX; project standard is pdflatex. Default with `useinnertheme{circles}` is clean enough. |
| Color-code Ask slides with a custom `askblue` color | Use theme defaults | The three Asks are the purpose of the meeting; they should be visually distinct. |
| Include the full payoff math table (all 11 options) on its own slide | Show only a subset | The full table makes the 2pp gap visible and lets Anujit verify the maximizer calculation on-screen. Worth a dedicated slide. |

### Learnings (Addendum)

- **[LEARN:process]** For advisor meetings where the advisor is a senior expert on a specific framework (here: Anujit on UJS), the slide deck's payoff is less about teaching and more about providing a shared artifact to annotate. The three "Ask" slides serve as commitment moments — write down his answer while he's watching.
- **[LEARN:process]** When adding a "current design walkthrough" to meeting materials, the natural mistake is to make it too long. Keep it to committed ADRs + live open items; skip anything the advisor can reconstruct from reading the paper draft later. 5 min budget is right.
- **[LEARN:design]** The 2pp EV gap at θ = 0.2 (between q = 0 event-independent and q = 0.2 maximizer) is a load-bearing fact for interpreting DVW's 69% finding. Any future p-BDM design conversation should lead with this calculation, not with the headline 69% number. Anchoring in the tiny EV gap puts the UJS framing in the best light (makes "just use the safe option" behavior look reasonable under bounded rationality).

### Verification (Addendum)

| Check | Result | Status |
|---|---|---|
| `04_slides.tex` compiles under pdflatex (2-pass for outlines) | 11 pages, 155 KB, only cosmetic hbox warnings | PASS |
| `01_p-bdm-design-space-synthesis.md` section numbering consistent post-insertion (§5 new, §6–§9 renumbered) | Verified by grep of `^## ` | PASS |
| `03_walkthrough-doc.md` section numbering consistent post-insertion (§2 new, §3–§5 renumbered) | Verified | PASS |
| `02_questions-for-anujit.md` question numbering consistent post-insertion (Q1 new, Q2–Q6 renumbered) | Verified by grep of `^### Q\d` | PASS |
| Aux files (`*.aux`, `*.log`, `*.nav`, `*.out`, `*.snm`, `*.toc`) cleaned after compile | Only `.tex` and `.pdf` remain in meeting folder | PASS |

### Current State at End of Session

- All meeting prep artifacts complete:
  - `01_p-bdm-design-space-synthesis.md` — design space + concrete implementations (9 sections)
  - `02_questions-for-anujit.md` — 6 questions across 4 tiers
  - `03_walkthrough-doc.md` — 5 sections, ~50-55 min budget
  - `04_slides.tex` + `04_slides.pdf` — 11-page deck, screen-share-ready
- Session log, research journal, SESSION_REPORT.md, TODO.md all reflect current state.
- Ready to commit (per user's earlier "Ready to commit when you are"). Awaiting explicit commit trigger.
