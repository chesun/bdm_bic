# Questions for Anujit — 2026-04-17 Meeting

**Goal:** Leave with committed decisions on 1–2 items. Primary target: p-BDM incentive-only test design (H1b). Secondary: MPL format commitment. Gate: confirm overall design is not broken before spending time on details.

**Context he has:** last substantive view was the 2022 pilot + old draft, not the reformulated "why does BDM fail BIC?" direction, not the UJS-centered theoretical framing. The first ~5 min re-orient him.

**Context he brings:** he is Chakraborty of Chakraborty & Kendall 2025 (UJS) — the behavioral failure theory (ADR-0013) is his paper. Do not reintroduce UJS. Do engage him on what UJS predicts and rules out.

---

## Tier 1 — Must-ask (decisions we want to commit tomorrow)

### Q1. Overall design: anything obviously broken or missing before we lock it?

**Unblocks:** the whole 4-arm design plus H1b diagnostic plus the within-subject complexity variation — everything downstream from today's meeting rests on this not having a glaring hole.

**Setup:** walk through Section 2 of the walkthrough doc in ≤5 minutes. Arms, within-subject manipulation (easy / hard beliefs), ADRs already committed, sample size, open live asks.

**The actual question:**
> "Before I dig into p-BDM design: is there anything in this overall structure you'd push back on? Missing arm, missing control, confound we haven't spotted, referee-bait we're setting up? Specifically — (a) is the 4-arm setup (BDM-full / MPL / BDM-min / flat-fee) the right identification structure for H1–H4, (b) should we include a BSR arm for direct within-study comparison with Danz et al., (c) is the within-subject easy/hard manipulation strong enough to identify H4?"

**Why we're asking him first:** if there's a first-order issue with the design, we want to hear it before we spend 25 min on p-BDM details that may need to change anyway. This is also the only Tier-1 question that can't be asked later — once we commit to p-BDM/MPL decisions, the scaffolding around them is locked.

**Commit target:** if he flags something, decide on the spot whether it requires a plan change or a follow-up task. Don't let vague "hmm, maybe think about X" feedback go un-pinned — clarify whether it's a live blocker or a note-for-later.

---

### Q2. p-BDM incentive-only test: which of the three proposals discriminates UJS most sharply?

**Unblocks:** ADR-0011 → multiple follow-on ADRs on menu, display, θ values, integration, MPL counterpart.

**Setup:** Walk through §4 of `01_p-bdm-design-space-synthesis.md` — Proposals A (DVW replication), B (native framing), C (parallel BDM + MPL incentive-only).

**The actual question:**
> "Between these three, which one most sharply identifies UJS against competing accounts (EV-calculation failure, ambiguity aversion)? Specifically: does Proposal C's MPL-side result — MPL passes pure incentives while p-BDM fails — deliver the UJS prediction cleanly, or is there a fourth design we haven't considered?"

**Why we're asking him specifically:** he knows which behavioral pattern is UJS-consistent at the finest grain. A referee pushing back on the design will ask "couldn't this just be X?" where X is one of the competing accounts. We want a design that pre-empts the sharpest version of that critique.

**Commit target:** leave with a ranking of A/B/C (or a fourth design) plus a clear rationale we can record as an ADR.

---

### Q3. Does B&H's ROCL-triggering mechanism transfer to belief elicitation?

**Unblocks:** MPL format decision (7.1–7.7 per §7 of MPL analysis doc); whether the tentative 7.5 lean (coarse separated) is defensible.

