# Advisor Meeting 2026-04-23 — Feedback from Anujit

**Date:** 2026-04-23
**Attendees:** Christina, Anujit Chakraborty
**Deck used:** `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` (15 pages; meeting was originally scheduled 2026-04-17, rescheduled to today)
**What the deck asked for:** Tier-1 Q1 (overall-design gate), Q2 (p-BDM proposal A/B/C ranking for UJS discrimination), Q3 (MPL format — precision vs. interpretability tradeoff, post ADR-0020 reopening)
**What Anujit actually raised:** four points, mostly orthogonal to the Tier-1 asks on the deck. Captured below.

<!-- primary-source-ok: dustan_koutout_leo_2023, karni_2009, azrieli_chambers_healy_2018, chakraborty_kendall_2025, healy_leo_2025 -->

---

## Summary of the four points

| # | Point | Scope it touches | Existing ADR state |
|---|---|---|---|
| 1 | "Complexity" is not a strict manipulation | H3 (complexity hypothesis); within-subject easy/hard structure | ADR-0017 (θ within-subject); no ADR naming "complexity" as the manipulation |
| 2 | pBDM probably does not require ROCL — verify via Dustan, Koutout, Leo | IC foundation; B&H monotonicity-transfer argument | ADR-0012 (Azrieli monotonicity, no ROCL); ADR-0005 (B&H belief transfer); ADR-0015 (B&H ROCL canonical) |
| 3 | pBDM and MPL must have identical precision | Report grid in both mechanisms | ADR-0019 (5pp for MPL, superseded); ADR-0020 (MPL reopened); ADR-0011 silent on pBDM precision |
| 4 | pBDM IC requires monotonicity AND probabilistic sophistication | IC foundation itself; interpretation of Bayesian-arm results | ADR-0012 explicitly says no probabilistic sophistication needed — this is the direct challenge |

The most load-bearing is Point 4 — it directly contradicts our committed ADR-0012. Points 1 and 4 turn out to be the same issue in different framings (see cross-cutting section at the bottom).

---

## Point 1 — "Complexity" is not a strictly a complexity manipulation

### Anujit's claim

The within-subject contrast we have been calling "complexity" (induced objective probability vs. Bayesian-updating posterior) is not strictly a complexity manipulation. "Complexity" in the literature means level of cognitive processing burden. But going from induced probability to a Bayesian-updating task, subjects may simply not know how to do Bayesian updating — so the variation is more than "the same task made harder." More than one thing is changing. The interpretation of the induced→Bayesian contrast is not clear.

### What he wants us to do

- Check the literature: is there a consensus definition of "complexity" as cognitive processing burden?
- Reconsider the label and the interpretation. If we cannot defend "complexity" as the manipulation, we should either rename the hypothesis, add auxiliary measures that isolate the cognitive-burden channel from the belief-formation-ability channel, or drop the arm.

### What this affects in the deck

- H3 ("gap widens under complex belief task") — frame structure and labeling.
- The within-subject easy/hard manipulation structure (ADR-0017 locks θ within-subject, but the "main arm" treatment design still carries the induced→Bayesian within-subject contrast).

### What is not yet decided

- Whether to reframe as "endogenous belief formation" instead of "complexity."
- Whether to add a third within-subject condition between the two (intermediate cognitive burden).
- Whether the paper's contribution hinges on calling it "complexity" specifically or would be preserved under a narrower label.

---

## Point 2 — BDM and ROCL

### Anujit's claim

pBDM probably does not require ROCL, but he is not sure. We need to read Dustan, Koutout, and Leo (2023, *Reduction in Belief Elicitation*) deeply to verify whether ROCL is a requirement for pBDM.

### Where we currently stand

- ADR-0012 commits us to Azrieli-Chambers-Healy (2018) statewise monotonicity as the minimal sufficient IC assumption. It explicitly lists "no assumption of reduction of compound lotteries" as one of the assumptions we do not take on.
- Our compiled reading note on Dustan, Koutout, and Leo (`bdm_bic_2026-03.md` §7) states: "BDM does NOT require reduction (only statewise monotonicity); our question is complementary." The ADR-0012 position is consistent with this.
- The reading note also flags a Christina-comment: "I need to understand why BDM does not require reduction." So the question has been open in our own notes.

