# Session Log: 2026-04-15 — ADR Decision Log Scaffolding

**Status:** COMPLETED

## Objective

Centralize substantive design and research decisions into an append-only ADR (Architecture Decision Record) log, backfill entries from three weeks of scattered records (session logs, analysis docs, commit history), and wire the ADR process into the project's workflow via a new rule file and CLAUDE.md pointers. Following user review of the initial 11 entries, split ADR-0004 into a dedicated IC-foundation ADR (Azrieli monotonicity) and a behavioral-theory ADR (UJS).

## Changes Made

| File | Change | Reason | Quality Score |
|------|--------|--------|---|
| `experiments/designs/decisions/README.md` | Created. Format spec, append-only rules, Decision-components taxonomy, numbered index of all 13 ADRs, Pending-decisions list. | Single source of truth for *what* was decided; pairs with analysis docs that hold the *why*. | N/A (draft) |
| `experiments/designs/decisions/0001` – `0011` | Created. 11 ADRs backfilled from `research_ideas_bdm_bic.md`, `research_direction_discussion_2026-04-07.md`, `mpl_format_decision_analysis.md`, session logs, and git history. | Log starts complete so future-Christina is not re-litigating. Partial-context entries explicitly flagged (0005, 0006, 0011). | N/A |
| `experiments/designs/decisions/0012_azrieli-monotonicity-ic-foundation.md` | Created. Scope: IC foundation. Names ACH 2018 monotonicity as minimal sufficient IC assumption; Healy & Leo 2025 as refinement. | Christina flagged that ADR-0004's "primary theoretical framework" was too broad; IC foundation and behavioral theory are distinct components. | N/A |
| `experiments/designs/decisions/0013_ujs-scoped-to-behavioral-failure.md` | Created. Scope: Behavioral theory. Supersedes #0004. Scopes UJS (C&K 2025) + Tsakas (2019) to behavioral failure story only. | Demonstrates the supersession protocol; preserves substantive reasoning while narrowing claim. | N/A |
| `experiments/designs/decisions/0004_adopt-ujs-framework.md` | Edited status: `Decided` → `Superseded by #0013`. Added supersession banner. Body intact. | Append-only rule: only permissible edit on a Decided entry is the Status field. | N/A |
| `experiments/designs/decisions/README.md` | Added Scope field to template; new "Decision components" section (5 categories: Research framing, IC foundation, Behavioral theory, Experimental design, Methodology); index now shows Scope column for all 13 entries with retro-tags for 0001–0011. | Christina asked to separate IC foundation from behavioral failure theory as different decision components; made the structural distinction visible log-wide. | N/A |
| `.claude/rules/decision-log.md` | Created. Workflow rule: when to write an ADR, required and recommended fields, supersession protocol, cross-references to session-logging.md and research-journal.md, enforcement check. Added Scope field as recommended during today's second pass. | Codifies the ADR process so it survives across sessions; prevents drift back to scattered decision records. | N/A |
| `CLAUDE.md` | Added `Log decisions` to Core Principles (points at `.claude/rules/decision-log.md`); added `decisions/` subdirectory to Folder Structure tree. | Every session now loads the pointer to the log. | N/A |
| `TODO.md` | Active: added ADR review task; reframed MPL-format-decision task to reference already-captured criteria 1–3 (ADR-0008, 0009). Done: added today's scaffolding and the 0004 split. | Reflect new state of the decision stack. | N/A |

## Design Decisions

