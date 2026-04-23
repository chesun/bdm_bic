<!-- primary-source-ok: segal_1990 -->

# 0021: Event probability is objective in our ball-and-urn setup; no within-row ambiguity concern

- **Date:** 2026-04-22
- **Status:** Decided
- **Scope:** IC foundation
- **Data quality:** Full context

## Context

ADR-0005 (2026-04-07, Proposed) flagged Brown & Healy belief transfer as an unverified assumption for belief elicitation. `quality_reports/mpl_format_decision_analysis.md` §6.3 (written 2026-04-13) subsequently distinguished two channels that could threaten IC under B&H's conjecture:

1. **Cross-row ROCL channel** (the original B&H concern). List format triggers ROCL; combined with non-EU preferences, monotonicity breaks (Segal 1990); RPS is then not IC (Azrieli-Chambers-Healy 2018). Separated format blocks this path by breaking the salience of the compound structure.
2. **Within-row ambiguity channel** (framed as a belief-specific concern). Even at a single row, the event bet's probability could be treated as *ambiguous* by the subject, producing non-monotone choices at the row level that format selection would not address.

The within-row channel was framed as a separate open concern because if the event bet feels subjectively ambiguous at known θ, choosing separated format doesn't close it.

On 2026-04-22, during advisor-meeting slide prep, Christina re-examined the within-row channel and flagged that it rests on a premise that does not hold in our specific design. Our setup uses stated ball-and-urn composition (e.g., 20 red / 80 blue, with the probability P(red) = 0.2 made explicit via the urn composition). Under stated composition:

- The event bet's probability is **objective**, not Ellsberg-ambiguous. The subject is told the probability directly; it is not inferred from unknown distributions.
- Classical Ellsberg-style ambiguity aversion requires unknown probabilities. Ball-and-urn composition makes probabilities known.
- Source preference (a subject might slightly prefer betting on an objective lottery over betting on a ball draw) is a second-order effect, not the "subjective π" concern that §6.3 was originally framed around.

Claiming the event bet is subjective in a ball-and-urn setting with stated composition is a stretch. The within-row ambiguity channel was an overgeneralization from belief-elicitation settings where subjective probability is the object of measurement (e.g., beliefs about one's own performance, beliefs about real-world events without stated base rates).

## Decision

**In our ball-and-urn setup with stated composition, the within-row ambiguity channel is not a design concern.**

Concretely:

- The event bet's probability is stated objectively via urn composition.
- Ellsberg-style ambiguity aversion does not apply.
- Source preference (objective lottery vs. ball-and-urn draw) is a second-order effect, noted but not a gating concern for IC.
- The only B&H transfer question that remains open for our design is the **cross-row ROCL path**, and separated format (ADR-0015) blocks it by construction.
- No auxiliary B&H-transfer arm is required to defend IC in our design for *within-row* reasons. (Whether to run a within-subject list-vs-separated test for cross-row robustness is a separate design question, not resolved by this ADR.)

## Consequences

- **Narrows ADR-0005.** ADR-0005 remains as the formal record that B&H transfer was not directly tested for beliefs. This ADR narrows the live concern to the cross-row ROCL channel, which separated format already addresses. Within-row ambiguity as a concern is retired for this project.
- **Commits us to:** framing the IC defense as (a) theoretical IC (Karni 2009 dominance + probabilistic sophistication; Azrieli et al. 2018 monotonicity — both satisfied in our ball-and-urn design) + (b) separated MPL format to block the cross-row ROCL channel. Within-row ambiguity is not a gap we need to fill.
- **Removes the B&H belief-transfer question from the advisor meeting.** Q3 of `04_slides.tex` was simplified on 2026-04-22 to drop the auxiliary-arm question, because the within-row concern that prompted it does not apply to our design. This ADR formalizes that rationale.
- **Preserves separately:** the cross-row robustness question. Whether to run an auxiliary list-vs-separated test at the cross-row level (the original B&H arm sketched in `mpl_format_decision_analysis.md` §8) is still an open design choice, but is disentangled from the within-row concern.
- **Scoped to the current design only.** A future project using *subjective* beliefs (e.g., beliefs about one's own performance, beliefs about real-world events without stated base rates) would have to revisit the within-row ambiguity concern, because those settings have genuinely subjective probabilities.
- **Retires from `mpl_format_decision_analysis.md` §6.3:** the within-row ambiguity channel discussion as a live design concern. The section can be read as historical context but does not constrain our format choice.

## Sources

- ADR-0005 (narrowed by this ADR; still Proposed for the cross-row ROCL path, which ADR-0015 addresses via separated format).
- ADR-0015 (separated format as canonical ROCL-blocking choice).
- `quality_reports/mpl_format_decision_analysis.md` §6.3 (within-row ambiguity channel — retired by this ADR for our ball-and-urn setting).
- `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` — Q3 no longer includes the B&H belief-transfer question.
- `quality_reports/session_logs/2026-04-22_pre-thursday-slide-review-and-fixes.md` — records the 2026-04-22 discussion.
- Discussion: 2026-04-22 with Christina — "it is a far stretch to claim our event bet is subjective for ball and urn probabilities I think."
