# Design Decisions Log

An append-only record of substantive design and research decisions for the BDM Belief Incentive Compatibility project. Each entry is an **ADR** (Architecture Decision Record, borrowed from software engineering): short, dated, immutable.

This log is the *record*. Analysis docs in `quality_reports/` are the *reasoning*. When we need to know **what** was decided, read here. When we need to know **why** in depth, follow the Sources link.

---

## Rules

1. **One decision per file.** Numbered `NNNN_short-slug.md`, zero-padded to four digits.
2. **Never edit a Decided entry.** If the decision changes, write a new ADR whose Status is `Decided` and whose header links the prior entry: `Supersedes: #0008`. Then edit the old entry's Status to `Superseded by #NNNN`. The body of the old entry stays.
3. **Proposed entries may be edited** until they become Decided. Once Decided, rule 2 applies.
4. **Reference by number.** In future session logs, analysis docs, and commit messages, cite decisions as `ADR-0008` (or whatever the number is). This is durable across file renames.
5. **Data quality flag is required.** "Full context" = source docs contain explicit reasoning. "Reconstructed — partial context" = date and decision are clear, but reasoning was retrofitted. Future-you needs to know which.
6. **Scope is a recommended field.** Each decision serves a specific component of the research — tagging the scope helps prevent conflating unrelated decisions and makes the log navigable by theme (see "Decision components" below).

## Decision components

Decisions in this log serve distinct research components. An ADR should be scoped to one. Current categories:

- **Research framing** — what the paper is about; hypothesis choices.
- **IC foundation** — the theoretical assumptions that make the mechanism IC (Azrieli monotonicity, etc.).
- **Behavioral theory** — frameworks explaining *why* subjects fail in practice (UJS, obvious dominance).
- **Experimental design** — arm structure, treatments, controls, instruments.
- **Methodology** — analysis metrics, ε tolerances, format choices, instructions.

Not every ADR needs to be perfectly tagged — some decisions cut across components — but tag it when the scope is unambiguous. ADR-0012 (Azrieli IC foundation) and ADR-0013 (UJS behavioral theory) are paired examples: same paper, different theoretical jobs, separated on purpose.

---

## When to write a new ADR

Write one when any of the following becomes true:

- A research framing or hypothesis choice is locked (e.g., "focus on WHY BDM fails BIC").
- A design parameter is committed (arm structure, instrument format, sample size).
- A methodological choice is made (accuracy metric, ε tolerance, MPL format).
- A scope decision excludes a candidate (e.g., "no preference-for-control arm").

Do **not** write an ADR for:

- Literature reading progress or individual paper summaries.
- Code, repo setup, or file-path logistics.
- Tentative thoughts that haven't been committed to. Draft those in a session log or analysis doc first; promote to an ADR once settled.

---

## Entry template

```markdown
# NNNN: [Decision title, <= 80 chars]

- **Date:** YYYY-MM-DD
- **Status:** Decided | Proposed | Superseded by #NNNN
- **Scope:** Research framing | IC foundation | Behavioral theory | Experimental design | Methodology
- **Data quality:** Full context | Reconstructed — partial context
- **Supersedes:** #NNNN (optional)

## Context
1-3 paragraphs. What problem? What constraints? What prompted this now?

## Decision
The decision, stated crisply. Bullet points OK.

## Consequences
What this commits us to. What it rules out. Open questions it creates.

## Sources
- path/to/file.md :: section or line range
- Git commit hash if relevant
```

---

## Index

| ID | Title | Date | Status | Scope |
|----|-------|------|--------|-------|
| [0001](0001_research-framing-why-bdm-fails-bic.md) | Research framing: "Why does BDM fail BIC?" | 2026-03-31 | Decided | Research framing |
| [0002](0002_drop-preference-for-control-arm.md) | Drop preference-for-control arm (urn-draw eliminates Hypothesis B) | 2026-04-06 | Decided | Experimental design |
| [0003](0003_collapse-comprehension-mechanisms.md) | Collapse three comprehension sub-mechanisms into contingent-reasoning failure | 2026-04-07 | Decided | Behavioral theory |
| [0004](0004_adopt-ujs-framework.md) | Adopt UJS as primary theoretical framework | 2026-04-07 | Superseded by [#0013](0013_ujs-scoped-to-behavioral-failure.md) | — |
| [0005](0005_bh-monotonicity-belief-transfer.md) | Brown & Healy monotonicity: belief transfer is an unverified assumption | 2026-04-07 | Proposed | IC foundation |
| [0006](0006_condition2-prioritize-options-a-d.md) | Condition 2 operationalization: prioritize Options A and D; defer B/C/E | 2026-04-07 | Proposed | Methodology |
| [0007](0007_mechanism-invariance-format-anchor.md) | Mechanism invariance is the anchor for MPL format choice | 2026-04-13 | Decided | IC foundation |
| [0008](0008_multi-switching-descriptive-not-threshold.md) | Multi-switching is a descriptive outcome, not an invalidation threshold | 2026-04-14 | Decided | Methodology |
| [0009](0009_dual-metric-accuracy-and-epsilon.md) | Dual-metric accuracy: success rate + conditional distance; dual ε \{0, 5pp\} | 2026-04-14 | Decided | Methodology |
| [0010](0010_hh-instructions-across-formats.md) | Hao-Houser instruction format for all MPL variants | 2026-04-14 | Decided | Experimental design |
| [0011](0011_p-bdm-incentive-only-design-from-scratch.md) | p-BDM incentive-only test: design from scratch (DVW methodology not public) | 2026-04-14 | Proposed | Experimental design |
| [0012](0012_azrieli-monotonicity-ic-foundation.md) | Azrieli et al. (2018) monotonicity as theoretical IC foundation | 2026-04-15 | Decided | IC foundation |
| [0013](0013_ujs-scoped-to-behavioral-failure.md) | UJS as primary framework for behavioral failure (supersedes #0004) | 2026-04-15 | Decided | Behavioral theory |

---

## Pending decisions (tracked, not yet committed)

These are decisions that need to happen but aren't resolved. They get an ADR when resolved, not before.

- **MPL format selection** among {full list, H&S two-stage list, full separated, coarse separated}. Leaning coarse separated per `quality_reports/mpl_format_decision_analysis.md` §11, but criteria 4–7 (B&H auxiliary arm, revise screen, burden budget, precision requirement) in §10 are open.
- **Flat-fee control arm** — open question in `quality_reports/research_direction_discussion_2026-04-07.md` Remaining Open Questions #4.
- **Final sample size** (600 vs. 450 minimal) — proposed in `quality_reports/research_ideas_bdm_bic.md` §3 Direction 1, not locked.
- **Belief elicitations per subject** — power vs. fatigue trade-off, open in `research_direction_discussion_2026-04-07.md` Open Q #5.
- **Comprehension intervention arm (Arm 4)** — deferred in v4 design (see research_ideas_bdm_bic.md §6), not formally killed. Needs a Decided or Superseded ADR.
- **BSR arm for within-study comparison with Danz et al.** — mentioned as interview question in research_ideas_bdm_bic.md §5.
