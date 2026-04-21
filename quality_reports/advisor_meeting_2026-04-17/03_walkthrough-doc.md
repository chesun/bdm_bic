# Advisor Meeting Walkthrough — 2026-04-17

**Advisor:** Anujit Chakraborty
**Meeting goal:** Leave with a committed design decision on 1–2 items. Primary target: p-BDM incentive-only test (H1b). Secondary: MPL format commitment. Plus: surface the current overall design so he can give feedback we'd otherwise miss.
**Format:** Screen-share this doc live. Drive from it.
**Time budget:** flex ~50–55 min; adapt to him.

---

## Section 1 — Reorient (5 min)

### What's new since he last saw this project

**Last view:** 2022 Prolific pilot + old draft. Old framing: "Does BDM work for beliefs?"

**Why the framing changed (March 2026):**

- Danz, Vesterlund & Wilson (2024 JEP) preview a working paper that BIC-tests BDM. Their headline: 69% of subjects pick the event-independent report (q = 0) at induced θ = 0.2 under p-BDM. The basic "does it fail?" question is being answered by the framework's creators.
- Reformulated question: **WHY does BDM fail BIC, and under what conditions can it be rescued?** This is open.

### The theoretical stack

| Layer | Framework | Role | ADR |
|---|---|---|---|
| IC foundation | Azrieli, Chambers & Healy (2018) monotonicity | The lightweight assumption under which p-BDM is theoretically IC | 0012 |
| Behavioral failure | Chakraborty & Kendall (2025) UJS | Why subjects fail in practice despite IC | 0013 |
| Design anchor | Mechanism invariance (B&H 2018) | Identification strategy for format comparisons | 0014 |

Deliberately separating IC foundation from behavioral failure theory — they're different jobs, separate ADRs.

### The hypothesis structure (v5)

- **H1: BDM fails BIC.** Two-condition test (Danz et al. framework).
  - H1a: info about incentives does NOT increase accuracy (info/no-info).
  - H1b: subjects cannot identify the payoff-maximizer in a pure-choice setting. ← **today's focus**
