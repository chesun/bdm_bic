# p-BDM Incentive-Only Test — Design Space Synthesis

**Purpose:** Crystallize the p-BDM design space ahead of the 2026-04-17 meeting with Anujit Chakraborty. This is Step 1 of the meeting prep (deep read → questions → walkthrough doc).

**Sources:** `mpl_format_decision_analysis.md` §12; ADR-0006, ADR-0011; `research_direction_discussion_2026-04-07.md` Point 6.

---

## 1. The test we need

**H1b (Condition 2 of BIC, per Danz et al. 2024 JEP):**
When presented as a pure choice over incentives — stripped of belief formation — can subjects identify the payoff-maximizing option under p-BDM at a known induced belief θ?

**What we know from DVW JEP 2024:**

- At θ = 0.2, **69% of subjects opt for the event-independent choice** (q = 0) rather than the maximizer (q = 0.2).
- DVW's full p-BDM incentive-only methodology is **not public** (confirmed via deep search 2026-04-14). Working paper "The Pure-Incentives Test" lists it on Danz's site as work-in-progress with no draft.
- For BSR, DVW 2022 (AER) gives the full methodology: an 11-option menu A–K displaying pairs of event-contingent winning probabilities, hiding the implied q column.

**What this means:** we must design our own p-BDM version. Email to Danz went out 2026-04-15; even a reply wouldn't remove the need to make design choices ourselves.

---

## 2. Why the mechanism fails — the interpretive frame

DVW's 69%-at-q=0 result has a clean reading: under p-BDM at induced θ = 0.2, the subject-facing tradeoff at q = 0 is (P(win | E), P(win | not-E)) = (0.5, 0.5) — **event-independent**. At q = θ = 0.2, the tradeoff is (0.295, 0.095) — highly event-dependent.

The same pattern at BSR (DVW 2022) manifests as **centering** (q = 0.5). Under p-BDM it manifests as **extremeness** (q = 0). Same behavioral failure (preference for event-independent payoffs); different report-space location depending on the scoring rule.

This is exactly the UJS-consistent story (C&K 2025, ADR-0013): the mechanism demands that subjects pick an option whose payoff is contingent on an uncertain event, but the event-independent option is always *one of* the justifiable-sounding choices. Under UJS, only the dominant action should be justifiable; but p-BDM (and BSR) admit multiple justifiable actions from the subject's perspective.

