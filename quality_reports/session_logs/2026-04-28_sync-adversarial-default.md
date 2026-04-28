# Session Log: 2026-04-28 — Sync adversarial-default rule + verification ledger

**Status:** COMPLETED

## Objective

Receive the new universal `adversarial-default` rule and verification ledger from the workflow. Inverts the burden of proof for compliance claims: agents must produce positive evidence (grep, test output, diagnostic) for any claim that an artifact satisfies a project convention. Verification ledger at `.claude/state/verification-ledger.md` caches results so unchanged artifacts aren't re-checked.

Triggered upstream by the tx_peer_effects_local code-fix incident: agent assumed inherited Stata code satisfied "no hardcoded paths" — reality was many violations.

## Changes synced from workflow

| File | Action |
|------|--------|
| `.claude/rules/adversarial-default.md` | New universal rule (six per-domain checklists: code/data/design/identification/replication/bibliography) |
| `.claude/state/verification-ledger.md` | New cache file (tracked in git for cross-session/cross-machine persistence) |
| `.gitignore` | Updated `.claude/state/*` exception lines to include the ledger (and primary_source_surnames.txt if missing) |
| `.claude/agents/coder-critic.md` | Added Adversarial-default deductions table; demands ledger evidence on inherited code |
| `.claude/agents/writer-critic.md` | Same — for bibliography-resolves and identification claims in paper text |
| `.claude/agents/verifier.md` | Now populates the ledger on every check; submission mode rebuilds from scratch |
| `.claude/agents/strategist-critic.md` (applied-micro repos) | Demands identification ledger rows (parallel-trends, IV F-stat, RDD McCrary) |
| `.claude/agents/designer-critic.md` (behavioral repos) | Demands design ledger rows (IC, comprehension, randomization, pre-reg) |
| `.claude/agents/theorist-critic.md` (behavioral repos) | Demands proof + non-vacuity ledger rows for load-bearing theorems |

## Verification

- Rule file present at `.claude/rules/adversarial-default.md`.
- Ledger file present at `.claude/state/verification-ledger.md` and not gitignored.
- Critic agents updated per branch (applied-micro vs behavioral).

## Reference

- Source: `claude-code-my-workflow@main` `a4f2f27` cherry-picked to applied-micro (`1a32d94` + `eb2c2c1`) and behavioral (`85a7f72` with extras).
- Plan doc upstream: `quality_reports/plans/2026-04-28_adversarial-default-rule-proposal.md`.
