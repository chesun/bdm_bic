# Audit: UJS-as-distinct-from-CR claims in derivative docs

**Date:** 2026-04-22
**Auditor:** Claude
**Scope:** The four docs flagged in `project_ujs_is_cr_formalization.md` as candidates for propagated UJS-as-distinct-from-CR errors, post the 2026-04-22 discovery that C&K 2025 defines UJS *through* contingent reasoning ("UJS takes a novel approach to eliminating the need for contingent reasoning," abstract and §1).

**Method:** Read each doc end-to-end, flag every UJS-framing claim, check against the C&K 2025 definitions in `chakraborty_kendall_2025.md` (verbatim quotes). For each flagged passage, classify as: OK, AMBIGUOUS, WRONG. Propose corrections for WRONG passages.

---

## 1. ADR-0013 — `experiments/designs/decisions/0013_ujs-scoped-to-behavioral-failure.md`

### Findings

**Status: mostly clean; one stale hypothesis reference; no UJS-CR errors that need supersession.**

| Location | Text | Classification | Comment |
|---|---|---|---|
| Line 16 | "Azrieli explains *why the mechanism should work* and UJS explains *why subjects cannot find the strategy that works*" | OK | "why subjects cannot find the strategy" IS the CR framing. UJS formalizes that. Correct. |
| Line 18 | "BDM is not UJS — many non-truthful reports remain justifiable at each report. MPL *is* UJS — truth-telling is uniquely justifiable per row." | OK | This is the C&K definition. Correct. |
| Line 36 | "Commits us to: framing H3 in UJS language..." | STALE | Was written 2026-04-15, pre-renumber. The claim refers to what is now H2. Not a UJS error; just a hypothesis-number drift. |
| Line 36 | "Error patterns should show diffuse deviation, not coherent alternative-game-form shading." | OK | "Diffuse deviation" is the CR-failure prediction (many justifiable actions → subjects scatter across them). Consistent. |
| Line 41 | "here is the behavioral refinement (UJS) — it is not satisfied by p-BDM — which predicts the observed failure" | OK | Presents UJS as a *refinement* of the IC story (explains behavior within the IC frame). Doesn't claim UJS is distinct from CR. |

### Action

No supersession needed. The ADR framing survives the C&K definition check.

**One cleanup recommended:** Line 36 refers to "H3" but the 2026-04-20 renumber demoted the old H3 (contingent reasoning) to H2a and then collapsed it into H2. The ADR should cite "H2" or explicitly note "the hypothesis about mechanism-level UJS." This is a minor hypothesis-number drift, not a substantive error. Either write ADR-0016 fixing the reference, or leave as-is with a header note acknowledging the renumber — ADRs are append-only, so in-place edits are limited to the Status line.

---

## 2. MPL format decision analysis — `quality_reports/mpl_format_decision_analysis.md`

### Findings

**Status: mostly clean; one minor wording issue in §4 that conflates ROCL with "not contingent reasoning"; does not affect H2 framing.**

| Location | Text | Classification | Comment |
|---|---|---|---|
| §3 (lines 38–104) | Acts vs. outcomes, mechanism invariance, ROCL-triggering, acts-vs-outcomes exposition | OK | Aligns with ADR-0015. Uses ROCL-triggering as the B&H mechanism, not "strategy-space restriction." Does not make UJS-as-distinct claims. |
| §4.1 line 114 | "If the subject has a coherent belief π and follows the UJS-justifiable action at each row, the response pattern is monotonic" | OK | "UJS-justifiable action at each row" is C&K's own language — the uniquely justifiable action in UJS. Correct. |
| §4.3 mechanism (a), line 133 | "Not evidence for H3; this is a different bottleneck" | OK | Within-row non-monotonicity (ambiguity aversion, comprehension) is genuinely a different channel from cross-row ROCL and from UJS/CR. Fine. |
| §4.3 mechanism (b), line 134 | "Not H3; this is about cognitive triggering of ROCL, not about contingent reasoning" | AMBIGUOUS | ROCL *is* a form of cross-row CR in the UJS sense — subjects aggregating across rows are applying CR to the compound structure. The line reads as if ROCL and CR are alternative cognitive operations. Proposed reword: "Not H3 (complexity); this is about cognitive triggering of ROCL, which is a specific cross-row application of contingent reasoning that UJS/separated format suppresses by decomposing the elicitation." But the line's substantive implication — that H3 (complexity) is not what this is about — is still correct. |
| §4.3 mechanism (d), line 136 | "*Is* a flavor of H3 (contingent reasoning persists even when format decomposes)" | AMBIGUOUS | Written pre-renumber — H3 at the time was the CR hypothesis, now it's the complexity hypothesis. The substantive observation ("subjects attempting to aggregate even in separated format") is still valid. Just the H3 reference is stale. |
| §4.4, line 144 | "identify the UJS-justifiable action at each row" | OK | |
| §12.1 line 423 | DVW 2022 "weak conditions" terminology | OK | DVW terminology properly adopted. |

