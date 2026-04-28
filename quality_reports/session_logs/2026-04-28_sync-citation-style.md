# Session Log: 2026-04-28 — Citation-style convention + inference-first stale ref fix

**Status:** COMPLETED

## Changes synced from workflow

| File | Action |
|------|--------|
| `.claude/rules/primary-source-first.md` | Added "Citation-style convention (two-coauthor papers)" section. Two-coauthor papers always written as "Author and Author (year)", never comma-separated, never with `&`. Two reasons: standard economics convention; avoids primary-source-first hook regex false-positives on comma-adjacent surnames. |
| `.claude/references/inference-first-checklist.md` *(behavioral repos only)* | Fixed stale plan reference. Was: pointer to a non-existent late-March plan file. Now: pointer to `.claude/rules/experiment-design-principles.md` (which carries the in-line academic attributions for the 13 design principles). |

## Reference

- Source workflow commits: `b1f9bfb` (main), `407fa2e` (applied-micro), `2f3bb1b` (behavioral, includes the inference-first fix in addition to the citation style).