**Key framing for Anujit:** our test has the ability to show both that p-BDM fails the pure-incentives test (extending DVW) AND that the failure pattern matches the UJS prediction (his framework's key implication).

---

## 3. Open design dimensions (per ADR-0011 and MPL analysis §12.3)

| Dimension | Options | What's at stake |
|---|---|---|
| **Menu structure** | (a) 11-option discrete menu (BSR-analog); (b) continuous slider (matches p-BDM native report); (c) coarse discrete (5–7 options) | Discrete is interpretable; continuous matches the mechanism being tested |
| **Payoff display** | (a) Event-contingent win-prob pairs (DVW Table 1 style); (b) Native p-BDM framing (event bet vs. r-lottery with explicit r); (c) Both, back-to-back within subject | (a) strips the mechanism entirely; (b) preserves contingent-reasoning demand, which is the UJS story |
| **Induced θ values** | (a) Single θ = 0.2 (DVW); (b) Four θ values {0.2, 0.4, 0.6, 0.8} matching B&W 2018; (c) Full {0.1, 0.3, 0.5, 0.7, 0.9} | More θ values → stronger within-subject test of whether the failure pattern is θ-invariant |
| **Integration with main arm** | (a) Within-subject, after main BDM; (b) Between-subject, separate arm; (c) Within-subject, before main BDM | Within-subject gets a correlation (do MPL-succeeders also pass H1b?) but risks contamination |
| **MPL counterpart** | (a) No — H1b is BDM-specific; (b) Yes — parallel incentive-only MPL test | This is potentially the **most novel contribution** — confirms MPL passes pure incentives while BDM fails |
| **Sample size** | Anchor on DVW's 69% at θ=0.2 | With 4 θ values and dual metric (ε = 0, ε = 5pp), power requirements are modest (~200 subjects per arm) |

---

## 4. Three concrete design proposals

Each proposal makes a consistent set of choices across the dimensions above. These are the options to put in front of Anujit.

### Proposal A: "Strict DVW replication" — discrete menu, hide mechanism

- **Menu:** 11-option discrete (q = 0, 0.1, ..., 1.0)
- **Display:** event-contingent win-prob pairs (P(win | E), P(win | not-E)). Implied q is hidden.
- **θ values:** 4 induced values {0.2, 0.4, 0.6, 0.8} within-subject
- **Integration:** within-subject, immediately after main BDM arm
- **MPL counterpart:** No
- **N:** 300 (single arm; within-subject across θ)

**What this tests:** Can subjects identify the maximizer in a pure-choice setting that has been stripped of the p-BDM mechanism entirely? Yes/no at each θ.

**Strengths:**
- Directly comparable to DVW 2022 BSR methodology and DVW 2024 JEP p-BDM result.
- Unambiguous interpretation: failure here = failure to identify EV-maximizer from pure incentives.
- Clean dependent variable.

**Weaknesses:**
- Does not test contingent reasoning specifically — only pure choice. So a pass on this test doesn't rule out that H3 (contingent reasoning failure) drives the H1 result; it just rules out EV-calculation failure as the story.
- Because the mechanism is stripped, it doesn't speak directly to UJS (which is a mechanism-level property).
- Doesn't engage Anujit's framework directly.

---

### Proposal B: "UJS-aligned pure incentives" — native framing, contingent-reasoning-preserving

- **Menu:** 11-option discrete (q = 0, 0.1, ..., 1.0)
- **Display:** Native p-BDM framing. For each option, show: "If you report q=X, a random r is drawn from [0,100]. If r ≤ X, you play the event bet (wins if E, P(E) = θ). If r > X, you play the r-lottery (wins with probability r/100)." Subject picks q knowing θ.
- **θ values:** 4 induced values {0.2, 0.4, 0.6, 0.8} within-subject
- **Integration:** within-subject, before main BDM (to avoid instruction contamination)
- **MPL counterpart:** No
- **N:** 300

**What this tests:** Can subjects identify the maximizer when the mechanism is fully explained and they must reason contingently across the r-space? Same discrete menu as A, but with the cognitive load of the contingent reasoning intact.

**Strengths:**
- Directly tests the UJS prediction: if subjects fail even with θ known, it's because the mechanism doesn't make the dominant strategy obviously justifiable (ADR-0013).
- The comparison "pass A but fail B" (if we also ran A) would isolate contingent reasoning as the specific failure channel — textbook UJS.
- Engages Anujit's framework directly.

**Weaknesses:**
- Not strictly "pure incentives" (ADR-0006 insight: Condition 2 for BDM may not have a clean pure-incentives form). Some would call this an uninterpretable hybrid of Condition 1 and Condition 2.
- Departs from DVW methodology; loses the clean replication.

---

### Proposal C: "Parallel BDM + MPL incentive-only test" — the novel extension

- **Menu:** 11-option discrete for p-BDM arm (as in A); for MPL arm, each row asks "event bet vs. r-lottery" with known θ and r (essentially what MPL already is, but stripped of the belief-elicitation framing)
- **Display:** p-BDM side uses event-contingent pairs (Proposal A style); MPL side uses row-by-row binary choices with known θ (e.g., "θ = 70%. Do you prefer event bet [70% winning] or 40% lottery [40% winning]?")
- **θ values:** {0.2, 0.4, 0.6, 0.8} within-subject
- **Integration:** Between-subject on mechanism (p-BDM incentive-only vs. MPL incentive-only). Within-subject across θ.
- **MPL counterpart:** Yes — this is the distinguishing feature.
- **N:** 300 per mechanism arm = 600 total

**What this tests:** Three things simultaneously:
1. (p-BDM side) Replicates DVW 69% at θ=0.2 and extends to θ ∈ {0.4, 0.6, 0.8}.
2. (MPL side) Shows MPL passes the pure-incentives test — first published evidence for this.
3. Head-to-head: the gap between p-BDM and MPL on the pure-incentives metric directly tests the UJS prediction (MPL has a unique justifiable choice per row; p-BDM does not).

**Strengths:**
- **Most novel contribution.** The MPL pure-incentives result is absent from DVW 2024 JEP; their working paper may or may not contain it.
- Directly operationalizes the UJS comparison at the pure-incentives level — not just the belief-elicitation level.
- Cleanly separates H1 (BDM fails pure incentives) from H2 (MPL > BDM despite theoretical equivalence) into two distinct empirical claims, each with its own test.

**Weaknesses:**
- Double the sample size (budget).
- The MPL incentive-only test may feel redundant to a referee ("each MPL row already is a pure-incentives test"). Framing is important: the contribution is *showing the gap closes* when the mechanism is stripped, not that MPL subjects pick correctly per se.
- Logistics: two arms, two sets of instructions, comprehension checks for each.

---

## 5. Concrete implementation examples (θ = 0.2)

To make each proposal concrete, here is what a subject would actually see on their screen at induced belief θ = 0.2. The paradigm is an urn with 20 red and 80 blue balls; event E = "red ball drawn"; P(E) = 0.2 is the induced belief.

### 5.1 Payoff math the proposals all rest on

Under p-BDM with reported q, the subject receives:

- The **event bet** (wins $H if E, $0 if not-E) if q ≥ r, where r ~ uniform[0,1] is a random draw.
- The **r-lottery** (wins $H with probability r, independent of E) if q < r.

Given event state and report q, the winning probabilities work out to:

- P(win | E, q) = q + (1 − q²) / 2
- P(win | not-E, q) = (1 − q²) / 2
- EV (win prob) = θ · P(win | E, q) + (1 − θ) · P(win | not-E, q) = θ·q + (1 − q²) / 2

Maximizing over q: derivative is θ − q; maximizer is q* = θ. So at θ = 0.2, the correct report is q = 0.2.

At θ = 0.2, the 11 discrete options look like this:

| Option | q | P(win \| E) | P(win \| not-E) | EV (win prob) |
|---|---|---|---|---|
| A | 0.0 | 0.500 | 0.500 | 0.500 ← event-independent |
| B | 0.1 | 0.595 | 0.495 | 0.515 |
| **C** | **0.2** | **0.680** | **0.480** | **0.520 ← MAXIMIZER** |
| D | 0.3 | 0.755 | 0.455 | 0.515 |
| E | 0.4 | 0.820 | 0.420 | 0.500 |
| F | 0.5 | 0.875 | 0.375 | 0.475 |
| G | 0.6 | 0.920 | 0.320 | 0.440 |
| H | 0.7 | 0.955 | 0.255 | 0.395 |
| I | 0.8 | 0.980 | 0.180 | 0.340 |
| J | 0.9 | 0.995 | 0.095 | 0.275 |
| K | 1.0 | 1.000 | 0.000 | 0.200 |

**Note the crucial feature of this table:** the EV gap between the maximizer (C, EV = 0.520) and the event-independent choice (A, EV = 0.500) is only **2 percentage points**. The event-independent option is the second-worst-on-average-but-safest: guaranteed 50% win probability regardless of event. This tiny EV gap, combined with the "guaranteed" feel of option A, is plausibly why DVW find 69% pick option A. Any p-BDM incentive-only test at θ = 0.2 is testing whether subjects can identify a 2pp EV advantage that comes with event-contingent variance over a flat 50% baseline.

### 5.2 Proposal A — Concrete implementation

**Screen mockup (θ = 0.2):**

> **Urn composition:** 20 red, 80 blue. We will draw one ball.
>
> **Event E:** the ball is red (probability exactly 20%).
>
> **Your task:** choose one of the 11 options below. Each option pays $H if you win, $0 if you lose. Pick the option that gives you the highest chance of winning.
>
> |  | If red drawn (P = 20%) | If blue drawn (P = 80%) |
> |---|---|---|
> | Option A | 50% chance to win | 50% chance to win |
> | Option B | 59.5% chance to win | 49.5% chance to win |
> | Option C | 68% chance to win | 48% chance to win |
> | Option D | 75.5% chance to win | 45.5% chance to win |
> | Option E | 82% chance to win | 42% chance to win |
> | … | … | … |
> | Option K | 100% chance to win | 0% chance to win |

**Implied q column is hidden.** Subjects see only the event-contingent win probabilities. They are not told these correspond to p-BDM reports. Instructions explain the task as "pick the option that maximizes your chance of winning, given P(E) = 20%."

**Within-subject rounds:** same structure at θ ∈ {0.2, 0.4, 0.6, 0.8}. Urn composition changes each round (20/80, 40/60, 60/40, 80/20). Maximizers shift accordingly (option C at θ=0.2; option E at θ=0.4; etc.).

**Operationalization of failure:** the subject "fails" at a given θ if they pick an option whose q is more than ε = 0 or ε = 5pp from the maximizer's q (dual metric per ADR-0009). The headline DVW-analog result is % of subjects choosing the event-independent option (q = 0) at each θ.

---

### 5.3 Proposal B — Concrete implementation

**Screen mockup (θ = 0.2):**

> **Urn composition:** 20 red, 80 blue. We will draw one ball.
>
> **Event E:** the ball is red (probability exactly 20%).
>
> **How the mechanism works:** you will pick a report q from 0 to 100. A random number r is then drawn uniformly from 0 to 100.
>
> - If q ≥ r: you play the **event bet** — you win $H if the ball is red, $0 if the ball is blue.
> - If q < r: you play the **r-lottery** — you win $H with probability r/100, independent of the ball color.
>
> **Your task:** choose one of the 11 reports below. Which maximizes your chance of winning?
>
> | Option | Report q | If r ≤ q (event bet) | If r > q (r-lottery) |
> |---|---|---|---|
> | A | 0 | (never happens) | random r from 0–100; win with probability r/100 |
> | B | 10 | win if red (P=20%) | random r from 10–100; win with probability r/100 |
> | C | 20 | win if red (P=20%) | random r from 20–100; win with probability r/100 |
> | D | 30 | win if red (P=20%) | random r from 30–100; win with probability r/100 |
> | … | … | … | … |
> | K | 100 | win if red (P=20%) | (never happens) |

**Key difference from Proposal A:** subjects see the native p-BDM mechanism. They must reason through "what happens if r falls in each range, given each possible q?" to identify the maximizer. The contingent reasoning demand is intact — which is exactly what UJS (ADR-0013) predicts makes the mechanism fail.

**Within-subject rounds:** same θ ∈ {0.2, 0.4, 0.6, 0.8} as Proposal A. Maximizer is still q = θ (100θ on the 0–100 scale).

**What this distinguishes from A:**

- If a subject fails A and fails B at similar rates → failure is about *identifying the EV-maximizer from a menu*, not about contingent reasoning. EV-calculation difficulty is the story.
- If a subject passes A but fails B → failure is about contingent reasoning. UJS is vindicated. This is the sharpest UJS test.
- If a subject fails A but passes B → unexpected; would need follow-up.
- A within-subject design that does both A and B (not currently proposed) would isolate this exactly. Flag as a variant to discuss.

---

### 5.4 Proposal C — Concrete implementation

**Between-subject:** half the sample sees the p-BDM incentive-only test (as in Proposal A). The other half sees an MPL incentive-only test.

**MPL-side screen mockup (θ = 0.2, one row per screen, random order):**

> **Urn composition:** 20 red, 80 blue. We will draw one ball.
>
> **Event E:** the ball is red (probability exactly 20%).
>
> **Your task:** choose one of the two options below. Each pays $H if you win, $0 if you lose.
>
> - **Option A (event bet):** win if the ball is red. Probability of winning: 20%.
> - **Option B (40% lottery):** win with probability 40%, regardless of ball color.

**Correct answer:** Option B (40% > 20%).

**Row set:** for a given θ, the subject sees 10–15 rows at r ∈ {5, 10, 15, 20, 25, 30, 40, 50, 70, 100}% (or a similar coarse set). At each row, the correct answer is event bet if r < θ, r-lottery if r > θ. The subject should switch from event bet to r-lottery at r = θ.

**At θ = 0.2:**

| Row (r) | Event bet win prob | r-lottery win prob | Correct choice |
|---|---|---|---|
| 5% | 20% | 5% | Event bet |
| 10% | 20% | 10% | Event bet |
| 15% | 20% | 15% | Event bet |
| 20% | 20% | 20% | Indifferent |
| 25% | 20% | 25% | r-lottery |
| 30% | 20% | 30% | r-lottery |
| 40% | 20% | 40% | r-lottery |
| 50% | 20% | 50% | r-lottery |
| 70% | 20% | 70% | r-lottery |
| 100% | 20% | 100% | r-lottery |

**Operationalization of success:** subject "passes" the MPL incentive-only test at θ if their pattern is monotone and their crossing point is within 5pp of θ. This is the direct analog of the Proposal A failure metric.

**Within-subject rounds:** same θ ∈ {0.2, 0.4, 0.6, 0.8} as Proposals A and B. MPL-side subjects see 4 × 10 = 40 binary rows in random order. p-BDM-side subjects see 4 menu choices.

**The headline comparison in Proposal C:**

- p-BDM pure-incentives failure rate: expected ~50–70% at θ = 0.2 (DVW anchor).
- MPL pure-incentives failure rate: expected ~5–15% at θ = 0.2 (our prediction based on UJS — each binary row has an obviously dominant action, so failure requires comprehension error, ambiguity aversion, or inattention, all of which are small in single-row comparisons).
- **If this gap holds, the H2-style claim "MPL > BDM" survives even when belief formation is stripped away.** That's the UJS mechanism at its purest: the *format*, not the belief task, is what drives BDM's failure.

---

## 6. Where each proposal hits the decision log

| Proposal | ADR-0006 alignment | ADR-0011 resolution | Impact on H1b | Impact on H2 | Impact on UJS story |
|---|---|---|---|---|---|
| A | Option A-leaning | Resolves menu/display/θ/integration; defers MPL counterpart | Direct test, strict | None | Indirect |
| B | Hybrid (Option A-style display, Option D-style logic) | Same as A but native framing | Direct test, UJS-flavored | None | Direct |
| C | Option A for both mechanisms | Resolves everything plus MPL counterpart | Direct test for p-BDM | **Adds a second H2-style test** at the pure-incentives layer | **Direct and primary** |

---

## 7. The open question Anujit should answer (our lead ask)

Of the three proposals, **which one most sharply identifies the UJS prediction** against competing accounts of the 69% finding?

- Competing account 1: **General difficulty of EV calculation.** Subjects pick q=0 because computing expected winnings is hard. Predicts failure in ALL pure-incentives tests (BSR, p-BDM, MPL). Proposal C's MPL-side result discriminates: if MPL passes pure incentives and p-BDM fails, general EV-calculation difficulty is ruled out.
- Competing account 2: **Ambiguity aversion / non-EU preferences.** Subjects pick q=0 because the event bet's payoff is ambiguous even at known θ (source preference, Ellsberg-style). Predicts failure at all θ but especially at extreme θ. Proposal B (native framing, multiple θ) gives us a θ-pattern that discriminates.
- Competing account 3: **UJS (our story, Anujit's framework).** p-BDM fails because the dominant action is not justifiable in the sense C&K define. Predicts (a) failure is mechanism-specific (fails under p-BDM, passes under MPL — Proposal C), (b) failure is not eliminated by stripping the mechanism explanation (Proposal A alone is not a fair UJS test), (c) failure correlates with within-subject confusion about which action is justifiable, not with arithmetic ability.

**The question for Anujit:**
> "Which of these three tests would you consider the cleanest discriminator between UJS-driven failure and an EV-calculation failure?"

Our prior from reading his paper: he'll lean toward Proposal C with the MPL counterpart, because it's the one that isolates mechanism-level properties (which is what UJS is about). But he may also surface a fourth option we haven't considered.

---

## 8. What we are not asking him

- Whether UJS is the right framework (ADR-0013 commits to this; he's the author; asking would be weird).
- Whether to include H1a (info/no-info) — already committed (ADR's collection implies this).
- Whether Azrieli is the right IC foundation (ADR-0012; not contested).
- MPL format minutiae within the §10 criteria 4–7 (these are secondary; use as time-filler if available).

---

## 9. Cross-references

- `mpl_format_decision_analysis.md` :: §12 (deep p-BDM treatment)
- `research_direction_discussion_2026-04-07.md` :: Point 6 (Options A–E for Condition 2)
- ADR-0006 (Condition 2: prioritize A + D)
- ADR-0011 (p-BDM: design from scratch)
- ADR-0013 (UJS scoped to behavioral failure)
- DVW 2024 JEP 38(4), pp. 144–149
- Chakraborty & Kendall (2025) — UJS framework
