# 0019: MPL format is coarse separated (15–20 rows, one per screen, random order)

- **Date:** 2026-04-22
- **Status:** Superseded by #0020
- **Scope:** Methodology
- **Data quality:** Full context

## Context

ADR-0011 / ADR-0014 / ADR-0015 established the theoretical framing for the MPL format decision (Brown & Healy ROCL-triggering mechanism; mechanism invariance as the identifying assumption) but left the actual format selection as a Pending decision in the ADR README. The format-option landscape was analyzed in `quality_reports/mpl_format_decision_analysis.md` §7.1–§7.7, with a tentative lean toward 7.5 (coarse separated) recorded in §11 but never committed.

On 2026-04-22, Christina surfaced a concern about two-stage list formats (§7.2 Holt-Smith, and by extension §7.3 Trautmann–van de Kuilen and §7.7 two-stage separated) that had not been explicit in the prior analysis: the **MS/Stage-2 dilemma**. Any two-stage design that narrows the Stage-2 probability range based on Stage-1 behavior requires a clean single crossing in Stage 1 to implement Stage 2. This creates a structural tradeoff with no clean resolution:

- Force single-switching in Stage 1 → censors MS behavior (which per ADR-0008 is a primary descriptive outcome, benchmarked against C&K 2025's 29.7–43.7% rates) and silently pushes MS-tendency subjects into patterns they would not have chosen.
- Allow MS, apply an arbitrary crossing rule (first, median) → breaks IC because subject does not know ex ante which row determines payment.
- Skip Stage 2 for MS subjects → asymmetric rounds, lost precision for the subjects whose data is most informative about inconsistency.

Stage 2 MS is harder still: within ~1pp spacing, MS likely reflects noise or indifference, but operationally there is still no clean crossing.

Christina also flagged that coarse separated (7.5) is the **belief analog of C&K 2025's UJS-E mechanism**. Verifying against the C&K paper (p. 4 and §3):

- C&K's UJS-E (value elicitation, WTA for a \$1.00 item): "over many periods, subjects choose between a decreasing clock-price and \$1.00. The UJS-E mechanism terminates at some randomly selected period, and the subject receives her choice in that period."
- C&K's characterization theorem (§3): UJS mechanisms for binary allocation take the form of a generalized MPL.
- Structural mapping from UJS-E to our coarse separated belief MPL:
    - UJS-E item (fixed value \$1.00) ↔ our event bet (wins \$H if event)
    - UJS-E decreasing clock-price ↔ our r-lottery (wins \$H with probability r)
    - UJS-E random-period termination + subject gets that period's choice ↔ our random-row payment

Both are UJS implementations of the same game. Presentation differences — C&K use descending order (clock metaphor natural for WTA); we use random order (per B&H 2018 ROCL-suppression, ADR-0015); C&K run it as a dynamic clock, we as a static list with one row per screen — are implementation choices, not structural requirements of UJS.

## Decision

**Adopt coarse separated as the MPL format for the main belief-elicitation arm.** Concretely:

- **15–20 rows** spanning r ∈ [0.05, 0.95] (or similar), covering the induced-π grid of interest at 5pp precision.
- **One row per screen**, random order.
- **HH-style instructions** per ADR-0010.
- **Pre-registered accuracy metric** per ADR-0009 (dual-metric ε = 0 and ε = 5pp).
- **Multi-switching descriptive, not censored** per ADR-0008.

Rule out:
- §7.1 full list: IC concern (B&H ROCL, ADR-0015).
- §7.2 Holt-Smith two-stage list: IC concern + MS/Stage-2 dilemma.
- §7.3 Trautmann-van de Kuilen two-stage list: same as §7.2 plus 17% reverse-report rate from B&W 2018.
- §7.4 full separated (100 rows): operationally unworkable at 100 screens.
- §7.7 two-stage separated: MS/Stage-2 dilemma (applies independently of list-vs-separated presentation).

Hold open:
- §7.6 coarse separated + revise screen: the revise step partially reintroduces list-format visibility; not the primary format, but may be worth piloting as a secondary analysis or robustness arm. Decision on whether to include not resolved by this ADR.

## Consequences

- **Commits us to:** 15–20 rows, one per screen, random order, HH instructions, dual-metric accuracy, descriptive MS reporting. Concrete design parameters now fixed for Qualtrics implementation.
- **Commits us to:** framing the MPL arm in the paper as the **belief analog of C&K's UJS-E mechanism**, grounded in their characterization theorem. Not merely "the option that survives process of elimination." This gives H2's prediction (MPL > BDM) a positive theoretical anchor in the C&K framework — consistent with ADR-0013 (UJS as the primary behavioral-failure framework).
- **Resolves:** the "MPL format selection" Pending decision in the ADR README.
- **Rules out:** re-opening this decision absent new evidence. If piloting reveals a specific problem with coarse separated (e.g., MS rate well above C&K benchmarks, or implementation difficulty in Qualtrics), that is grounds for a superseding ADR.
- **Opens:** the §7.6 revise-screen question as a secondary design issue — whether to include a revise step for robustness analysis. Not resolved here.
- **Preserves:** all committed reasoning from ADR-0008, 0009, 0010, 0014, 0015 — they constrain the format space but did not select within it.
- **Strengthens tomorrow's meeting ask.** Anujit's role on Q3 shifts from "validate format selection" to "validate the two-stage-format-ruling-out reasoning and the UJS-E-analog grounding." The deck's Q3 will include both.

## Sources

- `quality_reports/mpl_format_decision_analysis.md` — full options analysis (§7.1–§7.7 updated 2026-04-22 with MS/Stage-2 dilemma notes in §7.2, §7.3, §7.7 and UJS-E analog note in §7.5; §11 updated to reflect this decision).
- `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` — UJS-E mechanism description, characterization theorem, structural mapping to coarse separated.
- `master_supporting_docs/literature/reading_notes/bdm_bic_2026-03.md#20` — Brown & Healy (2018), for the IC / ROCL-suppression argument that underlies the choice of separated format.
- `master_supporting_docs/literature/reading_notes/danz_vesterlund_wilson_2022.md` — for the dual-metric accuracy convention and "weak conditions" terminology.
- ADR-0008 (MS descriptive, not threshold); ADR-0009 (dual metric); ADR-0010 (HH instructions); ADR-0014 (mechanism invariance framing); ADR-0015 (B&H ROCL as canonical).
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` — records the MS/Stage-2 dilemma surfacing and this decision.
- Discussion: 2026-04-22 with Christina — "corase separated list has the advantage of being essentially the precise belief analog of the UJS-E mechanism in their paper (they run it in descending order). you can double check this."
