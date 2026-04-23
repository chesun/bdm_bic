# Session Log: 2026-04-22 — Pre-Thursday (2026-04-23) Slide Review and Fixes

**Status:** IN PROGRESS

## Goal

Pick up the advisor-meeting prep after the 2026-04-20 session. The meeting with Anujit (originally scheduled 2026-04-17) was rescheduled to Thursday 2026-04-23 (tomorrow). User has made one edit to the slide deck since the last commit and asked for a deep in-depth review.

## Key Context

- **Deck under review:** `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` (15 pages, 169 KB, compiles under pdflatex). Folder name retains the original meeting date; meeting is now 2026-04-23.
- **Last session (2026-04-20):** restructured hypotheses (collapsed H2 + H2a into UJS formal-property framing; renumbered old H4 → H3); added Proposal A/B/C example slides; split Q3 into three frames (literature / options and tradeoffs / the question); stripped AI language patterns. See `quality_reports/session_logs/2026-04-20_slide-revisions-and-hypothesis-restructure.md`.
- **User's only edit since last commit:** removed "The replication also extends DVW's p-BDM finding to four values of θ." from the Contribution bullet on the RQ slide (frame 3, line 46). User's reason, confirmed this session: "we have no idea what DVW did for the theta values or how many theta values they checked, so better not to guess."
- **Meeting agenda** (from `02_questions-for-anujit.md`): Tier-1 Q1 overall-design gate, Q2 which p-BDM proposal discriminates UJS most sharply, Q3 B&H ROCL-transfer-to-beliefs. Anujit is the Chakraborty of C&K 2025 UJS; framework is his. Tier-2/3/4 held for time.
- **ADR state at session start:** 0001–0015 committed. H2 collapsed on UJS formal-property per ADR-0013. Format is still open (tentative coarse separated lean, ADR-0014 superseded by ADR-0015). p-BDM design from scratch per ADR-0011.

## Approach

1. Read the current deck plus the 2026-04-20 session log, the Questions-for-Anujit doc, the p-BDM design-space synthesis memo, and the key ADRs (0008, 0009, 0010, 0011, 0013, 0014, 0015).
2. Check `git diff` to see what user changed since last commit.
3. Produce a deep review memo covering: blocking bugs, consistency with ADRs and Questions doc, framing honesty per the 2026-04-20 identification analysis, style/cosmetic issues. Save to `quality_reports/advisor_meeting_2026-04-17/05_slide-review_2026-04-22.md` per the output-length rule.
4. Apply blocking fixes the user approves; recompile and verify.

## Incremental Work Log

- Read deck (265 lines), confirmed compile state (PDF at 17:42 today, 169 KB, 15 pages). Pulled git diff: only the DVW-θ-extension sentence was removed.
- Read 2026-04-20 session log to refresh context on the hypothesis restructure, Proposal B/C slide additions, Q3 split, and CR-vs-UJS meta-question decision.
- Read Questions-for-Anujit doc (02), p-BDM design-space synthesis (01), and ADRs 0008, 0009, 0010, 0011, 0013, 0014, 0015 to cross-check deck content against committed decisions.
- Identified three issues requiring flags: (a) BUG — `H4` dangling reference on frame 5 line 80, leftover from the 2026-04-20 renumber; (b) CLEANUP — "condition 1 / condition 2" DVW-JEP / ADR-0006 internal jargon on frame 5 design table lines 72–73, missed by the 2026-04-20 strip pass; (c) FRAMING — Q2's three-account discrimination paragraph is too compressed and slightly overclaims (calling B a "direct UJS test" and saying UJS is the "clear explanation" in C, despite ambiguity aversion not being cleanly ruled out because the event bet is ambiguous in both p-BDM and MPL).
- Also flagged six non-blocking tweaks (H1 "weak conditions" phrasing, H1a null-form framing, between-subject structure not stated on design slide, frame 7 abrupt ending, frame 13 p-value wording, frame 11 column headers).
- Wrote full review to `quality_reports/advisor_meeting_2026-04-17/05_slide-review_2026-04-22.md`.
- User approved fixes for BUG and CLEANUP; confirmed θ-extension should stay removed because DVW's θ coverage is unknown (don't guess).
- Applied BUG-1: line 80 `Identifies H4` → `Identifies H3`.
- Applied CLEANUP-1: design table rows 3 and 4 now read `H1a: info/no-info` and `H1b: direct test`; "condition 1/2" jargon and redundant "pure incentive test" in row 4 both removed.
- Recompiled (two-pass). PDF is 169 KB, still 15 pages. Only the two trivial hbox warnings remain (overfull 2.078pt at line 84; underfull badness 1655 at line 200) — flagged but not blocking.

## Design Decisions

| Decision | Alternatives considered | Rationale |
|---|---|---|
| Remove "condition 1 / condition 2" labels from design table Identifies column; replace with `H1a: info/no-info` and `H1b: direct test` | Keep "condition 1/2" labels; strip them and leave the cell as bare "H1a" / "H1b"; use "Diagnoses H1a" / "Diagnoses H1b" voice | "condition 1/2" is DVW-JEP / ADR-0006 internal shorthand that Anujit has not seen in this deck. The 2026-04-20 pass scrubbed ADR references and internal process language but missed these. The minimal jargon-free rewrite preserves the informational cue (what the arm identifies) without importing vocabulary Anujit will need to decode. |
| Do not restore the DVW θ-extension replication claim anywhere in the deck | Put it in a Design-slide footnote; mention verbally in Q2 setup; restore in Contribution | User's reason: we don't know DVW's θ coverage from the JEP, and their WP is not public. A replication-and-extension claim that overlaps with DVW's unseen WP could backfire. Leave it out entirely. |

## Changes Made

| File | Change | Reason |
|------|--------|--------|
| `04_slides.tex` line 80 | `Identifies H4.` → `Identifies H3.` | H4 doesn't exist post-2026-04-20 renumber. Dangling reference. |
| `04_slides.tex` lines 72–73 | Design table rows 3 and 4 rewritten to strip "condition 1/2" jargon and remove redundant "pure incentive test" wording in row 4. | Internal DVW-JEP / ADR-0006 taxonomy not introduced in the deck; reads as unexplained shorthand. |
| `04_slides.pdf` | Recompiled (two-pass). Still 15 pages, 169 KB. | Verify clean compile after edits. |
| `quality_reports/advisor_meeting_2026-04-17/05_slide-review_2026-04-22.md` | New file — deep review memo covering blocking fixes, content tweaks, ADR cross-check, Questions-doc consistency check, recommendation. | Output-length rule: long structured outputs go to disk, not the terminal. |

