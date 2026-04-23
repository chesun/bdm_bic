---
citation: "Danz, D., Vesterlund, L., & Wilson, A.J. (2022). Belief Elicitation and Behavioral Incentive Compatibility. *American Economic Review*, 112(9): 2851–2883."
bibtex_key: danz_vesterlund_wilson_2022
primary_source_in_repo: master_supporting_docs/literature/papers/Danz_Vesterlund_Wilson_BSR_Online_Appendix.pdf
primary_source_not_in_repo: The main AER article PDF is not currently in the project's papers/ directory. The online appendix (49 pages, February 2022) IS in the repo and covers experiment instructions, additional tables, and the incentives-only treatment methodology verbatim. Main-paper claims cited here are those summarized in Danz, Vesterlund & Wilson (2024, JEP) review article (see `bdm_bic_2026-03.md#1`) or verifiable from the online appendix directly.
date_read: 2026-04-22
reader: Claude
scope: Focused read of online appendix Contents (pp. 1), Tables A.1–A.2 (pp. 2–3), §C.4 Incentives-only Treatment (pp. 45–48). Main-paper body sections NOT yet read in-session.
---

# Danz, Vesterlund & Wilson (2022, AER) — Belief Elicitation and Behavioral Incentive Compatibility

## Summary

Introduces the behavioral incentive compatibility (BIC) framework for belief elicitation. Shows that the Binarized Scoring Rule (BSR), despite being theoretically incentive-compatible, fails in practice: subjects center reports around 0.5 even when the induced belief is extreme. The paper's central diagnostic is two direct tests of BIC — an information/no-information test (Condition 1) and an incentives-only test (Condition 2). See the 2024 JEP review (`bdm_bic_2026-03.md#1`) for the high-level summary.

## Core claims this paper makes

- BSR is IC in theory but fails in practice: observed reports center around 0.5 when induced belief is far from 0.5.
- Two conditions jointly characterize BIC and are used as direct tests: (1) explaining the mechanism improves accuracy; (2) subjects pick the payoff-maximizer when faced with the pure-incentives menu.
- BSR violates both conditions. "False reports" (ε = 0) rates by treatment (from Online Appendix Table A.1): Information 31.2%, No-Information 16.2%, RCL 22.7%, Feedback 13.3%, Description 18.2%.
- The incentives-only test at induced θ = 0.3 and θ = 0.2 shows that subjects do not reliably pick the payoff-maximizing lottery pair (the BSR pure-incentives analog of the 69% result that DVW later report for p-BDM in the 2024 JEP article).

## Definitions I should cite verbatim

From Online Appendix §C.4 (pp. 45–47), the incentives-only module instructions — verbatim:

> **Decision Task 3:**
> You now have a chance to earn an additional \$8.
> You will make two choices and one of them will be carried out for payment.

> **Decision Task 3: Choice 1**
> You will choose a pair of lottery tickets, one red and one blue. Only one of the lottery tickets will count for payment. **There is a 30% chance that the red lottery ticket is the one that counts and therefore a 70% chance that the blue lottery ticket is the one that counts.** Each lottery ticket gives you a chance of winning \$8, and the chance of winning varies. You get to decide which pair of lottery tickets will count for you (A through K). Please select the pair of lottery tickets that you want by clicking your preferred row.

The menu of 11 lottery pairs (Table in §C.4) uses the BSR payoff structure at equal percentage-point spacing: pair A pays 100% red / 0% blue; pair K pays 0% red / 100% blue; the maximizer at induced θ_red corresponds to the row where win probabilities align with q = θ_red.

> **Decision Task 3: Choice 2** [same as Choice 1 but with] **There is a 20% chance that the red lottery ticket is the one that counts and therefore a 80% chance that the blue lottery ticket is the one that counts.**

**Integration (load-bearing methodological detail):**

> These instructions were attached as module following a strategic study of public-good provision with two previous tasks. (Online Appendix p. 45)

## What this paper is NOT claiming (common misreadings)

- **Misreading:** DVW's incentives-only test was run within-subject with the main belief-elicitation treatments.
  **Correction:** The incentives-only module was attached to a *different* study (public-good provision), not to the main BSR belief-elicitation study (Information / RCL / No-Information / Feedback / Description treatments). Subjects in the incentives-only module were a separate sample. Within-subject variation occurred only across the two θ values (0.3 and 0.2) within the module itself.

- **Misreading:** The incentives-only test used the same menu structure as the main elicitation.
  **Correction:** The main elicitation asked subjects to report a belief (a number). The incentives-only test asks subjects to pick one of 11 lottery pairs (A–K). The lottery-pair menu corresponds to what the subject *would receive* if they reported each q value under BSR, displayed directly — hiding the implied-q structure. Subjects are not told the mapping to reports.

