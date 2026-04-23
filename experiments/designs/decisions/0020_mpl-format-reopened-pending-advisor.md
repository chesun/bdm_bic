# 0020: MPL format selection re-opened as Pending; ADR-0019 commitment withdrawn

- **Date:** 2026-04-22
- **Status:** Decided
- **Scope:** Methodology
- **Supersedes:** #0019
- **Data quality:** Full context

## Context

ADR-0019 (earlier on 2026-04-22) committed to coarse separated (15–20 rows, one per screen, random order) as the MPL format. Two arguments converged:

1. The MS/Stage-2 dilemma rules out two-stage list and two-stage separated formats (7.2, 7.3, 7.7) on structural grounds.
2. Coarse separated is the belief analog of C&K 2025's UJS-E mechanism — a positive theoretical anchor.

On 2026-04-22 (later the same day), Christina flagged a gap in the commitment: coarse separated gives 5pp precision. That precision is sufficient for our project's BIC test (we do not need point-belief recovery — we test whether subjects identify the UJS-justifiable action within ε of π), but it does not constitute a general-purpose recommendation for belief elicitation when precision is required. Our paper may want to offer a format recommendation to the wider literature; committing now to coarse separated would either:

- Narrow our paper's contribution to "format that works for BIC testing at 5pp precision," rather than a general belief-MPL format recommendation, or
- Force us to argue that 5pp is always sufficient, which is hard to defend for belief-elicitation applications that need point-belief recovery at higher precision.

Neither is attractive. The cleaner path is to consult Anujit — he has the strongest prior on whether the MS/Stage-2 dilemma is actually fatal for two-stage formats, on whether there is a format variant not yet considered, and on how the precision-vs-interpretability tradeoff should be presented.

## Decision

**Re-open the MPL format selection as a Pending decision.**

- ADR-0019's Status is updated to `Superseded by #0020`. Its body (including the MS/Stage-2 dilemma argument, the UJS-E belief-analog mapping, and the reasoning for ruling out 7.1, 7.2, 7.3, 7.4, 7.7) stands as *analysis*, not a commitment. The analysis is still valid; we simply have not committed to a format on the basis of it.
- The "MPL format selection" Pending decision is restored to the ADR README.
- Coarse separated (7.5) remains the **working lean** for our project's BIC test specifically, on the UJS-E-analog grounds. But this is a lean, not a commitment, and does not extend to a general belief-elicitation format recommendation.
- The advisor meeting's Q3 is rewritten to ask Anujit for his view on MPL format for belief elicitation, surfacing the precision-vs-interpretability tradeoff and the MS/Stage-2 dilemma as reasons for the open question.

## Consequences

- **Commits us to:** asking Anujit on Q3. His input resolves whether (a) coarse separated is defensible as a general recommendation despite the 5pp precision, (b) the MS/Stage-2 dilemma is actually fatal or has a workaround we have not considered, (c) there is a fourth format we have not considered, or (d) the paper should hedge the format recommendation rather than commit.
- **Preserves:** all ADR-0019 reasoning. If Anujit confirms the analysis, a post-meeting ADR can re-commit to coarse separated cleanly (that ADR will cite both 0019 and 0020 as context and itself supersede 0020).
- **Preserves:** all the supporting ADRs — ADR-0008 (MS descriptive), ADR-0009 (dual metric), ADR-0010 (HH instructions), ADR-0014 (mechanism invariance framing), ADR-0015 (B&H ROCL as canonical). These do not depend on which format wins; they constrain the format space but do not select within it.
- **Holds open:** 7.5 coarse separated (working lean), 7.6 coarse separated + revise (potential robustness arm), and any fourth option Anujit may surface. Two-stage list and separated variants remain disfavored pending his view on whether the MS/Stage-2 dilemma has a workaround.
- **Slide edits (applied 2026-04-22):**
    - Frame "Question 3: MPL format" — reverts from committed-language to working-lean-language. Adds the precision-vs-interpretability tradeoff as the open concern. Asks Anujit for his view on MPL format for belief elicitation.
    - Frame "MPL format: options and tradeoffs" — tradeoff footer keeps the MS/Stage-2 dilemma flag (still valid analysis) but tone reflects the re-opened decision.
- **Analysis doc update:** `mpl_format_decision_analysis.md` §11 reverts from "Recommendation (decided)" to "Recommendation (leaning; awaiting Anujit)." §7.5 Verdict updated to "working lean, not committed; see ADR-0020."

## Sources

- ADR-0019 (Superseded by this entry) — all analysis in that ADR still holds; only the commitment is withdrawn.
- `quality_reports/mpl_format_decision_analysis.md` §11 and §7.5 — updated.
- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` Q3 frame — rewritten.
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` — records the reopening.
- `master_supporting_docs/literature/reading_notes/chakraborty_kendall_2025.md` — UJS-E analog argument preserved in 0019; still the positive anchor if Anujit endorses coarse separated post-meeting.
- Discussion: 2026-04-22 with Christina — "the only problem is we cannot make any recommendation for belief elicitation when precision is required. best to not lock this in as decided, but to ask anujit on his thoughts on MPL format."