| Decision | Alternatives Considered | Rationale |
|----------|------------------------|-----------|
| ADR log location: `experiments/designs/decisions/` | `quality_reports/decisions/`; project root; dedicated `adr/` folder | Matches CLAUDE.md folder convention (experiment design lives under `experiments/designs/`). |
| Split ADR-0004 into 0012 (IC foundation) + 0013 (behavioral theory) rather than edit 0004 in place | Edit 0004 in place since it was backfilled today | Demonstrates the supersession protocol in action and sets a precedent that even same-day backfills follow append-only rules. Supersession is the only way Decided entries evolve. |
| Add Scope as a *recommended* field, not required | Required on all ADRs; no Scope field; tag-based (multiple scopes per entry) | Some decisions genuinely cut across components; forcing a single Scope would distort those. Recommended + "write two ADRs if entangled" (worked example: 0012+0013) handles the common case cleanly. |
| Azrieli (2018) monotonicity as IC foundation; Healy & Leo (2025) as refinement | Karni (2009) EU; ROCL; UJS | Azrieli is the lightest sufficient assumption. Avoids confounding "IC assumption fails" with "subjects have non-EU preferences." |
| Reconstructed-partial-context flag on 0005, 0006, 0011 | Treat all 11 as authoritative | Future-you needs to know which entries have full reasoning traceable to source docs vs. retrofitted framing. Keeps the log honest. |

## Incremental Work Log