- **Misreading:** DVW covered θ = {0.2, 0.4, 0.6, 0.8}.
  **Correction:** The online appendix's incentives-only module uses only θ ∈ {0.2, 0.3} (with the symmetric 0.7 and 0.8 framing). Four-θ coverage comes from other papers (Burfurd & Wilkening 2018), not DVW 2022.

- **Misreading:** DVW 2022 uses the p-BDM. 
  **Correction:** DVW 2022 uses the **Binarized Scoring Rule (BSR)**, not the probabilistic BDM. The p-BDM pure-incentives result (69% at θ = 0.2) is from a separate DVW working paper described in the 2024 JEP review — its methodology is not public.

## Method (experimental, as summarized from the online appendix)

Lab-based within-subject BSR belief-elicitation study with five between-subject treatments (Information, RCL, No Information, Feedback, Description). Each subject performs 10 guess rounds eliciting prior and posterior beliefs for three urn compositions. Accuracy metrics (ε = 0 "false reports" and ε > 0.05 "distant reports") are reported by treatment × prior location (π = 0.5 vs. π ≠ 0.5).

The incentives-only module was an add-on to a separate public-good provision study; within it, subjects made two menu choices (θ ∈ {0.2, 0.3}) with payment determined by random selection of one of the two choices.

## Key numerical results (partial — from tables in online appendix)

- Table A.1 ε-false-report rates (|q − π| > 0.05): Information 31.2%, RCL 22.7%, No-Information 16.2%, Feedback (t=1,2) 13.3%, Feedback (t=9,10) 20.0%, Description 18.2%. N = 2,630.
- Table A.2 distant-report rates on posteriors (|q − π| ≥ 0.15): Information 37.0%, RCL 30.4%, No-Information 31.3%, Feedback (t=1,2) 27.9%, Feedback (t=9,10) 31.3%, Description 28.7%.
- Incentives-only result details (main-paper body, not read in-session): see the 2024 JEP review summary in `bdm_bic_2026-03.md#1`.

## Relevance to our project

- **Methodology anchor for our H1a info/no-info test.** The Information vs. No-Information contrast and the 5pp ε cutoff translate directly to our T1 vs. T3 arms in the current design (see `04_slides.tex` Design frame). ADR-0009 locks the dual-metric (ε = 0 and ε = 5pp) on DVW 2022's precedent.
- **Methodology anchor for our H1b pure-incentives test.** Specifically:
  - **Between-subject relative to the main belief-elicitation study.** DVW attached the incentives-only module to a *different* study; they did not re-test the same subjects who had done the main elicitation. Our Proposal A / Proposal B for p-BDM should follow this structure: the pure-incentives arm is a separate subject pool, not a module appended to the main BDM arm within-subject.
  - **Within-subject across θ.** DVW used two θ values. A natural extension is a larger θ set, but even the 2-θ structure preserves within-subject variation for a power gain and a descriptive θ-pattern.
  - **Menu structure.** DVW's 11-row lottery-pair table (A–K) at equal 1pp spacing is the concrete template our Proposal A should emulate.
- **Weak-conditions terminology.** "Two weak conditions for BIC" is DVW 2022's own language — load-bearing for this project; see `feedback_dvw_terminology.md`.

## Open questions flagged by this paper (for our work)

- What θ values should our pure-incentives test cover? DVW 2022 used two; Burfurd & Wilkening (2018) uses four. This is a live design decision — see ADR-0017 (pending).
- Should we follow DVW in attaching the pure-incentives module to an unrelated study, or is it defensible to attach it to our own BDM comprehension study (with appropriate between-subject sampling)? The former is strict replication; the latter preserves more of the project's recruit budget for one study. Worth flagging for Anujit.

## Passages worth quoting

- The incentives-only integration statement (§C.4 p. 45, verbatim above) — load-bearing for our design decision that the pure-incentives arm is between-subject relative to main BDM.
- Table A.1 (p. 2) and Table A.2 (p. 3) numbers — reference for our power calculations.
- Decision Task 3 Choice 1 and Choice 2 instructions (§C.4 pp. 46–47, verbatim above) — template for our Proposal A instructions.

## Pages read in detail

- Online appendix pp. 1–6 (TOC, Tables A.1–A.2, Figures A.1–A.4).
- Online appendix pp. 44–48 (Decision Screen: Piece Rate Belief screen; §C.4 Incentives-only Treatment in full).
- Main AER paper body: **not read in-session** (PDF not in repo). The main-paper headline results are summarized from the DVW 2024 JEP review article notes (`bdm_bic_2026-03.md#1`).

## Backfill TODO

- Add the DVW 2022 main AER paper PDF to `master_supporting_docs/literature/papers/` when available. When added, the main-paper body sections (experimental design §II, results §III, behavioral incentive compatibility framework §IV) should be read in-session and this notes file updated. Until then, citations of DVW 2022 should be restricted to claims verifiable from the online appendix, Table A.1/A.2 numerics, or the 2024 JEP review summary.