## Verification Results

| Check | Result | Status |
|---|---|---|
| `04_slides.tex` compiles under pdflatex (two-pass) | 15 pages, 169 KB | PASS |
| `H4` no longer appears in deck | grep confirms only H1/H1a/H1b/H2/H3 | PASS |
| Design table Identifies column contains no "condition 1/2" jargon | grep confirms | PASS |
| Compile produces only the two prior trivial hbox warnings (lines 84, 200) | No new warnings | PASS |

## Open Questions / Blockers

- **FRAMING-1 (Q2 three-account analysis).** Tabled by user (2026-04-22). Keep current slide text; nuance carried verbally in the meeting.
- **TWEAK-1 (H1 "weak conditions").** Withdrawn by user (2026-04-22). "Weak conditions" is DVW 2022 AER's own terminology; deck intentionally adopts the convention. Keep as-is.
- **TWEAK-5 (between-subject structure on design slide).** Review flagged that the deck does not explicitly state T1–T5 are between-subject. User has not decided whether to add the one-sentence clarification.
- **Other non-blocking tweaks (TWEAK-2, 3, 4, 6, 7, 8).** All listed in review doc; no action yet.

## Next Steps

- Await user decision on FRAMING-1. If swapping in the rewrite, recompile and re-verify.
- If time, sweep the remaining non-blocking tweaks — H1 "weak conditions" wording, H1a null-form phrasing, between-subject structure line on design slide, frame 7 transition line into proposals, frame 13 p-value gloss, frame 11 column labels.
- After meeting: capture Anujit's commitments as ADRs. The hypothesis restructure from 2026-04-20 (H2 collapse; old H4 → H3) still needs an ADR of its own (flagged in the 2026-04-20 log's Next Steps).

## Addendum — UJS / CR framing correction and primary-source-first enforcement (2026-04-22 evening)

- User reviewed `feedback_dvw_terminology.md` and the `05_slide-review_2026-04-22.md` review memo, then reported reading Chakraborty & Kendall (2025) directly. Quoted the intro passage showing UJS is built on contingent reasoning — a mechanism is UJS iff no alternative CR path can justify a non-dominant action. "UJS vs. CR" as alternatives is a false dichotomy.
- Claude confirmed the correction by reading C&K pp. 1–6 directly. Abstract and §1 explicitly state UJS "takes a novel approach to eliminating the need for contingent reasoning." The "justifiable" predicate is defined through payoff-relevant CR paths.
- Claude acknowledged the failure: `Chakraborty_Kendall_2025_UJS_elicitation.pdf` had been in `master_supporting_docs/literature/papers/` the entire time and was never opened. Framing claims about UJS in ADR-0013, the 2026-04-20 identification analysis, and the 2026-04-22 slide review all rested on paraphrases in derivative docs. Worse: the existing compiled reading notes at `bdm_bic_2026-03.md#9` had the UJS-as-CR-framework claim correct; Claude never read those notes either.
- **Slide edit:** dropped the Q1 CR-vs-UJS bullet from frame 6 of `04_slides.tex` (was based on the false dichotomy). Recompiled clean, 15 pages, only the two pre-existing hbox warnings remain.
- **Memory updates:** saved `project_ujs_is_cr_formalization.md` as a project-memory file and indexed in `MEMORY.md`. Lists the derivative docs that need review for the same error.
- **Primary-source-first infrastructure:** Christina asked for an enforceable rule. Claude produced a proposal (`quality_reports/plans/2026-04-22_primary-source-first-rule.md`) with a layered design (PreToolUse hook + rule file + reading-notes README) and then implemented it per auto-mode:
  - `.claude/rules/primary-source-first.md` — states the principle, the reading-notes contract, and the escape-hatch syntax.
  - `.claude/hooks/primary-source-check.py` — PreToolUse hook on Edit/Write. Enforces on ADRs, paper main.tex, meeting slides/memos, session logs, plans, and analysis memos. Regex-based author-year citation detection over the *delta* (not the whole file). Citation stems resolve to either a per-paper file in `reading_notes/` or a markdown section header / citation-metadata line in a compiled notes file. Escape hatch via `<!-- primary-source-ok: stem -->`. Fail-open on hook bugs (never block for the wrong reason). Four end-to-end test cases verified: block on missing notes (Li 2017 test case), allow on existing notes (C&K 2025 via compiled file section header), allow silently on non-enforceable paths, allow via escape hatch. <!-- primary-source-ok: li_2017 -->
  - `.claude/settings.json` — hook registered alongside the existing `protect-files.sh` under the `PreToolUse` matcher `Edit|Write`.
  - `master_supporting_docs/literature/reading_notes/README.md` — canonical template and rules for reading-notes files. Required section: "What this paper is NOT claiming (common misreadings)" — calibrated to prevent the UJS-as-distinct-from-CR class of failure.
  - `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` — new dedicated per-paper file. Cross-references the compiled notes at `bdm_bic_2026-03.md#9`, adds verbatim definitions from pp. 1–6, populates the "NOT claiming" section with five anticipated misreadings (including the CR-distinction error), and flags the OSP-UJS tradeoff and the simplified-representation clause as directly load-bearing for H2 / H3 / the Thursday meeting.

## Additional Design Decisions (2026-04-22 evening)

| Decision | Alternatives considered | Rationale |
|---|---|---|
| Drop the Q1 CR-vs-UJS bullet from frame 6 rather than reframe it | Reframe to "UJS formalizes CR via the justifiable-action set — is the MPL-vs-BDM comparison sufficient to identify that claim?"; leave bullet, carry correction verbally | User chose drop. Cleanest; the CR-vs-UJS framing was a category error that should not be pitched to the paper's own framework author (Anujit). |
| Implement the full layered primary-source-first enforcement (rule + hook + README + dedicated C&K notes) rather than a minimal rule-file-only version | Rule file alone; hook without escape hatch; stop-hook-only audit | User explicitly asked for enforceable. Rules alone failed once already this week. Auto mode active; proposal presented and user did not redirect. Implementation took ~45 min including testing. |
| Reading-notes contract accepts either per-paper files OR dedicated section headers in compiled files | Require per-paper files only (breaking change for the existing `bdm_bic_2026-03.md`) | Respects existing convention. Section-header matching is tightened in the hook to only count `#`-prefix header lines and `**Citation:**` metadata lines — casual in-text mentions do not constitute reading-notes evidence. |
| Write a dedicated C&K notes file even though the compiled notes already covered it | Rely on the compiled notes alone | The compiled notes were correct on the UJS-as-CR point but did not have a "NOT claiming" section. The dedicated file adds verbatim definitions and the misreading-prophylaxis section — critical now that we know the derivative-doc-propagation failure mode exists. |