- **H2: MPL achieves better behavioral IC than BDM** despite theoretical equivalence (format decision → also on today's agenda).
- **H3:** failure is contingent-reasoning failure (UJS-aligned).
- **H4:** BDM-MPL gap widens with task complexity.

### The novelty contribution

- Independent replication of DVW's p-BDM BIC failure, with (potentially) four induced θ values instead of one.
- **First mechanism identification** of *why* p-BDM fails, via H2 (format comparison) and H3 (contingent reasoning).
- **Novel test** (if we go with Proposal C below): parallel incentive-only test for MPL. First published evidence that MPL passes pure incentives — makes the UJS story empirical, not just theoretical.

---

## Section 2 — Current experiment design (5–10 min)

### The paradigm

Urn-based belief elicitation on Prolific. Subjects see an urn with a known composition (e.g., 20 red / 80 blue balls), the experimenter draws one ball, and subjects must report the probability of a particular event (e.g., "red drawn"). Induced-probability design: the ground truth is known to the experimenter in every round.

### The 4-arm treatment structure (between-subject)

| Arm | Mechanism | Instructions | What it identifies |
|---|---|---|---|
| 1 | Single-report BDM | Full incentive explanation + comprehension quiz | Baseline for H1 (BDM fails BIC?) |
| 2 | Belief MPL | Full incentive explanation + comprehension quiz | Format comparison — H2 (MPL > BDM?) |
| 3 | Single-report BDM | Minimal ("report accurately") | H1a / H5 — does explaining incentives help or hurt? |
| 4 | Flat fee | Accuracy encouragement | No-mechanism benchmark |

Proposed N: 150/arm × 4 = 600 (~\$7,200 Prolific). Minimal 3-arm (drop flat fee) = 450 (~\$5,400). Not locked.

### Within-subject (all arms)

- **Easy rounds:** induced priors (e.g., "the probability is 30%" or directly-inferrable urn composition).
- **Hard rounds:** posteriors after signals (Bayesian updating required, e.g., urn whose composition is itself a probabilistic draw, plus a signal).
- Tests H4 (complexity × mechanism interaction) via easy − hard within each arm.
- Comprehension quiz (mechanism-specific) → mediator for H3.
- Response time logged → mediator for H3.
- Numeracy / CRT → moderator for H3–H4.

### Outcome measures (ADR-0009 dual-metric)

- **False-report rate:** any deviation from induced π (ε = 0, strict).
- **Distant-report rate:** deviations > 5pp from induced π (substantive).
- For MPL: same metrics mapped to the crossing point. Multi-switching reported as a descriptive rate (ADR-0008), benchmarked against C&K 2025's 29.7% attentive / 43.7% full sample.

### H1b is the new thing we're designing today

The 4-arm design above tests H1 indirectly (via accuracy on BDM arms). H1b — the *pure-incentives* test of BDM — is a within-subject diagnostic layered on top (likely inside Arm 1), and its specific methodology is the open design question we're leading with in Section 3. Proposals A, B, C there.

### What's committed (ADRs) — don't relitigate

- ADR-0002: no preference-for-control arm (urn-draw eliminates it).
- ADR-0003: single comprehension mechanism (contingent reasoning).
- ADR-0008: multi-switching is descriptive, not a gate.
- ADR-0009: dual-metric accuracy.
- ADR-0010: HH-style (chips-in-a-bag) instructions across formats.
- ADR-0012: Azrieli monotonicity = IC foundation.
- ADR-0013: UJS = behavioral-failure framework.
- ADR-0015: canonical B&H ROCL-triggering mechanism (supersedes #0014; was "strategy-space restriction" — retired 2026-04-17).

### What's NOT committed (live asks)

- p-BDM incentive-only methodology (H1b). → Section 3.
- MPL format among 7 §7 options; tentative coarse separated (7.5). → Section 4.
- Flat-fee arm: include or drop? (Impacts N by 150.)
- Final sample size.
- Belief elicitations per subject (power vs. fatigue).
- Whether to add a B&H-transfer auxiliary arm (~100–150 extra subjects) to test ROCL-triggering in belief MPL directly.

### One-line ask

> **"Before I go deeper into p-BDM design — is there anything in this overall design you'd want to push back on before we lock it? Anything missing that a referee will hit us on?"**

This is the moment for whole-design feedback. After his reaction, move to Section 3.

---

## Section 3 — p-BDM incentive-only test (20 min, headline)

### The gap we need to fill

DVW's JEP (2024) reports ONE substantive result on p-BDM: 69% choose q = 0 at induced θ = 0.2. Their full methodology is NOT public (verified via deep search 2026-04-14 across their pages, SSRN, NBER, RePEc). Their working paper "The Pure-Incentives Test" is listed as work-in-progress, no draft. Email to Danz sent 2026-04-15.

**We must design our own p-BDM incentive-only test.**

### What makes this test matter

The 69% result has a clean UJS reading:

- At q = 0: (P(win | E), P(win | not-E)) = (0.5, 0.5). Event-independent.
- At q = θ = 0.2 (maximizer): (0.295, 0.095). Event-dependent.
- Subjects prefer event-independence even when θ is induced and known.

Same pattern under BSR (DVW 2022) manifests at q = 0.5 (centering) rather than q = 0 (extremeness) because the scoring rule differs. Pattern is same; location differs.

**UJS-consistent reading:** the mechanism admits more than one justifiable action at each θ; the event-independent option is one of them. Under UJS, only the dominant action should be justifiable.

### Three concrete design proposals

Screen-share `01_p-bdm-design-space-synthesis.md` §4 for the full versions and **§5 for concrete implementations** (payoff math table for θ = 0.2, screen mockups for each proposal, within-subject round structure). Short version:

| | Menu | Display | θ | Integration | MPL counterpart | N |
|---|---|---|---|---|---|---|
| **A. Strict DVW replication** | 11-option discrete | Event-contingent win-prob pairs (hide mechanism) | {0.2, 0.4, 0.6, 0.8} within | After main BDM, within-subject | No | 300 |
| **B. UJS-aligned** | 11-option discrete | Native p-BDM framing (preserves contingent reasoning) | Same | Before main BDM, within-subject | No | 300 |
| **C. Parallel BDM + MPL** | 11-option discrete for p-BDM; row-by-row for MPL | Event-contingent pairs for p-BDM; binary rows for MPL | Same | Between-subject on mechanism | **Yes — the novelty** | 600 |

### What each proposal discriminates

| Competing account | A discriminates? | B discriminates? | C discriminates? |
|---|---|---|---|
| EV-calculation failure | Partially (show pass/fail at pure choice) | No (contingent reasoning still in play) | **Yes — MPL-side result** |
| Ambiguity aversion / non-EU | At cross-θ pattern | At cross-θ pattern | At cross-θ pattern + MPL-side result |
| **UJS (Anujit's framework)** | Indirect (pass doesn't rule out UJS; fail consistent with many stories) | **Direct — contingent reasoning intact** | **Most direct — mechanism-level comparison** |

### Lead question for Anujit

> **"Between A, B, and C, which most sharply identifies UJS against the competing accounts? Specifically: does Proposal C's MPL-side result deliver the UJS prediction cleanly, or is there a fourth design we haven't considered?"**

### Secondary questions (if time)

- **Q3.** Is a parallel MPL incentive-only test novel, or does it look circular to a referee? (Probes Proposal C's defensibility.)
- **Q4.** Does the θ-pattern of failures carry UJS-specific predictions? (Probes whether to run 1 θ or 4 θ.)

### Target commitment

Leave with a ranked preference over A/B/C, or his proposed fourth design. Record as a new ADR tomorrow.

---

## Section 4 — MPL format (10 min, secondary)

### The state

ADR-0008 (multi-switching is descriptive, not fatal), ADR-0009 (dual-metric accuracy ε ∈ {0, 5pp}), ADR-0010 (HH instructions across formats) are committed. Format *itself* is not.

Seven options in §7 of MPL analysis doc; tentative lean on 7.5 (coarse separated, 15–20 rows, one per screen, random order) but uncommitted.

### The load-bearing argument (B&H's canonical ROCL story)

B&H 2018 conjecture: list format induces subjects to treat the RPS compound lottery as one large decision, which triggers them to apply reduction of compound lotteries (ROCL). Theorem: ROCL + non-EU ⇒ monotonicity violation. Separated format doesn't trigger ROCL, so non-EU preferences have no mechanism-level consequences. See `bh_rocl_intuition.md` (renamed and revised 2026-04-17 from strategy_space_restriction_intuition.md).

### The open question

The ROCL-triggering story addresses *cross-row* monotonicity. Belief elicitation has a *within-row* ambiguity/source-preference concern the cross-row mechanism doesn't close — B&H's rows compare two known-probability lotteries; our rows compare the (ambiguous) event bet against an (objective) r-lottery. See §8 of the revised doc.

### Lead question for Anujit

> **"B&H's ROCL-triggering mechanism addresses cross-row non-monotonicity cleanly. Belief MPL has a within-row ambiguity channel (event bet vs. r-lottery) that cross-row format doesn't close. Is the B&H transfer to beliefs clean enough at the cross-row level to commit to coarse separated (7.5), treating within-row ambiguity as a separate design problem? Or do we need the B&H-transfer auxiliary arm (§8 of MPL analysis doc, 100–150 extra subjects) to confirm the transfer before committing?"**

### Target commitment

Decide among: (a) go with 7.5 coarse separated, no auxiliary arm; (b) go with 7.5 + B&H auxiliary arm; (c) move to 7.6 (coarse separated + revise screen) or 7.7 (two-stage separated) to handle the within-row concern differently.

---

## Section 5 — Close (5 min)

### Force commitments

- What did we decide today? State it explicitly. "So: p-BDM test = Proposal [X]. MPL format = [Y or next meeting]."
- Write it down while he's watching.

### Next-meeting agenda (flag, don't discuss)

- §10 criteria 4–7 (B&H auxiliary arm decision, revise screen, burden budget, precision)
- Final sample size
- Pre-registration drafting
- H4 complexity-interaction design (prior vs. posterior within-subject)

### Open offers

- Draft section for him to review (e.g., the theory section once the IC foundation + UJS split is written up)
- Pilot data re-analysis under the new framing (if useful)

---

## Appendix — Quick-reference materials to have ready

**Tabs to have open:**

- `quality_reports/advisor_meeting_2026-04-17/01_p-bdm-design-space-synthesis.md` (the full p-BDM analysis)
- `quality_reports/bh_rocl_intuition.md` (the MPL format argument — B&H ROCL-triggering story)
- `experiments/designs/decisions/README.md` (the ADR index, if he wants to see the decision trail)
- DVW 2024 JEP pp. 144–149 (the source for the 69% finding)

**Numbers to have at hand:**

- DVW JEP p-BDM headline: **69% choose q=0 at θ=0.2**; at θ=0.2, no-info treatment has 7% distant-and-toward-zero reports, info treatment has 21% (info hurts).
- B&H 2018 list vs. separated (risk): list p=0.041, separated p=0.697.
- C&K 2025 multi-switching: 29.7% among attentive, 43.7% full sample.
- B&W 2018 reverse-report rate under TK format: 17%.
- H&L 2002 multi-switching: 16%.

**Decisions already committed (don't relitigate):**

- ADR-0002: no preference-for-control arm (urn draws eliminate Hypothesis B).
- ADR-0003: single comprehension mechanism (contingent reasoning).
- ADR-0008: multi-switching descriptive, not a threshold.
- ADR-0009: dual-metric accuracy, ε ∈ {0, 5pp}.
- ADR-0010: HH-style instructions.
- ADR-0012: Azrieli monotonicity is the IC foundation.
- ADR-0013: UJS is the behavioral failure framework.
- ADR-0014: mechanism invariance is the design-level anchor.