- Session start: Christina asked to review progress and get oriented; summarized state (MPL Section 10 criteria 1–3 done, p-BDM design open, TvdK 2015 next read, Section 10 criteria 4–7 still open).
- Christina flagged that decisions are scattered across session logs, analysis docs, and commits — no centralized record. Proposed ADR-style log (append-only, numbered, supersede don't edit).
- Reverse-engineered 11 ADR candidates from prior records via Explore agent; catalog produced with full-context vs. partial-context flags.
- Entered plan mode; plan saved to `~/.claude/plans/parsed-tickling-whisper.md`; approved.
- Scaffolded `experiments/designs/decisions/` with README + 11 ADRs + new rule file; updated CLAUDE.md and TODO.md.
- Christina questioned ADR-0004's "primary theoretical framework" wording — raised distinction between IC foundation (where Azrieli 2018 is the lightweight framework) and behavioral failure (where UJS is the right framework).
- Wrote ADR-0012 (Azrieli IC foundation) and ADR-0013 (UJS scoped to behavioral failure, supersedes 0004). Marked 0004 Superseded with banner. Updated README with Scope field, Decision-components section, and index. Updated decision-log.md rule to name Scope as recommended field.

## Learnings & Corrections

- [LEARN:process] ADR-style decision log works well for research projects with scattered reasoning across session logs and analysis docs. The critical discipline is the append-only rule: editing a Decided entry breaks the traceability even for "small" clarifications. Supersession is the only legitimate evolution path, and demonstrating it same-day (0004 → 0013) sets the precedent firmly.
- [LEARN:theory] The paper has two distinct theoretical jobs: (a) IC foundation — under what assumption is the mechanism IC? (Azrieli monotonicity, lightweight); (b) behavioral failure — why do subjects fail in practice even when (a) holds? (UJS). These need separate framings in the paper and separate ADRs in the log.
- [LEARN:correction] Earlier ADR-0004 framing ("primary theoretical framework") conflated the two jobs. Scope field + Decision-components taxonomy prevents this conflation going forward.
- [LEARN:framework] Azrieli, Chambers & Healy (2018) monotonicity is the minimal sufficient condition for p-BDM's IC; does not require EU, ROCL, or probabilistic sophistication. Healy & Leo (2025) T-statewise monotonicity is a further refinement tailored to lottery-based elicitation. Both stay inside the Azrieli framework.
- [LEARN:design] "When two decision components are entangled, write two ADRs" is now a stated convention in the decision-log rule, with 0012+0013 as the worked example.

## Verification Results

| Check | Result | Status |
|-------|--------|--------|
| 13 ADR files present in `experiments/designs/decisions/` plus README | All 14 files present; line counts: 624 lines across initial 12, +180 lines for 0012/0013/README updates | PASS |
| README index matches actual files, shows correct status (Decided / Proposed / Superseded) | All 13 entries indexed; 0004 shows `Superseded by #0013`; 0005/0006/0011 show Proposed | PASS |
| ADR-0004 body preserved with supersession banner; Status line updated | Banner present; body intact; only Status field modified | PASS |
| `.claude/rules/decision-log.md` references the README template | References `experiments/designs/decisions/README.md`; lists required and recommended fields | PASS |
| CLAUDE.md Core Principles includes `Log decisions` pointer | Present | PASS |
| CLAUDE.md Folder Structure shows `decisions/` subdirectory | Present | PASS |
| TODO.md Active includes ADR review task; Done logs today's work | Present | PASS |
| Partial-context entries explicitly flagged with Reconstructed banner | 0005, 0006, 0011 all have banners | PASS |

## Open Questions / Blockers

- [ ] Christina's review of the three Proposed/Reconstructed entries (0005, 0006, 0011) — whether any should be demoted to pending-decisions or reframed
- [ ] Whether the retro-tagged Scopes on 0001–0011 are correct (especially 0007 tagged IC foundation — it sits near the line between IC foundation and methodology)
- [ ] Section 10 criteria 4–7 of `mpl_format_decision_analysis.md` (B&H auxiliary arm, revise screen, burden budget, precision) — still unresolved; each will produce one or more new ADRs when decided

## Post-Commit Work (Same Session)

After the initial commit (`c495116`), Christina raised two issues during ADR review:

### ADR-0004 scope too broad: "primary theoretical framework" conflated IC foundation with behavioral theory

- Resolved by writing ADR-0012 (Azrieli monotonicity as IC foundation) and ADR-0013 (UJS scoped to behavioral failure). 0004 marked `Superseded by #0013`. Added Scope field to template with five-category taxonomy. Committed as `c495116`.

### ADRs 0005 and 0007 committed to separated-format MPL — but that decision was never made

- Christina flagged: she did not decide on separated lists. Checked source: 2026-04-13 session log says "Tentative format: coarse separated" — explicitly tentative. I had promoted this tentative lean into format commitments in ADR-0005 and ADR-0007.
- Audit of all 11 backfilled ADRs found: two definite overreaches (0005, 0007), two minor forward-looking wordings (0001, 0009 — flagged, not changed).
- Fixes: superseded 0007 with ADR-0014 (framing-only, format commitment removed); edited 0005 in place (Proposed, direct edit permitted).
- README Pending decisions now lists all seven format options as open.
- Wrote `quality_reports/strategy_space_restriction_intuition.md` — conceptual deep-dive on why separated format restricts the strategy space (13 sections, worked example, five loopholes, open questions). For Christina to interrogate tomorrow.

## Learnings & Corrections (Addendum)

- [LEARN:process] Backfilling ADRs from session logs risks promoting *tentative preferences* into *committed decisions*. The word "tentative" in a session log Design Decisions table means "under consideration" — NOT "decided." Always verify the exact status markers.
- [LEARN:process] "Commits us to X" in an ADR Consequences section is a strong claim. If the source says "tentative" or "leaning," the ADR should say "implication for the pending X decision" — not "commits us to X."
- [LEARN:theory] The strategy-space restriction argument for separated format is about *feasible sets*, not *preferences*. The honest defense: "it prevents the IC assumption's violation from expressing in observable behavior." NOT: "it makes the IC assumption hold."

## Next Steps

- [ ] Christina reviews strategy-space deep-dive (`quality_reports/strategy_space_restriction_intuition.md`)
- [ ] Commit to MPL format selection across all seven options in §7 of MPL analysis doc — this is the biggest pending design decision
- [ ] Resolve Section 10 criteria 4–7 (B&H auxiliary, revise screen, burden budget, precision); each narrows the format space and produces an ADR
- [ ] Design the p-BDM incentive-only test from scratch (ADR-0011)
- [ ] Read Trautmann & van de Kuilen (2015, *EJ*) — informs §7.3 format option
