# Session Log: 2026-04-20 — Advisor Slide Revisions and Hypothesis Restructure

**Status:** COMPLETED

## Objective

Refine the advisor-meeting slide deck (`quality_reports/advisor_meeting_2026-04-17/04_slides.tex`) in a series of targeted iterations. Two threads ran through the session: (1) presentation refinement — strip AI language, reorganize sections for natural flow, add concrete example slides; (2) substantive refinement — restructure the hypothesis set to honestly reflect what the design identifies, collapsing the contingent-reasoning claim into a UJS-formal-property claim and flagging the alternative framing as an open question for Anujit.

## Sequence of Events

1. **Strip implementation details / AI patterns (two rounds).** User asked for a leaner deck showing only literature, framing, contribution, hypotheses, design, questions-to-ask. First pass removed ADR references, internal process language ("committed," "locked," "retired"), theory-stack taxonomy, meta-commentary. Second pass scrubbed residual AI patterns: overhyping adjectives ("sharpest," "vindicated"), labelized transitions ("The test reduces to," "How each proposal discriminates"), rule-of-three bolded headers, fragment-bullet style.
2. **Add Proposal B and Proposal C example slides.** User asked for concrete implementation mockups for the two p-BDM pure-incentives-test proposals beyond A. Added two slides between the existing Proposal A example and the three-way summary table: Proposal B shows native p-BDM framing with the 11-option menu, Proposal C shows the MPL side (one row at a time with event bet vs. r-lottery, row set r ∈ {0.05, 0.1, ..., 1.0}, correct crossing at θ).
3. **Add note to Proposal A example for parallel structure.** User asked for a contingent-reasoning-demand note on Proposal A matching the notes on B and C. Added: "Mechanism and q values hidden. Subject compares event-contingent payoff pairs directly — no contingent reasoning across r is required."
4. **Move Brown & Healy discussion to MPL format section.** User noted the B&H literature entry on the Literature slide duplicated content in Q3 where it actually motivates the choice. Removed the B&H paragraph from Literature; Q3 was already self-contained with full B&H discussion.
5. **Restructure Q3 for natural flow.** User asked for literature → why we need to choose → options → tradeoffs ordering. Single "Question 3: MPL format" slide split into three: (i) "MPL format: what the literature says" — B&H mechanism and empirical result; (ii) "MPL format: options and tradeoffs" — why MPL arm is H2 backbone, 5-option comparison table (full list / two-stage list / full separated / coarse separated / two-stage separated) across screens × IC defense × burden, plus tradeoff summary; (iii) "Question 3: MPL format" — lean to coarse separated plus the belief-transfer open question.
6. **Review user's hypothesis revision.** User had restructured hypotheses independently: demoted the old H3 (contingent reasoning) to H2a under H2, renumbered the old H4 (complexity interaction) to H3. Reviewed: flagged H2a's ambiguous antecedent ("the failure" — which?), same-indent visual nesting (H2a read as a fourth main claim), and the slightly clipped "per UJS" phrasing. Proposed three mechanical edits plus a meta-question about whether H2a's mechanism claim should be more directly identified.
7. **Apply three H2a edits.** Tightened antecedent to "The gap is driven by BDM's simultaneous contingent reasoning demand (UJS)." Nested H2a under H2 inside an `itemize` block mirroring H1a/H1b. Replaced "per UJS" with "(UJS)" as bare parenthetical.
8. **Substantive identification concern raised by user.** User observed that moving from single-report p-BDM to MPL is not a clean manipulation — it changes output format, task framing, per-decision complexity, presentation, UJS formal property, and contingent reasoning demand *simultaneously*. Therefore H2a's cognitive claim (contingent reasoning specifically drives the gap) is not identified.
9. **Identification discussion.** Enumerated what differs between p-BDM and MPL, explained what the design *does* identify (the UJS formal-property difference; joint effect of the 6 confounds). Offered three paths: (a) reframe H2a around UJS formal property; (b) triangulate CR via H1b + mediators + moderator analysis; (c) add direct-manipulation arm. Empirical priors: Brown et al. 2025 found CBC comprehension intervention didn't help value BDM; Burfurd & Wilkening 2022 found no mechanism × cognitive-ability interaction. Recommended (a) as honest about what the design identifies.
10. **Collapse H2 + H2a into UJS framing and flag CR-vs-UJS question.** User picked option (a). Collapsed H2a into H2: "Belief MPL achieves better behavioral IC than single-report BDM, despite theoretical equivalence, because MPL admits a unique justifiable action per row (UJS) while BDM admits many." Added a new bullet to Q1 flagging the CR-vs-UJS choice as a meta-question for Anujit.

