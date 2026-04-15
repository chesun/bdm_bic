# CLAUDE.MD -- Behavioral & Experimental Economics Research with Claude Code

<!-- HOW TO USE: Replace [BRACKETED PLACEHOLDERS] with your project info.
     Customize Beamer environments for your talk preamble.
     Keep this file under ~150 lines — Claude loads it every session.
     Based on clo-author (Hugo Sant'Anna) + infrastructure from Pedro Sant'Anna
     + behavioral/experimental econ extensions. -->

**Project:** BDM Belief Elicitation and Behavioral Incentive Compatibility.
**Institution:** UC Davis
**PI:** Christina Sun
**Field:** Behavioral & Experimental Economics
**Branch:** main
**Stata version:** 17
**LaTeX engine:** pdflatex
**Overleaf path:** ~/github_repos/bdm_bic_paper

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile and confirm output at the end of every task
- **Single source of truth** -- Paper `main.tex` is authoritative; talks and supplements derive from it
- **Quality gates** -- weighted aggregate score; nothing ships below 80/100; see `quality.md`
- **Worker-critic pairs** -- every creator has a paired critic; critics never edit files
- **Inference first** -- design experiments with inference in mind from the start; tests and treatments co-evolve (see inference-first checklist)
- **Log decisions** -- every substantive design decision gets an ADR in `experiments/designs/decisions/`; append-only, supersede don't edit (see `.claude/rules/decision-log.md`)
- **Auto-memory** -- corrections and preferences are saved automatically via Claude Code's built-in memory system

---

## Getting Started

1. Fill in the `[BRACKETED PLACEHOLDERS]` in this file
2. Run `/discover interview [topic]` to build your research specification
3. Or run `/new-project [topic]` for the full orchestrated pipeline

---

## Folder Structure

The project spans three locations: a **git repo** (code, experiments, workflow), a **data folder** (outside git, confidential), and an **Overleaf project** (paper, figures, tables). Overleaf syncs via GitHub integration.

```
bdm_bic/                         # Git repo (this project)
├── CLAUDE.md                    # This file
├── .claude/                     # Rules, skills, agents, hooks
├── theory/                      # Empty — IC conditions from Karni (2009) are in the paper draft
├── experiments/                 # Experiment materials
│   ├── designs/                 # Design docs, checklists
│   │   └── decisions/           # ADR log — append-only design decision record
│   ├── protocols/               # IRB, consent forms
│   ├── instructions/            # Subject instructions
│   ├── qualtrics/               # QSF exports
│   ├── comprehension/           # Understanding/attention checks
│   └── pilots/                  # Pilot data, timing, budgets
├── data/
│   ├── raw/                     # Untouched data
│   ├── cleaned/                 # Processed data
│   └── simulated/               # Power analysis simulations
├── analysis/                    # Stata analysis (PRIMARY)
│   ├── do/                      # Do files (mainscript.do, settings.do, clean/, learn/, share/)
│   ├── est/                     # Stored estimates (.ster)
│   └── log/                     # Log files
├── prolific/                    # Prolific recruitment (invoices, qualtrics_data, bonus scripts)
├── survey/                      # Survey materials
├── survey_design/               # Visual assets (scenario pics, BDM diagrams)
├── IRB/                         # IRB documentation
├── funding/                     # Funding proposals
├── presentations/               # Past talks (brown bag, ESA, UC Davis, BABEEW)
├── explorations/                # Research sandbox
├── quality_reports/             # Plans, specs, reviews, session logs
├── templates/                   # Session log, quality report, experiment checklist
└── master_supporting_docs/      # Reference papers and data docs

Dropbox/.../bdm_incentives/       # Data folder (OUTSIDE GIT — confidential)
├── data/raw/                    # Raw data
└── data/clean/                  # Cleaned data
    # Mac: ~/Library/CloudStorage/Dropbox/Davis/Research_Projects/bdm_incentives/data
    # Windows: Dropbox/Davis/Research_Projects/bdm_incentives/data
    # Set in settings.do as $datadir

bdm_bic_paper/                   # Overleaf project (GitHub-synced)
├── paper/                       # Main manuscript (SOURCE OF TRUTH)
│   ├── main.tex
│   ├── references.bib
│   └── bdm_incentive_truth.bib
├── figures/                     # Output figures (.pdf)
├── tables/                      # Output tables (.tex)
└── presentations/               # Slides (BABEEW 2023, ESA 2022, UC Davis)
```

---

## Commands

```bash
# Paper compilation (natbib + bibtex) — run from paper dir
cd ~/github_repos/bdm_bic_paper/paper && pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

# Stata analysis — run from analysis dir
cd ~/github_repos/bdm_bic/analysis && stata-mp -b do do/mainscript.do
```

---

## Quality Thresholds

| Score | Gate | Applies To |
|-------|------|------------|
| 80 | Commit | Weighted aggregate (blocking) |
| 90 | PR | Weighted aggregate (blocking) |
| 95 | Submission | Aggregate + all components >= 80 |
| -- | Advisory | Talks (reported, non-blocking) |

See `quality.md` for behavioral scoring weights (design 25%, paper 20%, theory 15%).

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/new-project [topic]` | Full pipeline: idea → paper (orchestrated) |
| `/discover [mode] [topic]` | Discovery: interview, literature, data, ideation |
| `/design experiment [topic]` | Inference-first experiment design (14-step checklist) |
| `/theory [develop/review]` | Formal model development or proof review |
| `/analyze [dataset]` | End-to-end data analysis (Stata 17 primary) |
| `/write [section]` | Draft paper sections + humanizer pass |
| `/review [file/--flag]` | Quality reviews (routes by target: paper, code, peer) |
| `/challenge [--mode] [file]` | Devil's advocate: `--design`, `--theory`, `--paper`, `--fresh` |
| `/preregister [study]` | Generate pre-registration (AsPredicted, OSF) |
| `/qualtrics [mode]` | Create/validate/improve Qualtrics surveys |
| `/otree [mode]` | Generate/review oTree experiment code |
| `/revise [report]` | R&R cycle: classify + route referee comments |
| `/talk [mode] [format]` | Create, audit, or compile Beamer presentations |
| `/submit [mode]` | Journal targeting → package → audit → final gate |
| `/tools [subcommand]` | Utilities: commit, compile, validate-bib, context-status, etc. |

---

## Output Organization

Output organization: by-script (figures → `bdm_bic_paper/figures/`, tables → `bdm_bic_paper/tables/`)

---

## Current Project State

| Component | File | Status | Description |
|-----------|------|--------|-------------|
| Paper | `bdm_bic_paper/paper/main.tex` | draft (halfway) | BDM incentive compatibility and belief elicitation |
| Theory | in `main.tex` | needs verification | IC conditions from Karni (2009), no original theory developed |
| Experiment | `experiments/` | piloted (2022) | Qualtrics survey on Prolific, BDM belief elicitation with urn scenarios |
| Pilot Data | `prolific/qualtrics_data/` | complete | Small pilot Oct 2022 via Prolific |
| Analysis | `analysis/do/` | in-progress | Stata 17: cleaning, exploration, figures, regressions |
| Replication | `replication/` | not started | -- |
| Pre-registration | -- | not started | -- |
| Presentations | `presentations/`, `bdm_bic_paper/presentations/` | multiple given | Brown bag 2022, ESA 2022, UC Davis 2022, BABEEW 2023 |
