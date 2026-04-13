# Session Log: 2026-04-08 — Theory Intuition & Formatting Fixes

## Goal
Fix MacDown rendering issues (dollar signs, list formatting, LaTeX math) across reading notes and research documents. Build intuitive understanding of the theoretical foundations (Azrieli-Karni connection, probabilistic sophistication, no-stakes condition).

## Operations

- Fixed MacDown rendering: escaped all `\$` signs, added blank lines before lists, converted math in Azrieli (paper 18) and Karni (paper 19) entries to proper LaTeX
- Created `intuition_azrieli_karni_connection.md` with sections on:
  - Karni (2009) IC proof intuition
  - "No stakes" as a third IC assumption (scope condition, not preference property)
  - Probabilistic sophistication definition and what violates it
  - Azrieli et al. (2018) RPS IC under monotonicity
  - How the two results connect (Karni is a special case of Azrieli)
  - When monotonicity fails (reduction, ambiguity, format effects)
- Investigated session log hook (`log-reminder.py`) — accepts any .md in session_logs/
- Saved feedback memory: save long responses to documents

## Decisions

- No stakes is effectively a third IC assumption for Karni's formulation, but it's a *scope condition* (about the agent's situation) rather than a *preference property*. Satisfied by our urn-draw design by construction.
- Probabilistic sophistication may be violated by prospect theory with differential probability weighting over subjective vs. objective events — important caveat for our theoretical positioning.

## Status

- Done: Formatting fixes, theory intuition document
- Pending: Resolve Condition 2 operationalization, pressure-test research direction, CS Comments for papers 3, 4, 5, 7, 9, 11, 12