## Changes Made

| File | Change | Reason |
|------|--------|--------|
| `04_slides.tex` | Full rewrite 1 (strip implementation details). Removed ADR references, internal process labels, theory-stack taxonomy, meta-commentary. Kept literature, framing, hypotheses, design, questions. | User wanted Anujit-facing deck, not internal artifact. |
| `04_slides.tex` | Full rewrite 2 (strip AI patterns). Removed overhyping adjectives, labelized transitions, rule-of-three header structures, fragment-bullet style. | User requested natural academic voice. |
| `04_slides.tex` | New slide "Proposal B: Example at θ = 0.2". Urn setup + native p-BDM mechanism described to subject + footer noting contingent reasoning demand preserved. | Concrete implementation example for Proposal B (native framing). |
| `04_slides.tex` | New slide "Proposal C: Example at θ = 0.2 (MPL side)". Noted p-BDM side matches A, showed one MPL binary-choice row (event bet vs. 40% lottery at P(red)=0.2), row set r ∈ {0.05, ..., 1.0}, prediction that MPL pass rate ≫ p-BDM pass rate → format-level UJS isolated from belief formation. | Concrete MPL-side implementation for Proposal C (parallel mechanism test). |
| `04_slides.tex` | Appended CR-demand note to Proposal A example slide: "Mechanism and q values hidden. Subject compares event-contingent payoff pairs directly — no contingent reasoning across r is required." | User asked for a parallel note so the contingent-reasoning-demand contrast is visible across all three proposals. Confirmed Proposal A does *not* preserve CR demand. |
| `04_slides.tex` | Removed B&H paragraph from Literature slide. | B&H discussion was duplicated on Q3 slide where it actually motivates the format choice. Q3 was already self-contained. |
| `04_slides.tex` | Split old single "Question 3: MPL format" frame into three frames: (a) "MPL format: what the literature says" (B&H mechanism + empirical result), (b) "MPL format: options and tradeoffs" (motivation + 5-option table + tradeoff summary), (c) "Question 3: MPL format" (lean + belief-transfer question). | User asked for natural flow: literature → why choose → options → tradeoffs → lean + question. Three slides made the chain legible. |
| `04_slides.tex` | H2a edits: tightened antecedent, nested H2a inside itemize under H2, replaced "per UJS" with "(UJS)". | Three mechanical readability fixes flagged during hypothesis review. |
| `04_slides.tex` | Collapsed H2 + H2a into single H2 claim framed around UJS formal property: "Belief MPL achieves better behavioral IC than single-report BDM, despite theoretical equivalence, because MPL admits a unique justifiable action per row (UJS) while BDM admits many." Removed H2a entirely. | User chose option (a) — the design identifies the UJS formal-property difference, not a cognitive CR channel. The collapsed H2 matches what's identified. |
| `04_slides.tex` | Q1 updated: removed the "(Not sure about H2a)" parenthetical; added new bullet flagging UJS-vs-CR framing question for Anujit. | H2a no longer exists; the CR-vs-UJS question is now the relevant meta-question. |
| `04_slides.pdf` | Recompiled after each edit (two-pass for outlines). Now 15 pages. | Verified compile. |

## Design Decisions

