# Session Log: 2026-04-28 — Sync derive-dont-guess + no-assumptions rules

**Status:** COMPLETED

## Objective

Receive two new universal rules from the workflow that complete the epistemic stack of "don't fabricate" guards: `derive-dont-guess.md` (don't invent facts the repo already encodes — filepaths, variable names, macros, output conventions) and a project-level `no-assumptions.md` (port of the user's global rule, expanded for public-release portability so forkers get it too).

Triggered upstream by csac codebook-script incident — agent guessed dataset paths when `do/settings.do` had them defined as globals.

## Changes synced from workflow

| File | Action |
|------|--------|
| `.claude/rules/derive-dont-guess.md` | NEW universal rule. Per-entity-type lookup table; citation requirement (cite source file:line for derived entities); "new convention" exception when no precedent exists. |
| `.claude/rules/no-assumptions.md` | NEW project-level rule. Ports user's global `~/.claude/rules/no-assumptions.md`, expanded with relationship to siblings, ask/leave-out/explicit-assume protocol, what-counts-as-assumption table, worked examples. |
| `.claude/agents/coder.md` | Updated — must cite source file:line for each repo entity referenced; "new convention" disclosure when no precedent; do not fabricate user intent. |
| `.claude/agents/writer.md` | Same as coder, applied to paper text and numeric values. |
| `.claude/agents/coder-critic.md` | Added "Derive-don't-guess deductions" table (-25 to -3). |
| `.claude/agents/writer-critic.md` | Same plus "No-assumptions deductions" for fabricated user-intent claims in paper text. |

## Verification

- `.claude/rules/derive-dont-guess.md` and `no-assumptions.md` present.
- Critic agents include the new deduction tables.
- Worker agents cite source files when referencing repo entities.

## Reference

- Source: `claude-code-my-workflow@5fa1e96` (cherry-picked to applied-micro `8a71f46` and behavioral `4be694b`).
- Plan doc upstream: `quality_reports/plans/2026-04-28_derive-dont-guess-rule-proposal.md`.
