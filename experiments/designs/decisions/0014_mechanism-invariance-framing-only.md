# 0014: Mechanism invariance is the correct framing for B&H's IA (framing-only, no format commitment)

- **Date:** 2026-04-15
- **Status:** Superseded by #0015
- **Scope:** IC foundation
- **Supersedes:** #0007
- **Data quality:** Full context

> **Superseded 2026-04-17 by ADR-0015.** Christina reviewed `strategy_space_restriction_intuition.md` against Brown & Healy's verbatim conjecture and flagged that the "mechanism invariance + strategy-space restriction" framing in this ADR does not match B&H's actual argument. The canonical B&H story is about ROCL triggering, not strategy-space restriction. ADR-0015 supersedes this entry and adopts the canonical framing. Body preserved below per the append-only rule (only the Status field was edited).

## Context

ADR-0007 (2026-04-13) recorded the mechanism-invariance framing decision but went further in its Consequences section, claiming the decision "commits us to separated or coarse-separated MPL format." Christina flagged on 2026-04-15 that this was an unauthorized promotion of a tentative preference into a committed decision. Checking the source:

- 2026-04-13 session log Design Decisions table lists **"Tentative format: coarse separated (15-20 rows)"** — explicitly tentative.
- The actually-decided item was **"Mechanism invariance as the correct framing for B&H's IA"** — the framing, not the format.
- Section 3.5 of the MPL analysis doc makes a theoretical argument that separated format would be a defensible choice *if selected*, but the selection itself is not made.

This ADR supersedes 0007 and narrows the decision to framing only. Format selection is an open Pending decision (see README and TODO.md).

## Decision

Anchor the theoretical exposition on **mechanism invariance + strategy-space restriction**, not on ROCL or any specific preference-level assumption. Specifically:

1. **Brown & Healy's identifying assumption is mechanism invariance.** Outcome-preferences are stable across payment mechanisms (RPS vs. Framed Control). Reduction of compound lotteries (ROCL) is *one candidate mechanism* for how monotonicity might fail, but it is not part of the IA.
2. **The row-14 action can differ across mechanisms even under mechanism invariance** because the *decision problem* at row 14 is different. Under RPS, row 14 is one of 20 payment candidates (a portfolio component); under Framed Control, row 14 fully determines payoff.
3. **Separated format, if selected, would restrict the strategy space** so non-monotone preferences cannot be expressed in observed behavior. This is the theoretical principle that *would* ground a separated-format choice. Whether to actually make that choice is a separate decision.

The acts-vs-outcomes distinction that grounds this framing remains load-bearing for the paper's IC-assumptions section — preferences over outcomes are primitive; monotonicity is a restriction on how act-preferences relate to outcome-preferences; the B&H test rejects that restriction, not outcome-preferences themselves.

## Consequences

- **Commits us to:** a theoretical framing built on mechanism invariance in the paper's IC-assumptions section, with acts-vs-outcomes exposition.
- **Commits us to:** citing Brown & Healy (2018) for the list-vs-separated empirical result as evidence about when monotonicity holds in practice.
- **Rules out:** an IC defense that invokes ROCL or a specific preference class as load-bearing. The theoretical story is robust to *why* monotonicity fails.
- **Does NOT commit us to:** any particular MPL format (separated, coarse separated, two-stage separated, or list variants). That selection is open — tracked in README Pending decisions and TODO.md Active.
- **Preserves from ADR-0007:** the acts-vs-outcomes exposition and the correction that "multi-switching in MPL supports H3" was wrong (multi-switching threatens H2). Those are valid regardless of format choice.
- **Removes from ADR-0007:** the claim that we are committed to separated or coarse-separated format. That was a backfill overreach promoting the 2026-04-13 tentative preference into a decision.

## Sources

- ADR-0007 (Superseded by this entry)
- `quality_reports/mpl_format_decision_analysis.md` :: §3 "Conceptual Foundation: Acts, Outcomes, and Mechanism Invariance" (lines 38–88)
- `quality_reports/session_logs/2026-04-13_mpl-format-decision.md` :: Design Decisions table — "Mechanism invariance as the correct framing for B&H's IA" (decided) and "Tentative format: coarse separated (15-20 rows)" (tentative, explicitly not decided)
- `quality_reports/strategy_space_restriction_intuition.md` :: deeper conceptual exposition of the strategy-space-restriction principle (forward reference — the principle is theoretical; format selection remains open)
- Discussion: 2026-04-15 — Christina's correction that the 2026-04-13 format preference was tentative, not committed