| Decision | Alternatives Considered | Rationale |
|---|---|---|
| Frame H2's mechanism claim around the UJS formal property (multiple-vs-unique justifiable actions), not contingent reasoning | Keep H2a as a cognitive CR claim; add a direct-manipulation arm to identify CR; expand mediator analysis | The 4-arm design manipulates at least 6 things simultaneously between p-BDM and MPL (output format, task framing, per-decision complexity, presentation, UJS property, CR demand). The design identifies the *joint* effect, not CR specifically. UJS-as-formal-property is what the design actually identifies. Empirical priors on CR identification are pessimistic (Brown et al. 2025; Burfurd & Wilkening 2022). Reframing is honest and doesn't weaken the paper's contribution — UJS is C&K 2025's central formal claim. |
| Collapse H2 + H2a into one claim rather than keep H2a as sub-hypothesis | Keep H2a as sub-hypothesis citing UJS; merge H2 into H2a | Once H2a is reframed around UJS-formal-property rather than CR-cognitive-channel, H2 and H2a collapse to the same claim (MPL > BDM because of the UJS property). A single H2 is cleaner than a main + sub-hypothesis restating the same thing. |
| Flag CR-vs-UJS framing as an open question for Anujit rather than silently committing to UJS | Silently commit; commit to CR and add a direct-manipulation arm; commit to UJS with a mediator-analysis section | Anujit authored UJS (C&K 2025). He has the strongest prior on whether the design's UJS identification is sufficient for the paper's mechanism claim, or whether CR needs separate identification. This is exactly the kind of judgment call to raise with him rather than pre-decide. |
| Split Q3 into three slides (literature, options/tradeoffs, lean + question) rather than keep as one | Keep as single slide with tighter text; split into two slides | User requested a natural flow (literature → motivation → options → tradeoffs → lean + question). Three slides give each beat room; one dense slide buries the logic. Deck length went from 13 to 15 pages — still short. |
| Add a Proposal A CR-demand note parallel to B and C | Leave Proposal A without the note; add notes to B and C only | The absence of CR demand in A is load-bearing for interpreting the three-way comparison — A tests pure EV-calculation, B tests contingent reasoning with belief stripped, C tests format-level UJS. Without the Proposal A note, Anujit might misread A as also testing CR. |

## Incremental Work Log

- Session start: user requested strip of implementation details and AI patterns. First pass removed ADR references, internal process language, theory-stack taxonomy, meta-commentary.
- User requested a second strip pass targeting AI language patterns specifically. Removed overhyping adjectives, labelized transitions, rule-of-three headers, fragment-bullet style. Voice became more natural academic.
- User asked for two new example slides covering Proposals B and C. Drafted Proposal B (native p-BDM framing, subject reasons through contingencies) and Proposal C (MPL-side with binary-choice rows). Inserted both between Proposal A example and the summary table.
- User noted Proposal A should have a parallel CR-demand note since B and C have one. Confirmed Proposal A hides the mechanism and thus does not preserve CR demand. Appended note.
- User asked to move B&H literature discussion to Q3 since it motivates the format choice. Removed B&H entry from Literature slide; confirmed Q3 was self-contained.
- User asked to make Q3 flow more naturally (literature → why choose → choices → tradeoffs). Split single Q3 frame into three frames with the requested beat structure.
- User revised the hypotheses independently: demoted old H3 (CR) to H2a, renumbered old H4 (complexity) to H3. Asked for review.
- Reviewed hypothesis restructure. Flagged ambiguous H2a antecedent, same-indent nesting issue, "per UJS" phrasing. Proposed three edits and flagged the deeper identification question.
- User raised the identification concern explicitly: p-BDM → MPL changes more than just CR demand. Asked for honest analysis.
- Provided identification analysis: six confounds enumerated, three paths forward (reframe around UJS / triangulate / add arm), recommended reframe.
- User chose reframe. Collapsed H2 + H2a into single UJS-framed claim. Added UJS-vs-CR meta-question to Q1 bullet list. Updated SmPL format section wasn't affected.

## Learnings & Corrections

- **[LEARN:design]** In manipulation-heavy comparisons (like p-BDM vs. MPL), it is easy to overclaim what the design identifies. If the manipulation changes N things simultaneously, the comparison identifies the *joint* effect of the N things, not any single one. Picking which of the N things gets the causal credit requires either (a) additional manipulations holding N-1 fixed, (b) triangulating via process/mediator data, or (c) framing the claim at a level that genuinely matches the comparison (e.g., "UJS formal property" rather than "cognitive CR").
- **[LEARN:process]** When a mechanism claim can be framed at multiple levels (formal property vs. cognitive construct), prefer the framing that matches what the design identifies. A weaker but honest claim is defensible; a stronger but unidentified claim invites referee pushback.
- **[LEARN:theory]** UJS (C&K 2025) and contingent reasoning (cognitive-psych construct) are distinct — UJS is a formal property of mechanisms (unique vs. multiple justifiable actions), CR is a cognitive capacity (ability to reason through if-then chains across contingencies). A mechanism can fail UJS without CR being the cognitive bottleneck; CR can fail subjects without the mechanism failing UJS. Conflating them muddles identification.
- **[LEARN:process]** Advisor meeting slides should be scrubbed of internal artifacts (ADR references, decision-log shorthand, process labels like "committed/locked") before sharing. These are for the authoring team, not the reader.
- **[LEARN:style]** AI language patterns to watch for in prose slides: (i) overhyping adjectives ("sharpest," "vindicated," "load-bearing"), (ii) labelized transitions ("The test reduces to," "How each proposal discriminates"), (iii) rule-of-three bolded headers, (iv) fragment-bullet style with periods, (v) meta-commentary ("if something's broken here, later decisions change anyway"). Stripping these produces a more natural academic voice.

