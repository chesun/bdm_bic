# Session Log: 2026-04-14 — MPL Format Decision Analysis (Continued)

**Status:** COMPLETED

## Objective

Continue from April 13 session. Work through Section 10 decision criteria of `mpl_format_decision_analysis.md`. Resolve terminology issues flagged while reading Azrieli et al. (2018). Capture design-relevant findings from Burfurd & Wilkening (2018) and Chakraborty & Kendall (2025).

## Changes Made

| File | Change | Reason | Quality Score |
|------|--------|--------|---|
| `quality_reports/mpl_format_decision_analysis.md` | Section 2 trilemma table: split into 4 format columns (Full list / H&S two-stage LIST / Full separated / Coarse separated); split burden into cognitive (# choices) and navigation (# screens) dimensions | Christina's caveat: full 100-row list is one screen but 100 choices — burden is not low just because screen count is | N/A (draft) |
| `quality_reports/mpl_format_decision_analysis.md` | Renamed 7.2 "Holt & Smith LC" → "Holt & Smith two-stage LIST"; 7.7 → "Two-stage SEPARATED" | Distinguish which format family each two-stage variant belongs to; avoid conflating | N/A |
| `quality_reports/mpl_format_decision_analysis.md` | Section 7.3 renamed and expanded to credit Trautmann & van de Kuilen (2015, *EJ*) as the origin of the TK two-stage list format; B&W 2018 adapted it | Christina's catch: B&W 2018 cite TvdK as the source of their TK treatment format | N/A |
| `quality_reports/mpl_format_decision_analysis.md` | Added new Section 7.8 "Instruction format is a separable decision" — captures B&W finding that HH (Hao-Houser) is easiest/fastest instruction format (850s vs 1089s HS vs 1212s TK) | Instruction format and presentation format are orthogonal; HH should be paired with whatever presentation format we choose | N/A |
| `quality_reports/mpl_format_decision_analysis.md` | Section 10 criterion 1 reframed from "what rate invalidates H2?" to positive, C&K-2025-style descriptive outcome reporting | Christina: do not set ex ante threshold; treat multi-switching as a rate to measure, following C&K 2025 (29.7% attentive, 43.7% full sample) | N/A |
| `quality_reports/mpl_format_decision_analysis.md` | Section 4 title changed from "Central Diagnostic Problem" to "A Descriptive Outcome, Not a Threat"; added framing note about C&K 2025 precedent | Align framing throughout the doc with the new positive stance | N/A |
| `quality_reports/mpl_format_decision_analysis.md` | Section 11: removed "insurance against >25% multi-switching rate" from "what this does not give us"; replaced with pointer to new framing | Consistency with Section 4 and Section 10 updates | N/A |
| `TODO.md` | Added TvdK (2015, *EJ*, "Belief Elicitation: A Horse Race among Truth Serums") as Up Next read | TvdK is origin of the TK format we're actively evaluating in Section 7.3; paper already in library | N/A |

## Design Decisions

| Decision | Alternatives Considered | Rationale |
|----------|------------------------|-----------|
| Locked in Section 10 criterion 1: report multi-switching as descriptive outcome (positive), not invalidation threshold (normative) | Ex ante threshold (e.g., >25% = H2 invalidated) | C&K 2025 precedent; lets H2 be tested on multiple margins; avoids arbitrary pre-commitment |
| Use HH-style instructions regardless of presentation format | HS (formal case enumeration) or TK (bundled with two-stage list) | B&W 2018: HH is significantly faster (850s vs 1089-1212s) with no accuracy cost; B&W's own recommendation |
| Separate cognitive burden (# choices) from navigation burden (# screens) in the trilemma table | Single "burden" row | Full list is low navigation, high cognitive — single-column framing hid this |

## Incremental Work Log

- Christina flagged: Section 2 trilemma table oversimplified burden. Split into two dimensions.
- Christina asked clarification on "Holt & Smith LC" vs. "two-stage synchronized LC" — confirmed H&S LC is two-stage list. Renamed 7.2 and 7.7 to make list/separated distinction visible.
- Read Azrieli et al. definition of monotonic extension more carefully with Christina. Initial response called f, g "acts" loosely; user pushed back noting P(X) is the "space of possible payments." Clarified: P(X) is lotteries in general decision theory, but Azrieli models random payment as an act, so f, g are acts in Azrieli's setup. Original "acts" framing confirmed correct.
- Christina noted: B&W 2018 adapts TK format from Trautmann & van de Kuilen (2015). Updated Section 7.3 and added TvdK to TODO.
- Christina noted: B&W 2018 finds HH instructions are easiest/fastest. Added Section 7.8 (instruction format as separable orthogonal decision).
- Christina on Section 10 criterion 1: reframe to positive outcome reporting, following C&K 2025 (who report 29.7% / 43.7% multi-switching rates alongside rational-behavior rates). Applied throughout (criterion 1, Section 4 title/framing note, Section 11 tentative recommendation).

## Learnings & Corrections

- [LEARN:theory] Azrieli et al. (2018) model random payment as an act, so f, g in Definition 2 are acts (functions from states to outcomes). The space P(X) in their setup is the space of possible payments = acts. General decision theory uses P(X) for lotteries; Azrieli's framing is the Savage act framing.
- [LEARN:theory] Monotonic extension in Azrieli et al.: if f ⊒ g (statewise dominance relative to primitive ≽ on X), then f ≽* g on the extended preference over acts. This is a restriction on HOW ≽ on outcomes lifts to ≽* on acts, not a restriction on outcome-preferences themselves.
- [LEARN:design] Multi-switching should be treated as a descriptive outcome (positive framing), not an ex ante threshold for H2 invalidation (normative framing). C&K 2025 establishes the precedent: report the rate alongside the main mechanism comparison.
- [LEARN:design] Instruction format (HS / HH / TK) is orthogonal to presentation format (list / separated). HH is the default recommendation from B&W 2018 — same accuracy, ~22% faster than HS. Any presentation format we pick should use HH-style instructions with a comprehension quiz.
- [LEARN:history] The two-stage list format used by Burfurd & Wilkening 2018 ("TK") originates in Trautmann & van de Kuilen (2015). The Holt & Smith (2016) LC is a structurally similar two-stage list but a distinct implementation.

## Verification Results

| Check | Result | Status |
|-------|--------|--------|
| Section 7 subsections in correct numerical order (7.1 → 7.8) | After initial ordering error (7.8 before 7.7), fixed with swap edit | PASS |
| Cross-references updated after renumbering in Section 2 | Section 2 references Section 10; criterion 2 references Section 5; Open Items reference 7.6, 7.7, Section 8 | PASS |
| TODO.md last-updated timestamp | Updated to 2026-04-14 | PASS |

## End-of-Day Extension (2026-04-14 continued)

Additional work after initial log entry:

- Christina flagged that the previous criterion 1 framing incorrectly implied a BDM analog for multi-switching exists. Separated comparable margin (H2 test on % within ε) from MPL-internal outcomes (multi-switching as descriptive rate, with focal/boundary reports as BDM-internal parallel-in-spirit diagnostic).
- Flagged repeated BDM elicitations as Section 12 Open Item #6 (placement options: in-main vs. post-main diagnostic; decision deferred).
- Criterion 2 (accuracy metric) resolved — subsumed by criterion 1 framing. Section 5 effectively superseded.
- Criterion 3 (ε) resolved — adopt Danz et al. 2022's dual-metric approach: false reports (ε = 0, any deviation) AND distant reports (ε = 5pp). Both reported in parallel.
- Christina queried what Danz et al. did for the p-BDM incentive-only test. JEP re-read: detailed methodology shown for BSR (Table 1, 11-option menu); for p-BDM, only headline result (69% choose q = 0) and θ = 0.2 info/no-info comparison. Full methodology gap.
- Deep web search for DVW's forthcoming WP "The Pure-Incentives Test: Applications to Proper Scoring Rules, Auctions, and Matching Markets" — confirmed it exists (Danz's WIP page) but no public draft, no slides, no abstract, no trace across SSRN/NBER/RePEc/author websites/Healy & Leo chapter.
- Drafted email to David Danz asking for preliminary draft (shortened to remove project-description commitments per Christina's concern that project is half-baked). Christina scheduled email for 2026-04-15 morning.
- Added new Section 12 to analysis doc: "Related Design Note: p-BDM Incentive-Only Test" — records what JEP says / doesn't say, why the 69% finding matters, and design questions for our own p-BDM incentive-only test.
- Added TODO Up Next item: "Design the p-BDM incentive-only test from scratch" — subsumes the Condition 2 operationalization (Point 6 of April 7 discussion).

## Open Questions / Blockers

- [ ] Section 10 criteria 4-7 still need Christina's commitment (B&H auxiliary, revise screen, burden budget, precision)
- [ ] TvdK (2015) not yet read — would inform Section 7.3 details
- [ ] p-BDM incentive-only test design (new Up Next item)
- [ ] Danz email reply — will inform whether methodology is shared or we design from scratch

## Next Steps

- [ ] Send Danz email 2026-04-15 morning
- [ ] Continue working through Section 10 criteria 4-7
- [ ] Begin p-BDM incentive-only test design
- [ ] Read TvdK (2015) when time permits
- [ ] CS Comments for papers 3, 4, 5, 7, 9, 11, 12