## Additional Changes (2026-04-22 evening)

| File | Change | Reason |
|---|---|---|
| `04_slides.tex` line ~94 | Dropped Q1 bullet "Is UJS the right framing for H2, or should the mechanism claim be contingent reasoning?" | Based on false dichotomy; UJS is the CR framing. |
| `04_slides.pdf` | Recompiled. 15 pages. Only pre-existing hbox warnings remain. | Verify clean compile. |
| `~/.claude/projects/.../memory/project_ujs_is_cr_formalization.md` (new) | Project memory capturing C&K's UJS-via-CR definition and the failure-mode that caused it to be missed. | Prevent future sessions from repeating the distinction error. |
| `~/.claude/projects/.../memory/MEMORY.md` | Added index entry for the new memory file. | |
| `claude-config` repo | Synced new memory + existing memory (initial sync) in commit `85c5cba` and UJS memory in commit `9b7aabb`, pushed. | Per standing `sync-global-config` rule. |
| `quality_reports/plans/2026-04-22_primary-source-first-rule.md` (new) | Proposal document for the enforceable rule. | Plan-first workflow; document the design before implementing. |
| `.claude/rules/primary-source-first.md` (new) | Project rule stating the primary-source-first principle. | Layer 2 of the enforcement design. |
| `.claude/hooks/primary-source-check.py` (new) | PreToolUse hook enforcing the rule. Fail-open on internal errors. Tested with four cases. | Layer 1 of the enforcement design. |
| `.claude/settings.json` | Added the new hook to the `Edit\|Write` PreToolUse matcher alongside `protect-files.sh`. | Hook registration. |
| `master_supporting_docs/literature/reading_notes/README.md` (new) | Canonical reading-notes template with required "NOT claiming" section. | Layer 3 of the enforcement design — what a compliant notes file looks like. |
| `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` (new) | Dedicated per-paper notes for C&K 2025. Verbatim definitions, five anticipated misreadings, OSP-UJS tradeoff, simplified-representation clause. | First backfill; most-cited paper in this project's H2 framing. |

## Additional Verification (2026-04-22 evening)

| Check | Result | Status |
|---|---|---|
| Hook blocks Edit/Write on enforceable path with citation lacking notes (test case using Li 2017) | Block message printed correctly with remediation path | PASS |
| Hook allows Edit/Write when dedicated or compiled notes exist (C&K 2025 test) | Exit 0, no output | PASS |
| Hook allows silently on non-enforceable path | Exit 0, no output | PASS |
| Hook honors escape hatch comment | Exit 0, no output | PASS |
| `04_slides.tex` still compiles after bullet drop | 15 pages, two pre-existing hbox warnings, no new warnings | PASS |
| Primary-source-first rule file + hook + reading-notes README + C&K notes all present and readable | `ls` confirms all five files | PASS |

<!-- primary-source-ok: li_2017, koszegi_2030 -->

## Enhancement — Three gap closures (2026-04-22 late evening)

Christina identified three gaps in the initial enforcement design:

