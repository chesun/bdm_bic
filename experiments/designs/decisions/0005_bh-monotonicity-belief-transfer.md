# 0005: Brown & Healy monotonicity — belief transfer is an unverified assumption

- **Date:** 2026-04-07
- **Status:** Proposed
- **Data quality:** Reconstructed — partial context

> **Reconstructed entry.** Date, decision, and high-level reasoning are sourced from `research_direction_discussion_2026-04-07.md` Point 3 and `mpl_format_decision_analysis.md` §6. The core claim — that we proceed as if B&H transfers to beliefs while flagging the unverified assumption — is directly sourced.
>
> **Edited 2026-04-15** (permissible: entry is Proposed). Removed earlier claim that this decision "commits us to separated or coarse-separated MPL format." That was a backfill overreach; format selection is an open Pending decision. See ADR-0015 (supersedes #0014) for the canonical B&H ROCL-triggering framing and the README Pending list for format selection.
>
> **Edited 2026-04-17** (permissible: entry is Proposed). Updated the cross-reference in the Decision section from "strategy-space-restriction argument (ADR-0014)" to "ROCL-triggering argument (ADR-0015)" following the adoption of the canonical B&H mechanism. The substantive decision — "B&H transfer to beliefs is an unverified assumption we flag and proceed on" — is unchanged. Only the framing cross-reference is updated.

## Context

Brown & Healy (2018) show that monotonicity — the identifying assumption for Random Problem Selection (RPS) payment — is violated in list-format MPL (p = 0.041) but not in separated format (p = 0.697). Their experiment used risk-preference elicitation (lottery comparisons across 20 rows). Our MPL arm is belief elicitation (event bet vs. r-lottery across rows).

Christina raised: does Brown & Healy's finding transfer from risk to beliefs? The formal structure is identical — both are RPS with binary rows per Azrieli et al. (2018) monotonicity — but belief elicitation has one feature risk does not: the event bet's winning probability is subjective to the subject even if induced (urn-drawn) from the experimenter's view. A subject uncertain about their own belief might look across rows to "figure out" π from the list structure, violating the independence that monotonicity requires. This is a belief-specific path to non-monotone behavior that risk MPL does not have.

## Decision

Treat "Brown & Healy's finding transfers to belief MPL" as an **assumption worth flagging**, not a tested claim. We proceed on the assumption and acknowledge it in the paper's IC defense. No dedicated risk-to-beliefs transfer test in this project — that would be a separate research question.

Whether the transfer question affects format selection is an *implication* of this ADR, not a decision contained in it: a list-format MPL inherits the B&H concern without resolution, while a separated-format MPL would neutralize it via the ROCL-triggering argument (ADR-0015, supersedes #0014) — specifically, by failing to trigger ROCL and thus leaving non-EU preferences without mechanism-level consequences. The format selection itself remains an open Pending decision.

## Consequences

- **Commits us to:** a paragraph in the IC-assumptions section acknowledging the transfer assumption and citing B&H 2018 as the open question.
- **Implication for the pending format decision:** a list-format MPL inherits the B&H concern; a separated variant neutralizes it by construction. This is a consideration for the format ADR when it lands, not a commitment embedded here.
- **Does NOT commit us to:** any particular MPL format. That selection is tracked separately as a Pending decision in the README.
- **Open question:** whether to include a B&H-style auxiliary arm (list vs. separated belief MPL) to directly test the transfer — this is Section 10 criterion 4 of `mpl_format_decision_analysis.md`, unresolved.

## Sources

- `quality_reports/research_direction_discussion_2026-04-07.md` :: Point 3 (lines 43–61)
- `quality_reports/mpl_format_decision_analysis.md` :: §6 "Does Brown & Healy Transfer to Beliefs?" (lines 183–200)
- Git commit: `01b0f3a` ("Research direction reformulation...")