**Setup:** Walk through §3–§5 of `bh_rocl_intuition.md` (the canonical B&H story: list format triggers subjects to apply ROCL to the compound RPS lottery; ROCL + non-EU ⇒ monotonicity violation; separated format doesn't trigger ROCL, so non-EU preferences have no mechanism-level consequences). Then surface §8 — the open belief-specific question.

**The actual question:**
> "B&H's ROCL-triggering story is for risk preferences with fully specified lotteries in each row. In belief MPL, one option per row (the event bet) is ambiguous — winning probability = subject's belief π. Even at the single-row level, a subject may have source preference or ambiguity aversion between the event bet and the r-lottery. This is a within-row non-monotonicity channel that separated format doesn't close. Does the B&H result still transfer cleanly to beliefs at the cross-row level (suppressing the ROCL pathway), or does the within-row ambiguity channel dominate and render the transfer moot?"

**Why we're asking him:** he'll have a strong intuition for whether B&H's result (2018) transfers to beliefs — this is an open question in ADR-0005. If the transfer is clean at the cross-row level, 7.5 (coarse separated) handles the ROCL-driven IC threat; within-row ambiguity becomes a separate design problem (instructions, urn transparency). If the transfer isn't clean, we need either an auxiliary B&H-transfer test (§8 of MPL analysis doc) or a different format.

**Commit target:** his judgment on whether (a) belief transfer is clean enough to go with 7.5 without auxiliary test, (b) we need the auxiliary test, or (c) a different format (7.6 revise screen, 7.7 two-stage separated) better handles the within-row concern.

---

## Tier 2 — Ask if time allows (sharpens decisions but not strictly needed tomorrow)

### Q4. Is running an incentive-only test for MPL redundant or novel?

**Unblocks:** whether Proposal C is worth the doubled sample.

**Setup:** "Each MPL row already is a binary choice between known options. What does an 'MPL incentive-only test' even mean beyond the MPL itself?"

**The actual question:**
> "If we run an MPL incentive-only test in parallel with p-BDM (Proposal C), is the result — 'MPL passes pure incentives' — a meaningful finding, or does it look circular to a referee? Specifically: does the framing 'the gap between p-BDM and MPL survives even when belief formation is stripped' buy us contribution in your view?"

**Possible outcomes:**
- He says "yes, that's the contribution" → commit to Proposal C.
- He says "it's circular" → drop the MPL counterpart, go with Proposal A or B.
- He says "neither — run it differently" → new design input.

---

### Q5. θ values: just 0.2, or the full {0.2, 0.4, 0.6, 0.8}?

**Unblocks:** burden budget; sample size.

**Setup:** DVW report only θ = 0.2. B&W 2018 use 4 θ values as their standard. The pattern of failure across θ could itself discriminate UJS from ambiguity-aversion.

**The actual question:**
> "Does the θ-pattern of the incentive-only failure rate carry theoretical weight? Under UJS, is there a predicted shape (e.g., failure rate monotonic in how event-dependent the maximizer is), or is the θ-invariance prediction the sharper one? Put differently: which θ values best discriminate UJS from alternatives?"

---

### Q6. Does the Brown & Healy auxiliary transfer test (§8 of MPL analysis doc) add enough to justify its cost?

**Unblocks:** §10 criterion 4 (open item in ADR log).

**Setup:** Adapting B&H's within-subject list-vs-separated comparison to belief MPL with induced probabilities; 100–150 extra subjects; settles the transfer question independent of our main result.

**The actual question:**
> "Given our main design commits to separated format, do we *need* the auxiliary B&H-transfer arm to defend the IC assumption, or is citing B&H 2018 + Azrieli 2018 sufficient?"

---

## Tier 3 — Signals to watch for, not explicit asks

These don't get voiced unless he raises them — they're things his reactions will tell us.

- **S1. His reaction to the ADR log.** If he's skeptical of the append-only structure, we may be over-engineered. If he likes it, commit to continuing.
- **S2. How much he's tracking the p-BDM literature.** If he surfaces DVW's working paper or other incentive-only papers we haven't found, that's a big lit gap to close.
- **S3. Whether he pushes on H4 (complexity interaction).** Not on tomorrow's agenda but the "gap widens with Bayesian updating" prediction is where this project could really stand out; a nudge from him would escalate it.
- **S4. His opinion on between- vs. within-subject integration.** Casual remark might resolve a decision we haven't committed.

---

## Tier 4 — Things NOT to raise (keep focus)

- OSP vs. UJS distinction (settled in ADR-0013).
- Preference for control arm (settled in ADR-0002).
- Specific ε values for the dual-metric (settled in ADR-0009).
- Instruction format (settled in ADR-0010; use HH).
- Whether to test Condition 1 (info/no-info) — built into the design; not in question.

---

## Meeting close (last 5 min)

- **Commit 1 item.** Force closure on Q1 or Q2. Bias toward Q1 (p-BDM test is more novel and his framework directly predicts).
- **Next-meeting agenda.** MPL format commitment, §10 criteria 4–7, pre-registration drafting.
- **Any follow-ups he wants?** Lit pointers, people to email, draft sections to review.