### What this means

Anujit's belief (ROCL not required for pBDM) is consistent with our committed ADR, but neither he nor we have fully verified it from the primary source. The verification has to come from a direct reading of the Dustan paper plus tracing the ROCL argument in ACH 2018 and in Brown & Healy (2018). ADR-0015 commits us to B&H's ROCL-triggering story as the canonical mechanism for MPL format effects; that commitment is about format triggering ROCL, not about whether the underlying mechanism requires ROCL.

### What is owed

- A primary-source read of Dustan, Koutout, and Leo (2023), producing reading notes per the `master_supporting_docs/literature/reading_notes/README.md` template (the current compiled-notes entry is a summary, not a close read).
- A written argument (added to the paper's theory section or to the ADR-0012 body) explaining *why* BDM does not require ROCL, not just citing that it does not.

---

## Point 3 — Precision matching across mechanisms

### Anujit's claim

MPL and pBDM must have identical precision for the results to be comparable. He agrees with 5pp precision on MPL. He cited his own UJS experiment: 30 rows on the UJS-E mechanism produced more multiple switching and more noise than a coarser grid would have. Coarser = less noise.

### Where we currently stand

- **MPL precision:** ADR-0019 committed to 5pp precision (coarse separated, 15–20 rows). ADR-0020 reopened the format choice pending advisor input, but did not reopen the precision choice — 5pp precision is still the working commitment.
- **pBDM precision:** ADR-0011 ("p-BDM incentive-only design from scratch") does not specify a report grid. The 2026-04-17 design-space synthesis (`01_p-bdm-design-space-synthesis.md`) proposed an 11-option discrete menu as the first thing to nail down, not tied explicitly to the MPL grid.

### What this implies

The pBDM report grid must match the MPL grid at 5pp, giving a 21-value report set {0.00, 0.05, ..., 1.00}. Two consequential implementation choices follow, neither yet committed:

1. **Discretization of the random cutoff q.** If q is drawn continuously from [0,1], the subject is reporting on a 21-value grid against a continuous q, which is awkward. If q is also discretized to the 5pp grid (21 values), the mechanism collapses to a randomly-selected-row MPL — procedurally identical to MPL except the subject only sees one row. The "BDM as hidden MPL" framing that Healy & Leo surface in their handbook chapter supports this collapse.
2. **Display of the 21-option report menu.** Does the subject see all 21 reportable values (with the mechanism explained), or see a slider with 5pp increments, or type in a number that is snapped to 5pp? Each has different cognitive-burden properties.

### What is owed

- A new ADR committing pBDM to 5pp report precision, aligned with MPL.
- A decision on continuous vs. discretized q.
- A decision on the display mode for the report menu.

These three are tightly coupled and should probably land in one ADR (or a small cluster).

---

## Point 4 — pBDM IC requires monotonicity AND probabilistic sophistication

### Anujit's claim (as reconstructed)

pBDM's theoretical incentive compatibility requires monotonicity AND probabilistic sophistication. If a subject is ambiguity averse but satisfies monotonicity, pBDM is still not incentive compatible, because the subject does not have a single probability in their head. Probabilistic sophistication is required so that subjects actually have a probability to report.

### Why this is confusing to Christina, and why it is load-bearing

ADR-0012 (adopted 2026-04-15) explicitly commits us to the OPPOSITE position: Azrieli-Chambers-Healy monotonicity is the minimal sufficient IC assumption, and probabilistic sophistication is NOT needed. Quoting ADR-0012 directly:

> Requires only: improving any state's outcome (weakly) improves the subject's preference over the act.
> — No assumption of expected utility.
> — No assumption of reduction of compound lotteries.
> — No assumption of probabilistic sophistication.

Anujit is telling us the third line of that list is wrong for the specific purpose of belief elicitation. This either supersedes ADR-0012 or requires us to scope ADR-0012 to "mechanism IC" (eliciting preferences) while recognizing that "belief IC" (interpreting the elicited preference as a probability) is a separate and stronger requirement.

Christina's hesitation is correct — this point needs careful thinking, not a quick reconciliation. A first-pass reconciliation is attempted in `02_point-4-probabilistic-sophistication-deep-dive.md`; final resolution requires a primary-source re-read of Karni (2009), ACH (2018), and possibly Machina-Schmeidler on probabilistic sophistication.

### What this affects

- **ADR-0012** itself — may need to be scoped or superseded.
- **The paper's theory section** — the IC argument's structure changes if probabilistic sophistication is a prerequisite.
- **Interpretation of the Bayesian-updating arm** — if probabilistic sophistication is required for IC, and subjects in the Bayesian arm may not form point beliefs, then the "BDM fails behavioral IC" finding in that arm might be misinterpreted. The mechanism may be eliciting something that is not a probability.
- **The ball-urn induced-probability arm is safe.** ADR-0021 established that the ball urn gives an objective probability with no within-row ambiguity; probabilistic sophistication is trivially satisfied when the probability is objective and physically instantiated.

---

## Cross-cutting observation: Points 1 and 4 are the same issue

- **Point 1** says the induced→Bayesian contrast is not a clean "complexity" manipulation because more than cognitive load varies.
- **Point 4** says one of the things that also varies is whether subjects have a single probability in their head (probabilistic sophistication).

Putting them together: the within-subject induced→Bayesian contrast jointly varies (a) cognitive processing burden, (b) whether the subject has a single probability, and (c) whether the subject can compute the Bayesian posterior at all. These are confounded by design. The "complexity" label is a shorthand that smuggles in the probabilistic-sophistication change without acknowledging it.

This connection is the core of the deep-dive analysis.

---

## What Anujit did NOT push back on (deck Tier-1 questions)

- **Q1 overall design.** No fundamental objection raised beyond the four points above. He did not flag a missing arm, missing control, or confound distinct from what he raised in the four points.
- **Q2 p-BDM proposal ranking (A vs. B).** He did not rank Proposals A (DVW replication) or B (UJS-aligned native framing). The discussion did not get to the A-vs-B choice; it was absorbed by the four points.
- **Q3 MPL format — precision vs. interpretability.** His precision-matching point (Point 3) is relevant here: he endorsed 5pp precision as correct for our BIC test and explicitly used his UJS-E experience to defend it. Whether the paper can make a general belief-MPL format recommendation at 5pp remains open (this was the core of the ADR-0020 reopening); Anujit did not address the general-recommendation question directly.

---

## Affected ADRs at a glance

| ADR | What it says | Effect of Anujit's feedback |
|---|---|---|
| 0005 (B&H belief transfer) | Open — waiting on B&H cross-row argument transfer to beliefs | Point 2 may resolve by primary-source read |
| 0011 (p-BDM design from scratch) | Open on menu, payoff display, θ values, precision | Point 3 closes the precision dimension at 5pp |
| 0012 (Azrieli monotonicity IC foundation) | Committed: monotonicity suffices; no ROCL, no probabilistic sophistication | Point 4 directly challenges the "no probabilistic sophistication" clause |
| 0015 (B&H ROCL canonical) | Committed: B&H's ROCL-triggering story is the canonical mechanism | Point 2 is adjacent; it is about whether pBDM itself needs ROCL, not about format-triggered ROCL |
| 0017 (pure incentives between-subject; θ within-subject) | Committed: θ varies within-subject in the pure-incentives arm | Point 1 challenges the separate "main arm" within-subject easy/hard manipulation, not the pure-incentives θ variation |
| 0019 (MPL 5pp precision — superseded) | Superseded by 0020 for format; precision dimension still at 5pp | Point 3 confirms 5pp is right |
| 0020 (MPL format reopened) | Awaiting Anujit | Partly answered: 5pp precision endorsed; format choice still open |
| 0021 (ball-urn objective probability) | Committed: induced probability via physical urn is objective | Relevant to Point 4: induced-arm is safe from the probabilistic-sophistication worry |

---

## Next steps

See `02_point-4-probabilistic-sophistication-deep-dive.md` for the analytical unpacking of Point 4 and the concrete action items across all four points.