### Action

**Optional cleanup** on line 134: clarify that ROCL is a form of CR, not an alternative. This is refinement, not correction — the substantive argument (that ROCL-driven monotonicity violation is a cross-row failure, distinct from the within-row comprehension failure of mechanism (a) and from the complexity-interaction claim of H3) is sound.

**Hypothesis renumber drift:** mentions of H3 in §4.3 mechanisms (b) and (d) were written when H3 was the CR hypothesis. Post-renumber, H3 is task complexity and H2 is the UJS claim. Fix: replace "Not H3" with "Not H3 (complexity); the CR angle is now folded into H2." One or two sentences.

---

## 3. p-BDM design-space synthesis — `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md`

### Findings

**Status: CONTAINS THE ERROR. Line 71 explicitly calls UJS "a mechanism-level property," and lines 70/85/89 treat CR as a thing separable from UJS. Needs correction.**

| Location | Text | Classification | Comment |
|---|---|---|---|
| §2 line 30 | "This is exactly the UJS-consistent story (C&K 2025, ADR-0013): the mechanism demands that subjects pick an option whose payoff is contingent on an uncertain event, but the event-independent option is always *one of* the justifiable-sounding choices." | OK | Describes UJS failure at the justifiable-action level — consistent with C&K. |
| §4 Proposal A line 70 | "Does not test contingent reasoning specifically — only pure choice. So a pass on this test doesn't rule out that H3 (contingent reasoning failure) drives the H1 result; it just rules out EV-calculation failure as the story." | STALE + AMBIGUOUS | References old H3 (CR) which no longer exists. The substantive point (Proposal A tests EV-calculation specifically, not CR) is correct. |
| §4 Proposal A line 71 | "Because the mechanism is stripped, it doesn't speak directly to UJS (which is a mechanism-level property)." | **WRONG** | This is the central error. UJS is not "a mechanism-level property" independent of CR — it is a formalization of which CR paths can justify non-dominant actions. Strip the mechanism and you strip the CR demand that UJS formalizes. The correct statement: "Because the mechanism is stripped, the CR demand that UJS formalizes is absent; A tests EV-calc only." |
| §4 Proposal B line 85 | "Can subjects identify the maximizer when the mechanism is fully explained and they must reason contingently across the r-space?" | OK | Reasoning contingently across r-space IS the CR demand that UJS formalizes. Correct. |
| §4 Proposal B line 88 | "Directly tests the UJS prediction: if subjects fail even with θ known, it's because the mechanism doesn't make the dominant strategy obviously justifiable (ADR-0013)." | OK | |
| §4 Proposal B line 89 | "The comparison 'pass A but fail B' (if we also ran A) would isolate contingent reasoning as the specific failure channel — textbook UJS." | OK, actually | "Contingent reasoning" and "textbook UJS" are being EQUATED here, which is the C&K-correct framing. |
| §4 Proposal C line 110 | "the gap between p-BDM and MPL on the pure-incentives metric directly tests the UJS prediction (MPL has a unique justifiable choice per row; p-BDM does not)" | OK | |
| §5.4 line 268 | "That's the UJS mechanism at its purest: the *format*, not the belief task, is what drives BDM's failure." | AMBIGUOUS | "Format drives failure" is shorthand for "format determines whether the UJS/CR demand is present." Safer phrasing: "the mechanism's justifiable-action structure, not the belief task, drives the failure." Optional polish. |
| §7 line 288 | Competing account 3 UJS: "failure correlates with within-subject confusion about which action is justifiable, not with arithmetic ability" | OK | Contrasts CR-in-justifiable-action-structure with EV-calculation. Correct. |

### Action

**One clear correction needed** on line 71. Proposed rewrite:

Before:
> Because the mechanism is stripped, it doesn't speak directly to UJS (which is a mechanism-level property).

After:
> Because the mechanism is stripped, the contingent-reasoning demand that UJS formalizes is absent in A; A tests EV-calculation specifically, not the UJS-style failure.

**Two stale hypothesis references** (lines 70 and 138 — old H3 as CR hypothesis) — either explicitly note the renumber or rephrase. The doc pre-dates the 2026-04-20 H collapse.

**One optional polish** on line 268 (§5.4) for "format, not the belief task" shorthand.

---

## 4. Session log — `quality_reports/session_logs/2026-04-20_slide-revisions-and-hypothesis-restructure.md`

### Findings

**Status: CONTAINS THE SEED OF THE ERROR. The `[LEARN:theory]` block explicitly claims UJS and CR are distinct. This is where the framing I propagated originated.**