1. Claims in conversation prose that never become a tool call (PreToolUse hooks can't see them).
2. Claims that pass existence-check but don't actually reflect consulting the notes.
3. Papers not in the repo at all — the initial design exited green; Christina wants this blocking.

All three closed in one commit.

**Library refactor.** Shared logic extracted to `.claude/hooks/primary_source_lib.py` so the PreToolUse hook and the new Stop hook reuse citation detection, notes-match resolution, session-transcript inspection, and block-message construction. The library exposes `describe_missing_status(stem, notes_dir, papers_dir, transcript_path)` which returns one of four values: `None` (satisfied), `MISSING_NOTES_PDF_EXISTS`, `MISSING_NOTES_NO_PDF`, `NOTES_NOT_READ_IN_SESSION`.

**PreToolUse enhancement (`primary-source-check.py`).** Now rejects in all three failure-mode classes. Differentiated block messages per status. Pulls `transcript_path` from the hook input and verifies notes were touched (Read/Write/Edit) in-session.

**New Stop hook (`primary-source-audit.py`).** Scans all assistant text blocks in the session transcript at Stop. For each citation found in prose, runs the same check. Blocks the turn-end if any citation lacks evidence. Respects `stop_hook_active` to avoid loops.

**Two library bugs found during testing, both fixed.**

- *PDF match failure.* The initial regex `\bchakraborty.*\bkendall\b` did not match filenames like `Chakraborty_Kendall_2025_UJS_elicitation.pdf`, because `_` is a regex word character — no `\b` boundary between underscore-separated name tokens. Replaced with tokenization: split filename on non-alphanumeric, check surnames and year are distinct tokens. Now robust to the project's filename convention.
- *Notes-match false positives.* The initial matcher accepted any markdown section header mentioning the paper's authors and year. This flagged `README.md` (which quotes "Chakraborty & Kendall (2025)" as an example in the template) and `mechanism_taxonomy.md` (which uses C&K in a perspective header) as if they were reading notes for the paper. Fix: only accept `**Citation:** Author ... Year` metadata lines, not section headers. A `**Citation:**` line is the reliable signal for "this section is reading notes for this paper."

**Session-touch semantics.** "Consulted the notes" = Read, Write, or Edit on the notes file during the session. Writing or editing the notes file counts because the author knows its contents as well as a reader does. Only Read is required for pure consultation.

**End-to-end tests (all pass).**

| Scenario | Hook | Expected | Observed |
|---|---|---|---|
| Scoped edit, citation with notes + compiled-file touched in session | PreToolUse | allow | allow |
| Scoped edit, citation with PDF but no notes (Li 2017 test case) | PreToolUse | block MISSING_NOTES_PDF_EXISTS | block ✓ |
| Scoped edit, citation with notes but empty session transcript | PreToolUse | block NOTES_NOT_READ_IN_SESSION | block ✓ |
| Scoped edit, citation with neither PDF nor notes (Koszegi 2030 test case) | PreToolUse | block MISSING_NOTES_NO_PDF | block ✓ |
| Scoped edit, citation with escape hatch in delta | PreToolUse | allow | allow |
| Prose mention of Li 2017 in transcript, stop_hook_active=false | Stop | block | block ✓ |
| Prose mention of Li 2017 with escape hatch in same message | Stop | allow | allow |
| Prose mention, stop_hook_active=true (loop prevention) | Stop | allow | allow |

## Additional Design Decisions (late evening)

| Decision | Alternatives considered | Rationale |
|---|---|---|
| Session-scoped rather than persistent "read" evidence | Persistent flag that once a paper is read in ANY session, it's satisfied; reset on paper update | Session-scoped is the stronger discipline — matches the "don't work from cached context" principle. The original UJS failure was exactly the cached-context failure mode. Cost: re-touching notes at session start. Benefit: deterministic prevention. |
| Stop-hook block scoped to entire session prose, not last N messages | Stop-hook checks only the most recent assistant message | Citations in earlier messages that never got challenged should still surface. Cost: longer transcript scan; acceptable at 15s timeout. |
| Drop section-header matching for notes discovery | Keep section-header matching, add exclusion list for non-notes files | Section headers are not a reliable signal — conceptual memos and templates may mention papers in headers without being notes about them. `**Citation:**` metadata lines are a clean signal. Pre-existing compiled file uses them consistently. |
| Broaden "touched in session" to include Write/Edit, not just Read | Require only Read | Writing a notes file in-session is equivalent to having read it (same author knowledge). Forcing a Read after Write would be busywork. |
| Block MISSING_NOTES_NO_PDF instead of exiting green | Keep the "paper not in repo → can't enforce, allow" path | User directive: papers not yet in the repo should be blocking until added. Prevents citing papers that nobody has access to. Remediation message tells Claude to add the PDF first. |

## Additional Changes (late evening)

| File | Change | Reason |
|---|---|---|
| `.claude/hooks/primary_source_lib.py` (new) | Shared library — citation detection, notes resolution, transcript inspection, block-message building. Python module name with underscores (not dashes) to allow imports. | Eliminates duplication between the two hooks. |
| `.claude/hooks/primary-source-check.py` (rewritten) | Thin wrapper over the library. Pulls transcript_path from hook input. Uses `describe_missing_status` for each citation. | Refactor for new three-way logic. |
| `.claude/hooks/primary-source-audit.py` (new) | New Stop hook. Scans assistant prose in the transcript for citations. Blocks turn-end on un-grounded claims. Respects `stop_hook_active`. | Closes Gap 1 (prose claims outside tool calls). |
| `.claude/settings.json` | Audit hook registered in the Stop block alongside the existing log-reminder. | Enable the Stop audit. |
| `.claude/rules/primary-source-first.md` | Rewritten to describe the three failure modes, the dual-hook enforcement, the escape-hatch scope, and the `**Citation:**`-line-only matching rule. | Document the expanded design. |

<!-- primary-source-ok: li_2017, koszegi_2030, danz_vesterlund_wilson_2022 -->

## Open Questions / Blockers (updated)

- FRAMING-1 / TWEAK-1 / other tweaks: unchanged from earlier this session.
- **Backfill load.** With the strict session-scope rule, every session that makes framing claims must Read the compiled notes file (or dedicated per-paper files). This is mild discipline but worth flagging — Christina may want a one-line shortcut like "Read the compiled notes first thing in every session" as an habit.
- **Li 2017 and Koszegi 2030 references in this session.** Used as test-case labels, not framing claims. Escape-hatched at the top of this addendum block so the Stop audit does not block on them. If Li 2017 becomes a real citation in the paper, it needs its own reading-notes file (its PDF is already in `literature/papers/`).

<!-- primary-source-ok: li_2017, koszegi_2030, danz_vesterlund_wilson_2022 -->

## Addendum — Proposal C scoped out (2026-04-22 late evening)

Christina reviewed the deck's p-BDM pure-incentives section and concluded that Proposal C (parallel BDM + MPL pure-incentives test, N=600) is out of scope for this project. Reason: the paper's BIC test is for p-BDM; a full BIC test for MPL would require its own info/no-info + pure-incentives arm structure. That is a separate study, future work.

**Slide edits applied:**
- Former Frame 10 ("Proposal C: Example at θ = 0.2, MPL side") — removed entirely.
- Former Frame 11 ("Three ways to run the test") — retitled to "Two ways to run the test." Summary table trimmed to columns A and B (dropped MPL-side and N=600 column). Added footer line noting MPL pure-incentives as future work.
- Former Frame 12 ("Question 2: which proposal?") — retitled to "Question 2: A, B, or both?" Rewrote the discriminator analysis to contrast A vs. B directly: A strips the mechanism (tests EV-calc isolated); B preserves it (tests combined EV-calc + ambiguity + UJS-CR). A + B within-subject gives the sharpest contrast. Block question updated to offer "both within-subject" as the cleanest option.
- Deck recompiled clean. Now 14 pages (down from 15 with C dropped), 165 KB. Pre-existing chktex style warning at line 185 noted; not fixed (cosmetic only).

**ADR written:** `experiments/designs/decisions/0016_scope-pure-incentives-to-pbdm-only.md`. Decided. Does not supersede ADR-0011 — it resolves the "MPL counterpart" open dimension listed there by scoping it out. README index updated.

**Hook interaction.** The PreToolUse hook blocked the first Write of ADR-0016 because the delta cited DVW's 2022 AER paper and that PDF is not in the repo (only the 2024 JEP review is). Rewrote the ADR to cite DVW 2024 JEP for the BIC-framework description — which is correct anyway, since the 2024 JEP paper summarizes the framework. Exactly the hook's intended behavior: it caught a citation that was being used to ground a framing claim without the primary source being in the repo.

**What this changes for tomorrow's meeting:**
- Q2 becomes two proposals plus a "run both" option.
- No MPL pure-incentives prediction to discuss with Anujit.
- H2 identification is unchanged — tested at the belief-elicitation level by T1 vs. T2 in the main design.
- Meeting length unchanged; one slide fewer to walk through.

## Addendum — DVW 2022 integration structure verified; pure-incentives arm committed between-subject (late evening)

Christina asked: did DVW 2022 run the incentives-only test within- or between-subject with the main belief-elicitation treatments? Claude hadn't read the source before — only the 2024 JEP review summary. Read DVW 2022 Online Appendix §C.4 directly (pp. 45–48), which provides the verbatim methodology.

**Finding.** DVW 2022 attached the incentives-only module to a **separate study** (public-good provision), not to the main BSR study. The integration statement (p. 45 verbatim):

> These instructions were attached as module following a strategic study of public-good provision with two previous tasks.

Within the module, two θ values (0.3 and 0.2) — within-subject across θ, with one of the two choices randomly selected for payment. So DVW's structure is: **between-subject relative to the main belief-elicitation study; within-subject across 2 θ values** in the module.

Our Proposal A's working description ("within-subject, immediately after main BDM arm") was therefore a departure from strict DVW replication, not a replication. Flagged to Christina.

**Decision (committed by Christina 2026-04-22).** Match DVW on the integration axis: pure-incentives test is a **between-subject arm** relative to the main BDM/MPL arms. Within-subject variation across θ. The **exact θ set is left as an open design decision** (candidate: {0.2, 0.3} strict DVW replication; {0.2, 0.4, 0.6, 0.8} B&W 2018; other).

**Artifacts produced:**

- **New reading-notes file:** `master_supporting_docs/literature/reading_notes/danz_vesterlund_wilson_2022.md`. Captures the verbatim §C.4 instructions (Decision Task 3 Choices 1 and 2), the integration statement, Table A.1 and A.2 numerics from the online appendix, and a backfill TODO for when the main AER paper PDF is added to the repo.
- **ADR-0017** (Decided): "Pure-incentives test is between-subject (separate arm); θ variation is within-subject; θ values left open." Resolves two of ADR-0011's open dimensions; does not supersede.
- **Slide edit** (`04_slides.tex` Frame 11, "Two ways to run the test"): table row "Integration: within-subject" replaced with "Arm: separate (between-subject)" and "θ variation: within-subject; values TBD" replaces the concrete θ set. Other text unchanged. Recompiled clean, 14 pages.
- **ADR README** index updated.

**What this leaves open for Anujit:**

- A-vs-B choice (or run both within-subject) — unchanged from ADR-0016.
- Exact θ set — new open question post-ADR-0017. Candidate framings: strict DVW replication ({0.2, 0.3}) vs. θ-pattern design ({0.2, 0.4, 0.6, 0.8}).

**Hook interaction.** The PreToolUse hook allowed all three edits (slide, ADR, notes) because C&K 2025 notes had been touched this session and because I wrote the DVW 2022 notes file *first* before editing the ADR that cites it. Intended order-of-operations for primary-source-first compliance.

## Addendum — Slide 10 dropped; Q2 reframed away from DVW 69% anchor (late evening)

Christina flagged two concerns with the post-ADR-0017 deck state:

1. The "Two ways to run the test" summary table (post-ADR-0017 slide 10) duplicates what the Proposal A and Proposal B example slides already convey.
2. Q2 (slide 11) was still framed around "three competing accounts of the 69% result" — a construct Christina is not convinced by. The framing also over-anchored on the single DVW 2022 p-BDM result as the motivating puzzle, which makes the design sound derivative rather than diagnostic.

**Edits applied:**

- Removed the "Two ways to run the test" summary table slide entirely. Proposal A and Proposal B example slides stand on their own; the integration and sample-structure details from ADR-0017 are now carried verbally rather than in a table.
- Rewrote Q2 (slide 11). Dropped the three-accounts enumeration (EV-calc failure / ambiguity aversion / UJS). Dropped the "69% result" reference. Reframed around the general pure-incentives-test diagnostic: "The pure-incentives test diagnoses BIC failure by asking whether subjects identify the payoff-maximizer with beliefs stripped from the task." Kept the A-vs-B-vs-both structure as the design choice and inlined the between-subject/within-subject θ structure from ADR-0017.

Deck now 13 pages (down from 14). Recompiled clean.

**Residual 69% anchors not touched this edit** (flagged to Christina for possible follow-up):

- Literature slide still reads "69% of subjects pick q=0 under p-BDM at induced θ=0.2."
- p-BDM pure-incentives setup slide still reads "DVW report one p-BDM pure incentive test result: 69% of subjects pick q=0 at θ=0.2."

If the broader goal is to frame as general pure-incentives-test failure rather than "replicate/explain the 69%," those two slides may also warrant revision. Not done this turn; awaiting Christina's call.

**2026-04-22 follow-up.** Christina confirmed: keep the 69% references on the Literature slide and the p-BDM setup slide — they are *references* to the cited literature, not anchors for the project's framing. Do not edit those slides. No further action on them.

## Addendum — Three-accounts trichotomy retired (ADR-0018)

After the Q2 reframe, Christina asked Claude to justify the "three competing accounts" framing (EV-calculation failure / ambiguity aversion or non-EU / UJS-CR) that had been used in prior materials to motivate Proposals A/B/C. Claude's honest analysis:

- The accounts overlap. UJS (per C&K 2025) formalizes which CR paths justify each action; "EV-calculation failure" is plausibly a sub-case of CR failure. Treating them as competing is not theoretically supported.
- "Ambiguity aversion" at known θ is misapplied. Under induced θ with a concrete urn, the event bet's probability is stated; classical Ellsberg-style ambiguity requires unknown probabilities.
- The trichotomy was reverse-engineered to justify Proposals A/B/C. When Proposal C was dropped (ADR-0016), the discrimination logic collapsed — a tell that the trichotomy was scaffolding, not theory.
- A pure-incentives failure IS the BIC failure by construction (DVW 2022 Condition 2). Decomposing "why" into competing psychological accounts is secondary analysis, not a structural requirement of the test.

**Decision captured as ADR-0018:** retire the three-accounts framing. When comparing proposal designs, describe them in terms of *how much of the p-BDM mechanism remains visible to the subject* (design-level decomposition), not in terms of which psychological account each discriminates.

**Artifacts produced this turn:**

- **ADR-0018** (Decided, Research framing scope). README index updated.
- **Retirement note** added to `01_p-bdm-design-space-synthesis.md` §7 header, pointing to ADR-0018. Section body preserved below the note as historical context (append-only spirit for reasoning docs that informed committed decisions).
- **Feedback memory** `feedback_no_post_hoc_trichotomies.md` added to project memory (indexed in `MEMORY.md`). Captures the methodological lesson: don't construct "N competing accounts" enumerations to motivate design decisions when the accounts aren't theoretically derived. Paired with `project_ujs_is_cr_formalization.md`, which covers the specific UJS-vs-CR non-separation that made account (3) and (1) overlap.

**Reasoning preserved** across three artifacts: ADR-0018 (decision record), feedback memory (generalizable lesson), synthesis doc §7 retirement note (historical pointer for anyone who reads the prior reasoning). Cross-references threaded through all three.

**No slide edits required** — the deck's Q2 had already been rewritten without the trichotomy earlier this session. The ADR formalizes that rewrite as a project-level framing decision rather than a one-off slide edit.

## Addendum — MPL format committed: coarse separated (ADR-0019)

Christina raised a substantive concern about two-stage list formats (Holt-Smith §7.2 and, by extension, Trautmann–van de Kuilen §7.3 and two-stage separated §7.7): the **MS/Stage-2 dilemma**. Stage 2's probability range depends on Stage 1's single crossing, so Stage-1 multi-switching has no clean resolution. Three response options each have distinct costs: force SS in Stage 1 (censors MS behavior, contra ADR-0008), pick an arbitrary crossing rule (breaks IC), or skip Stage 2 for MS subjects (asymmetric rounds, precision lost on informative subjects). Stage-2 MS within ~1pp spacing is uninterpretable on its own. This is a structural property of any two-stage design — not list-specific.

Christina also flagged that coarse separated is the **belief analog of C&K 2025's UJS-E mechanism**. Verified against my earlier read of C&K §1 (p. 4): UJS-E is a decreasing clock-price MPL with random-period termination. Mapping to our belief MPL: UJS-E item (fixed \$1.00) → event bet (wins if event); decreasing clock-price → r-lottery; random-period termination + subject gets that period's choice → random-row payment. Same game structure per the characterization theorem (UJS binary-allocation mechanisms are generalized MPLs, §3 of their paper). Presentation differences (C&K descending-order clock; ours random-order static list) are implementation choices; UJS holds in both.

**Artifacts produced:**

- **`mpl_format_decision_analysis.md` updated:**
    - §7.2: added MS/Stage-2 dilemma, verdict changed from "practical but inherits IC concerns" to "ruled out."
    - §7.3: noted the same dilemma applies, verdict to "ruled out."
    - §7.5: added UJS-E belief-analog mapping with structural correspondence.
    - §7.7: noted the dilemma is structural (not list-specific), verdict from "probably worth it" to "ruled out."
    - §11: changed from "Tentative Recommendation" to "Recommendation (decided 2026-04-22)"; added UJS-E grounding and cross-reference to ADR-0019.
- **ADR-0019** (Decided, Methodology). Commits to coarse separated with full reasoning: UJS-E analog as positive theoretical anchor; two-stage formats ruled out via MS/Stage-2 dilemma; full list ruled out by B&H ROCL; full separated ruled out by 100-row burden. README index updated; "MPL format selection" Pending decision marked as resolved in the README.
- **Slide edits:**
    - Frame "MPL format: options and tradeoffs" — tradeoff footer rewritten to flag the MS/Stage-2 dilemma explicitly (previously said "two-stage variants trade extra screens for finer precision," which hid the structural problem).
    - Frame "Question 3: MPL format" — opening line changed from "We are leaning toward" to committed; added UJS-E analog rationale; added a second block question asking Anujit to validate the two-stage-ruling-out reasoning.
    - Deck now 13 pages, compiles clean.

**What's open for Anujit tomorrow on Q3:**
1. Does the B&H belief-transfer hold cleanly enough to commit (existing question), or do we need the auxiliary B&H-transfer arm?
2. Does the MS/Stage-2 ruling-out reasoning hold (new question)?

## Addendum — ADR-0019 superseded by ADR-0020; MPL format re-opened

Within a few hours of committing ADR-0019, Christina surfaced a concern that re-opened the decision: coarse separated gives 5pp precision, which works for our BIC test but does not constitute a general-purpose format recommendation for belief elicitation when precision is required. Locking in the decision forces us either to narrow our paper's contribution to "a format that works at 5pp" or to defend 5pp as always sufficient (hard to defend for applications needing point-belief recovery at higher precision).

Cleaner: defer to Anujit. He has the strongest prior on (a) whether the MS/Stage-2 dilemma is actually fatal for two-stage formats, (b) whether there is a format we have not considered, (c) how the precision-vs-interpretability tradeoff should be presented in a format recommendation.

**Per the append-only ADR rule, ADR-0019 cannot be demoted in place. Instead:**

- **ADR-0020** (Decided) supersedes ADR-0019. Withdraws the commitment; restores the "MPL format selection" Pending decision in the README. ADR-0019's body (MS/Stage-2 dilemma argument, UJS-E belief-analog mapping, ruling-out reasoning) stands as analysis and will be cited by the post-meeting ADR that re-commits to a format.
- **ADR-0019 Status** changed from Decided → Superseded by #0020. Body untouched.
- **ADR README** — index updated (0019 shown as superseded); "MPL format selection" restored to the Pending-decisions list with a note describing the working lean.
- **`mpl_format_decision_analysis.md`** — §11 reverted from "Recommendation (decided)" to "Recommendation (working lean; awaiting Anujit)". §7.5 verdict reverted from "adopted" to "working lean, not committed."
- **Slide deck** — Q3 rewritten again. Opens with "Working lean: coarse separated..." rather than "We commit to coarse separated." Both open questions remain — the precision-vs-interpretability tradeoff (new; asks Anujit for his MPL-format view) and the B&H belief-transfer question (existing).

**Net effect for tomorrow's meeting.** Q3 is now genuinely an open advisor question. Anujit's answer determines whether a post-meeting ADR re-commits to coarse separated (citing ADR-0019's analysis), commits to an alternative he surfaces, or leaves the format as a hedged recommendation in the paper.

**Methodological note for the record.** ADR-0019 → ADR-0020 supersession within the same day may look like thrashing, but the append-only ADR structure handles it cleanly: the analysis is preserved, the commitment is withdrawn, and the next commitment will cite both as context. Preferable to either (a) editing ADR-0019 in place (forbidden by the append-only rule) or (b) pretending the commitment did not happen.

## Addendum — MS/Stage-2 dilemma promoted to its own slide; slide 11 bulletized

Two final deck refinements this session:

1. **MS/Stage-2 dilemma on its own slide.** Christina asked to break the dilemma discussion out of the options-and-tradeoffs table footnote into a dedicated slide. Done: new slide "Two-stage formats: the MS/Stage-2 dilemma" sits between the options table and Q3, covering the three response options (force SS censors; crossing rule breaks IC; skip-Stage-2 is asymmetric) with bulleted formatting for easier verbal walk-through. Q3's own recap of the dilemma is removed since it now has its own slide.

2. **Slide 11 ("MPL format: the problem") bulletized.** The slide previously read as a dense paragraph covering ROCL, monotonicity, Segal's theorem, and Azrieli's IC result in one flow. Rewritten as a four-step enumerate showing the causal chain that breaks IC in list format, then a single paragraph explaining how separated format breaks step 1. Empirical result moved to a small-font footnote at the bottom. Logic is now visible step-by-step; Anujit can push on any link.

**Segal 1990 handling.** The four-step chain cites Segal 1990 for the "ROCL + non-EU → monotonicity violation" theorem. The paper's PDF is not in `literature/papers/` and there are no reading notes for it; Segal is referenced as a theoretical result rather than as a paper whose content we engage with. Escape-hatched via a LaTeX comment `% <!-- primary-source-ok: segal_1990 -->` at the top of the frame — invisible in the PDF, readable by the hook. Future work: if we want to engage with Segal's paper in the manuscript, add the PDF and produce notes.

**Deck state:** 14 pages, compiles clean.

## Addendum — Slide 11 opening tightened; B&H empirical footnote removed

Christina iterated on slide 11 further:
- Opening sentence tightened to "Brown and Healy (2018): MPL is theoretically IC, but presentation format determines whether it holds in practice." This names the theory-vs-practice distinction explicitly, which is the whole point of the chain that follows. Replaces the earlier "presentation format matters for IC" (which Christina flagged as too vague) and the still-earlier "determines whether IC survives subjects' behavior" (odd phrasing).
- B&H empirical footnote (list p = 0.041 / separated p = 0.697) removed — Anujit is familiar with the result. Trimming reduces slide density without losing substance.

Four-step chain preserved verbatim; separated-format Fix line preserved. Deck stable at 14 pages, compiles clean.

## Addendum — Christina simplified slides 12/13/14; added slide 4 (Theoretical IC); ADR-0021 (late evening)

Christina ran a sweep across the MPL format slides to strip AI patterns:

- **Slide 4 (new):** "Theoretical IC: 2 Approaches" — Karni (2009) dominance + prob sophistication; Azrieli et al. (2018) monotonicity. Adds structure before the Hypotheses slide. I added a one-line note that Azrieli's monotonicity is strictly weaker — the minimal sufficient assumption for IC — per the same scoping as ADR-0012.
- **Slide 12:** opening sentence and footnote removed; "IC defense / Weak / Strong" column replaced with "ROCL concern / Yes / No"; Precision column added (1pp / 5pp) to make the coarse-separated trade-off visible in the table.
- **Slide 13:** title changed to "Multiple Switching dilemma"; three-bullet structure tightened. Added a one-line footnote noting the dilemma applies to both two-stage list and two-stage separated.
- **Slide 14:** simplified to Proposal + Pro/Con + a single broad block question ("How to approach MPL format choice?"). B&H belief-transfer question dropped — Christina noted that the event bet is not genuinely subjective in a ball-and-urn setup with stated composition.

**ADR-0021 (Decided, IC foundation)** formalizes the ball-and-urn reasoning. In our setup, the event bet's probability is stated objectively via urn composition — Ellsberg-style ambiguity requires unknown probabilities, which our setup doesn't have. The within-row ambiguity channel raised in `mpl_format_decision_analysis.md` §6.3 therefore does not apply to our design. The only B&H transfer question that remains is the cross-row ROCL path, already addressed by separated format (ADR-0015). Narrows ADR-0005's live concern; retires §6.3 as a design constraint for this project. Scoped to ball-and-urn setups — a future project with subjective beliefs (self-performance, real-world events) would need to revisit.

Deck now 15 pages, compiles clean.

## End-of-session Summary (2026-04-22 late evening)

### Headline

Meeting with Anujit originally scheduled 2026-04-17 moved to 2026-04-23. Today's session ran deep: started as a slide review, surfaced the UJS-vs-CR conflation error in derivative docs, led to building enforceable primary-source-first infrastructure, then iterated through four MPL-format design decisions and a full simplification pass on the advisor deck. Six ADRs were written today (0016–0021, with 0019 superseded by 0020). The deck ended at 15 pages.

### What the deck looks like now (commit `dbe679d`)

| # | Slide | Purpose |
|---|---|---|
| 1 | Title | — |
| 2 | Literature | DVW (69% at θ=0.2) + C&K (UJS) intro |
| 3 | Research questions and contribution | RQs + contribution |
| 4 | **Theoretical IC: 2 Approaches** (new today) | Karni dominance + prob sophistication; Azrieli et al. monotonicity (strictly weaker) |
| 5 | Hypotheses | H1(a,b), H2, H3 |
| 6 | Experimental design | 5-arm table + within-subject note |
| 7 | Q1: overall design | Gate question |
| 8 | p-BDM pure-incentives test (H1b) | Setup + EV math |
| 9 | Proposal A example | Menu hidden |
| 10 | Proposal B example | Native framing |
| 11 | Q2: A, B, or both? | Advisor question |
| 12 | MPL format: the problem | Four-step IC-breaking chain (bulletized) |
| 13 | MPL format: options and tradeoffs | 5-option table with ROCL concern / Precision columns |
| 14 | Two-stage formats: the Multiple Switching dilemma | Three response options, each with a distinct cost |
| 15 | Q3: MPL format | Proposal + Pro/Con + open advisor question |

### ADRs written today

1. **ADR-0016** (Experimental design): scope the pure-incentives test to p-BDM only; MPL-side pure-incentives test is future work. Resolves the "MPL counterpart" open dimension in ADR-0011.
2. **ADR-0017** (Experimental design): pure-incentives test is a between-subject arm relative to main BDM; θ varies within-subject; exact θ values open. Matches DVW 2022's methodology (verified against Online Appendix §C.4). Resolves two more of ADR-0011's open dimensions.
3. **ADR-0018** (Research framing): retire the "three competing accounts" trichotomy (EV-calc / ambiguity / UJS-CR) for pure-incentives failure. The trichotomy was reverse-engineered from the A/B/C design space; when C was dropped, it collapsed. A pure-incentives failure *is* the BIC failure per DVW's Condition 2. Paired feedback memory `feedback_no_post_hoc_trichotomies.md`.
4. **ADR-0019** (Methodology, brief-lived): commit to coarse separated MPL format based on MS/Stage-2 dilemma + UJS-E belief-analog arguments. **Superseded by 0020 the same day.**
5. **ADR-0020** (Methodology, supersedes 0019): re-open MPL format as Pending. Coarse separated remains working lean; 5pp precision doesn't generalize as a recommendation; defer to Anujit on Q3.
6. **ADR-0021** (IC foundation): ball-and-urn probabilities are objective, not Ellsberg-ambiguous. Narrows ADR-0005: within-row ambiguity channel from MPL analysis §6.3 does not apply to our design. The only B&H transfer concern remaining is cross-row ROCL, blocked by ADR-0015's separated format. Scoped to ball-and-urn setups.

### Framing corrections propagated

Two substantive framing errors were corrected today and memorialized to prevent recurrence:

- **UJS is a CR formalization, not a distinct framework.** C&K 2025 defines UJS *through* contingent-reasoning paths. Error had propagated through ADR-0013, the 2026-04-20 identification analysis, and the 2026-04-22 initial slide review because Claude had never read `Chakraborty_Kendall_2025_UJS_elicitation.pdf` (or the existing compiled notes at `bdm_bic_2026-03.md#9`). Corrected via `project_ujs_is_cr_formalization.md` (project memory); Q1 CR-vs-UJS bullet dropped from deck; derivative docs audited (`01_p-bdm-design-space-synthesis.md` line 71 fixed; 2026-04-20 session log addendum added).
- **Three-accounts trichotomy for pure-incentives failure was reverse-engineered.** Retired via ADR-0018; methodological lesson captured in `feedback_no_post_hoc_trichotomies.md`.

### Infrastructure built

Primary-source-first enforcement, in response to the UJS-CR propagation failure:

- **Rule:** `.claude/rules/primary-source-first.md` states the principle and the reading-notes contract.
- **PreToolUse hook:** `.claude/hooks/primary-source-check.py` blocks edits to load-bearing files (ADRs, paper main.tex, advisor materials, session logs, plans, analysis memos) when cited papers lack reading-notes evidence. Three failure modes: notes missing + PDF in repo; notes missing + no PDF (add PDF first); notes exist but not touched in session.
- **Stop audit hook:** `.claude/hooks/primary-source-audit.py` scans assistant prose in the transcript at turn-end. Catches citations in chat text that never went through a tool call.
- **Shared library:** `.claude/hooks/primary_source_lib.py` (citation detection, notes resolution, session-transcript inspection, block-message construction).
- **Reading-notes README:** `master_supporting_docs/literature/reading_notes/README.md` defines the canonical structure with a required "What this paper is NOT claiming" section designed to prevent the UJS-class failure mode.
- **First dedicated notes file:** `chakraborty_kendall_2025.md` with verbatim definitions and five anticipated misreadings.
- **Second dedicated notes file:** `danz_vesterlund_wilson_2022.md` written after Christina asked about DVW's integration structure; captures verbatim §C.4 instructions from the Online Appendix and Table A.1/A.2 numerics.

Two bugs surfaced during hook testing and fixed:
- PDF filename match was failing on underscore-separated names because `_` is a regex word character (defeats `\b`); replaced with tokenization on non-alphanumeric.
- Notes-match false-positived on README / mechanism_taxonomy headers mentioning papers in section titles; tightened to require `**Citation:**` metadata lines.
- Audit hook wasn't seeing escape hatches placed inside tool-use inputs (e.g., in an Edit's `new_string`); extended to scan tool_use input string fields.

### Simplifications (by Christina) accepted

Christina ran a sweep across the MPL-format slides to strip AI patterns:

- Opening sentences on slides 12 and others shortened or removed.
- "IC defense / Weak / Strong" replaced with "ROCL concern / Yes / No" (clearer and matches the vocabulary of slide 12's four-step chain).
- Slide 13 title changed to "Multiple Switching dilemma"; three-bullet structure tightened.
- Slide 14 reduced to Proposal + Pro/Con + single broad block question.
- B&H belief-transfer question dropped (formalized by ADR-0021).
- Rule-of-three framings removed from multiple slides.

### Open items for Anujit tomorrow

1. **Q1 (overall design)** — is anything missing? design sufficient for H1–H3? easy/hard manipulation enough for H3?
2. **Q2 (pure-incentives test)** — A, B, or both? (or something else?)
3. **Q3 (MPL format)** — working lean is coarse separated. Pro: works for our BIC test at 5pp. Con: does not generalize to precision-sensitive belief elicitation. How to approach the MPL format choice?

Open design parameters still pending:
- θ values for pure-incentives test (2 values {0.2, 0.3} strict DVW vs. 4 values {0.2, 0.4, 0.6, 0.8} B&W vs. other) — ADR-0017.
- MPL format selection (coarse separated working lean vs. alternatives Anujit may surface) — ADR-0020.

### Git state at session close

- **bdm_bic:** main at `dbe679d` (local only, push pending). Commit chain today: 967f6a5, f427b72, de1bdcc, db11eec, b5a23aa, e801677, 5f4f238, 87339e8, ba2bd14, 3a10972, 0eb2c17, e4d91b5, 3a42e58, dbe679d (14 commits).
- **claude-config:** main at `74c88f6` (pushed). Three memory-sync commits today: 85c5cba, 9b7aabb, 74c88f6.

### Decisions to capture after the meeting

- Anujit's answers to Q1/Q2/Q3 become ADRs. Q2 → pure-incentives-test-design ADR (A / B / both / something else). Q3 → post-meeting MPL-format ADR (re-commit to coarse separated on Anujit's endorsement, or to an alternative he surfaces).
- Hypothesis-renumber drift in `mpl_format_decision_analysis.md` §4.3 and `01_p-bdm-design-space-synthesis.md` §4 — old H3 references (CR) should be updated to reflect current hypothesis numbering (H3 = complexity; H2 carries the UJS-via-CR claim). Not urgent.
- §6.3 of MPL analysis doc retired as design concern per ADR-0021 but remains unedited (could add a retirement note if desired).

## Cross-References

- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` — the deck being reviewed
- `quality_reports/advisor_meeting_2026-04-17/04_slides.pdf` — compiled output (15 pages)
- `quality_reports/advisor_meeting_2026-04-17/05_slide-review_2026-04-22.md` — the deep review memo written this session
- `quality_reports/advisor_meeting_2026-04-17/02_questions-for-anujit.md` — question tiering used to cross-check deck against meeting agenda
- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` — p-BDM design-space memo; basis for frames 7–12
- `quality_reports/session_logs/2026-04-20_slide-revisions-and-hypothesis-restructure.md` — prior session log (hypothesis restructure + Proposal B/C slide additions)
- `experiments/designs/decisions/0013_ujs-scoped-to-behavioral-failure.md` — UJS behavioral-failure framework (H2 anchor)
- `experiments/designs/decisions/0015_bh-rocl-triggering-canonical-mechanism.md` — canonical ROCL framing used in frame 13
- `experiments/designs/decisions/0011_p-bdm-incentive-only-design-from-scratch.md` — motivation for the three proposals in frames 7–12