## Verification Results

| Check | Result | Status |
|---|---|---|
| `04_slides.tex` compiles under pdflatex (two-pass for outlines) | 15 pages, 169 KB | PASS |
| Hypothesis structure matches collapsed form: H1 (a, b), H2, H3 | Verified by reading lines 49–59 | PASS |
| H2 incorporates UJS formal-property claim | Verified by reading line 56 | PASS |
| Q1 includes the UJS-vs-CR meta-question bullet | Verified by reading the new bullet in Q1 | PASS |
| Three-part Q3 structure present: literature → options → question | Verified by grep of frame titles | PASS |
| Proposal A, B, C example slides each have a CR-demand note | Verified by reading footer of each | PASS |
| Literature slide no longer has B&H entry; B&H lives in Q3 first slide | Verified by grep | PASS |
| No ADR references in slides | Verified by grep | PASS |
| No "committed / locked / retired" internal process language | Verified by grep | PASS |
| Aux files cleaned after compile | Only `.tex` and `.pdf` remain | PASS |

## Open Questions / Blockers

- **UJS vs. CR framing.** Flagged as Q1 bullet for Anujit. Decision depends on his judgment about whether the paper's mechanism claim needs direct CR identification or whether the UJS formal-property claim is sufficient for the contribution.
- **H3 identification (task complexity).** Not directly addressed this session. The within-subject easy/hard manipulation is flagged as a Q1 bullet; needs more careful thought about whether the easy/hard contrast is strong enough to identify a complexity × mechanism interaction at reasonable N.
- **Proposal choice for H1b.** Still open — A, B, or C. The concrete example slides now make the differences visible; Q2 asks Anujit directly.
- **Format choice.** Tentative coarse separated; Q3 asks whether the B&H transfer holds for beliefs or needs an auxiliary arm.

## Next Steps

- Debrief with Anujit (if meeting already happened): capture his answers to Q1 (overall design + UJS-vs-CR), Q2 (p-BDM proposal), Q3 (format) in a follow-up session log and convert his commitments into ADRs.
- Write ADRs for the hypothesis restructure (collapsed H2 + H2a → UJS-framed H2; renumbered H4 → H3) — these are substantive design decisions that belong in the append-only log.
- If Anujit supports the UJS framing: update the paper draft's theory section to lead with UJS formal property as the identification claim.
- If Anujit wants CR directly identified: design a CR-manipulation arm (p-BDM with scenario walkthrough) and add to the design; acknowledge Brown et al. 2025 pessimistic prior.
- Revisit H3 (complexity interaction) identification — does the within-subject easy/hard give enough power to detect a differential format effect?

## Cross-References

- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` — the deck being revised
- `quality_reports/advisor_meeting_2026-04-17/04_slides.pdf` — compiled output (15 pages)
- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` — fuller design memo; the concrete example slides mirror its §5
- `quality_reports/session_logs/2026-04-17_rocl-canonical-framing-correction.md` — prior session log including initial meeting prep and the ROCL framing correction
- `experiments/designs/decisions/0013_ujs-scoped-to-behavioral-failure.md` — current UJS-as-behavioral-framework ADR (may need update based on H2 collapse)
- Chakraborty & Kendall (2025) — UJS framework (Anujit is the "C")
- Brown, Healy (2018) — format × IC finding
- Brown et al. (2025) — CBC comprehension-intervention null result (cited as empirical prior against direct CR identification)
- Burfurd & Wilkening (2022) — no mechanism × ability interaction (cited as empirical prior)