| Location | Text | Classification | Comment |
|---|---|---|---|
| `[LEARN:theory]` line 66 | "UJS (C&K 2025) and contingent reasoning (cognitive-psych construct) are distinct — UJS is a formal property of mechanisms (unique vs. multiple justifiable actions), CR is a cognitive capacity (ability to reason through if-then chains across contingencies). A mechanism can fail UJS without CR being the cognitive bottleneck; CR can fail subjects without the mechanism failing UJS. Conflating them muddles identification." | **WRONG** | The literal opposite of what C&K 2025 claims. C&K define UJS *through* CR paths: a strategy is uniquely justifiable iff no alternative CR path can rationalize a non-dominant action. UJS does not operate "on mechanisms" independent of CR — it captures exactly when the CR burden yields a unique answer. |
| `[LEARN:design]` line 64 | "e.g., 'UJS formal property' rather than 'cognitive CR'" | **WRONG** | Treats UJS-formal-property and CR as alternatives. Same category error as the [LEARN:theory] note. |
| Sequence-of-events item 9 line 19 | "Offered three paths: (a) reframe H2a around UJS formal property; (b) triangulate CR via H1b + mediators + moderator analysis; (c) add direct-manipulation arm." | WRONG | Path (a) and paths (b)/(c) are not alternatives — there is no independent "CR" channel to triangulate, separate from UJS, per C&K. The three-paths framing was built on the false dichotomy. |
| Design Decisions row 1 | "The 4-arm design manipulates at least 6 things simultaneously between p-BDM and MPL (output format, task framing, per-decision complexity, presentation, UJS property, CR demand)." | WRONG | "UJS property" and "CR demand" are the same thing in C&K's framework; listing them as two confounds is double-counting. Actual confound list is 5, not 6. |
| Design Decisions row 2 | Rationale for collapsing H2+H2a | PARTIALLY WRONG | Says "MPL > BDM because of the UJS property" — correct wording, but the reasoning that led there (UJS and CR are distinct) is wrong. The H2 collapse is still the right move for a different reason: H2 and H2a were saying the same thing, both formalizing the same CR-via-justifiable-actions claim at different verbal grains. |

### Action

Session logs are append-only. Fix: add a dated addendum at the bottom of this session log, cross-referencing `project_ujs_is_cr_formalization.md`. Text: "2026-04-22 correction: the LEARN:theory note above and the 'UJS property' vs. 'CR demand' separation in the Design Decisions table are wrong. C&K 2025 defines UJS through CR paths — they are not independent concepts. See `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` and `~/.claude/projects/.../memory/project_ujs_is_cr_formalization.md`. The H2 collapse and the Q1 CR-vs-UJS framing question that came out of this session are re-examined in the 2026-04-22 session log; the H2 collapse survives the correction, the Q1 framing bullet has been dropped."

---

## Summary table

| Doc | UJS-CR error? | Action |
|---|---|---|
| ADR-0013 | No | No action needed. Minor: hypothesis-number drift (pre-renumber references). |
| `mpl_format_decision_analysis.md` | Minor (§4.3 line 134, ROCL-vs-CR wording) | Optional: clarify ROCL is a form of CR. Fix H3 → H2 reference drift. |
| `01_p-bdm-design-space-synthesis.md` | **Yes** (line 71) | Required: rewrite the "UJS is a mechanism-level property" sentence. Optional: stale H3 refs, line 268 shorthand. |
| `2026-04-20 session log` | **Yes** (LEARN:theory, LEARN:design, Design Decisions row 1, Sequence item 9) | Required: append correction addendum citing C&K and the new project memory. |

---

## What this does NOT change

- **H2 phrasing.** "MPL admits a unique justifiable action per row (UJS) while BDM admits many" is the C&K definition. H2 is correct.
- **ADR-0013's decision.** UJS is the primary behavioral-failure framework. That decision survives.
- **The 2026-04-22 slide edit.** Dropping the Q1 CR-vs-UJS bullet was correct — they aren't alternatives.
- **The identification-analysis conclusion** (p-BDM → MPL changes multiple things at once). The count shifts from six to five confounds (UJS and CR collapse), but the conclusion that the design identifies a joint effect is still right.

## What this DOES change

- **`01_p-bdm-design-space-synthesis.md` line 71** — one sentence rewrite.
- **Session log LEARN:theory block** — corrected via addendum.
- **Future sessions** — the project memory `project_ujs_is_cr_formalization.md` and the enforcement hooks prevent this from re-occurring.

## Recommendation

Apply the two required fixes (design-space synthesis line 71; session log addendum). Skip the optional cleanups for now — they are wording refinements, not framing errors. Advisor meeting is tomorrow; the deck is unaffected by these audit findings (the deck's H2 phrasing is correct per C&K, and the Q1 CR-vs-UJS bullet is already dropped).

Total edit scope: 2 small edits, both straightforward.
