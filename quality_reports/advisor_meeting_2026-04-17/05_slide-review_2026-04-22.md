# Slide Review — 04_slides.tex, pre-Thursday (2026-04-23) meeting

**Reviewer:** Claude
**Date:** 2026-04-22
**Target file:** `quality_reports/advisor_meeting_2026-04-17/04_slides.tex` (15 pages, 169 KB, compiles)
**Scope:** Deep review of the current edited deck, with attention to (a) substantive bugs, (b) consistency with the ADR log and the Questions-for-Anujit doc, (c) framing honesty given the 2026-04-20 identification analysis, (d) cosmetic issues.
**Context:** Meeting moved from 2026-04-17 to 2026-04-23. Since the last session log (2026-04-20), the only edit is the removal of one sentence from the Contribution bullet on the RQ slide — the DVW θ-extension replication claim.

---

## Headline

The deck is close to meeting-ready. Fifteen pages, logical arc (literature → RQ → hypotheses → design → Q1 → p-BDM deep dive [Q2] → MPL format deep dive [Q3]), Proposal A/B/C example slides work. **One substantive bug** (dangling `H4` reference), **one consistency issue** (internal jargon leaked past the 2026-04-20 scrub on the design table), and **one framing concern** (Q2's three-account discrimination analysis is too compressed and slightly overclaims). Nothing structural — everything here is an edit-in-place fix.

---

## Blocking fixes (do before Thursday)

### BUG-1 — Dangling H4 reference on the Design slide

**Location:** line 80.

```
Within-subject: priors (easy) and posteriors after signals (hard). Identifies H4.
```

The current hypothesis set (frame 4, lines 51–57) is **H1(a,b), H2, H3**. `H4` does not exist. This is a leftover from before the 2026-04-20 renumber, which demoted the old H3 (contingent reasoning) into H2 (now the UJS formal-property claim) and promoted the old H4 (complexity interaction) to H3. The rest of the deck was updated — this line was missed.

**Fix:** change `H4` to `H3` on line 80.

Sanity check: grep for H-references in the deck shows consistent use of H1/H2/H3 everywhere else. See `grep -n "H[1-9]"` output in this review's prep notes.

---

### CLEANUP-1 — Internal jargon on the Design table (lines 72–73)

Carryover from ADR-0006 / DVW-JEP taxonomy. The 2026-04-20 pass scrubbed ADR references and internal process language but missed the "condition 1" / "condition 2" labels in the Identifies column.

Current:

```
3 & Single-report BDM & No info & H1a Info/no info test, condition 1 \\
4 & Pure incentive test & --- & H1b pure incentive test, condition 2 \\
```

Issues:
- "condition 1 / condition 2" is DVW-JEP / ADR-0006 shorthand. Anujit has not seen that taxonomy in the slides (good — we decided not to re-introduce ADR concepts). Seeing the bare number will look like unexplained jargon.
- Row 4 says "pure incentive test" twice (once in Mechanism, once in Identifies).

**Suggested fix:**

```
3 & Single-report BDM & No info & H1a: info/no-info test \\
4 & Pure-incentives test & ---  & H1b: direct test \\
```

Or, if you want to keep the parallel structure, use "diagnosis" wording:

```
3 & Single-report BDM & No info & Diagnoses H1a \\
4 & Pure-incentives test & --- & Diagnoses H1b \\
```

Either is a one-minute edit. Pick whichever voice matches the rest of the table.

---

### FRAMING-1 — Q2's three-account discrimination analysis is too compressed and slightly overclaims

**User disposition (2026-04-22):** Tabled. Keep the current slide text; nuance will be carried verbally in the meeting.

**Location:** frame 12 ("Question 2: which proposal?"), lines 210–213.

Current:

> Proposal A rules out (1) only weakly and is silent on UJS. Proposal B preserves the contingent reasoning demand and provides a direct UJS test. Proposal C also runs the MPL mechanism as a pure-incentives test; if MPL passes where p-BDM fails, UJS is the clear explanation.

Three specific problems:

1. **"A rules out (1) only weakly."** Actually, A is the cleanest test of (1). If subjects can identify the maximizer when the mechanism is hidden and only event-contingent payoffs are shown, EV-calculation is not the bottleneck. A's real limitation is that it is silent on UJS (because the mechanism is hidden). "Silent on UJS" is right; "rules out (1) only weakly" is wrong direction.

2. **"B ... provides a direct UJS test."** B preserves the contingent-reasoning demand that UJS predicts is the source of failure, so a UJS-consistent outcome there would be suggestive. But B alone does not discriminate UJS from ambiguity aversion or non-EU concerns, because the event bet is ambiguous even at known θ. Calling B a "direct UJS test" is stronger than what the design delivers — and Anujit will notice immediately because he's the UJS author.

3. **"In C, if MPL passes where p-BDM fails, UJS is the clear explanation."** Also too strong. C's p-BDM side uses A-style display (mechanism hidden). If MPL passes and A-style p-BDM fails, that rules out EV-calculation difficulty as the driver (because MPL requires EV comparison within each row). But it does not cleanly rule out ambiguity aversion, because the ambiguity of the event bet is preserved in both mechanisms. The gap is consistent with the UJS formal-property account *and* with format-level differences in how the subject integrates across options (which may or may not be "UJS" depending on how narrowly you read C&K 2025).

**Suggested rewrite (verbal flow preserved, honesty tightened):**

> - Proposal A tests EV-calculation directly: if subjects find the maximizer with the mechanism hidden, (1) is ruled out.
> - Proposal B preserves the native p-BDM reasoning demand. A UJS-consistent failure pattern here is suggestive, but B alone doesn't separate UJS from (2) — both predict failure.
> - Proposal C adds the MPL mechanism under pure incentives. If MPL passes where A-style p-BDM fails, (1) is ruled out and the residual gap is consistent with the UJS formal-property account; (2) remains a partial concern because the event bet is ambiguous in both.

This version is longer but says what is actually true. It also gives Anujit a cleaner hook — he'll answer the "is the residual gap UJS-specific, or does ambiguity aversion contaminate?" question directly.

Two choices for the slide:
- (a) Swap in the rewrite. Longer slide, but truth-in-advertising.
- (b) Keep the compressed version as a verbal prompt and carry the tighter analysis in your head for the walkthrough. Works if you trust the meeting to be conversational.

My preference is (a) — Anujit is the UJS author and will read Q2 carefully.

---

## Content tweaks (worth considering, not blocking)

### TWEAK-1 — H1 "via two weak conditions" (line 51)

**User disposition (2026-04-22):** Withdrawn. "Weak conditions" is DVW 2022 AER's own terminology; the deck is intentionally adopting their convention. Keep as-is.

~~"Weak" is doing ambiguous work. In the DVW/BIC literature, "weak" sometimes means "necessary but not sufficient"; here it probably means "the two conditions are minimal failure diagnostics." Anujit may read the adjective as a hedge on the hypothesis's strength.~~

~~**Suggestion:** replace with "diagnosed by two conditions" or drop "weak":~~

```
\item[H1.] BDM fails behavioral IC, diagnosed by two conditions:
```

### TWEAK-2 — H1a null-form framing (line 53)

> \item[H1a.] Explaining BDM's incentives does not increase accuracy.

The hypothesis is written as a null-result claim. That's what the paper predicts (information doesn't close the BIC gap because the gap isn't a comprehension failure), but phrasing it this way can read as "null hypothesis that the intervention works." A reader may see "not" and wonder whether the project is testing a null or making a substantive claim.

**Suggestions:**
- Keep as-is but add a parenthetical gloss: `Explaining BDM's incentives does not increase accuracy (info/no-info comparison).`
- Or flip to positive framing with negation inside: `The info/no-info gap is zero in accuracy.`
- Or fold into a single sentence: `Accuracy does not improve when the mechanism is explained.`

Minor — pick one, or leave alone if you're confident in the verbal setup.

### TWEAK-3 — Contribution sentence after your edit (line 46)

You cut "The replication also extends DVW's p-BDM finding to four values of θ." The remaining three items are:

1. "identify the mechanism behind BDM's failure"
2. "test UJS's design implication empirically in belief elicitation"
3. "measure the complexity-by-mechanism interaction"

Two thoughts:

- **"Identify the mechanism"** is stronger than what the design identifies. Per the 2026-04-20 analysis, the p-BDM → MPL contrast moves 6 things simultaneously; the design identifies the UJS formal-property difference, not a single cognitive mechanism. The ADR log and your H2 have already been reframed around this honesty. The contribution bullet could be loosened to match: `characterize why BDM fails behaviorally, consistent with UJS's multiple-justifiable-actions account vs. alternatives.` Or `test whether BDM's behavioral failure matches the UJS formal-property prediction.`
- **The θ-extension replication.** DVW publishes only θ = 0.2. Your design covers {0.2, 0.4, 0.6, 0.8} (matching B&W 2018). That is a real contribution — it produces the first θ-pattern evidence for p-BDM pure-incentives failure. Removing it from the contribution list means it now lives nowhere visible to Anujit. If you wanted it out of the contribution list because it read as too modest ("we replicate and extend"), consider moving it to a footnote on the Design slide or mentioning it in Q2's setup. If you wanted it out because DVW's WP may contain the same extension, that's defensible — but then say it verbally to Anujit ("waiting on DVW WP to confirm their θ coverage"). Your call; flagging that the claim isn't presently visible.

### TWEAK-4 — Literature slide (frame 2, lines 30–34)

Two edits worth considering:

1. **DVW sentence.** "p-BDM methodology is not public" at the end of the DVW paragraph reads a little defensively. Anujit knows DVW; this is setup for why you're designing from scratch. Could be softened to: "The p-BDM incentives-only methodology is not published" or moved into the p-BDM deep-dive section (frame 7) where it directly motivates the three proposals.

2. **Chakraborty–Kendall sentence.** "BDM admits many justifiable non-truthful reports; MPL admits one, may be better BIC." Two small issues:
   - UJS speaks about **justifiable actions at each report/row**, not "justifiable reports." The current phrasing is close but subtly off. Tighten to: "BDM admits multiple justifiable actions; MPL admits one per row."
   - "may be better BIC" is a trailing fragment that restates H2 compressed. Either state it as a full clause ("so MPL may be behaviorally IC where BDM is not") or drop it because H2 will say this precisely on the next slide.

### TWEAK-5 — Between-subject / within-subject structure on the Design slide

The design table lists T1–T5 as five arms. The post-table line says "Within-subject: priors (easy) and posteriors after signals (hard)." That makes the within-subject dimension clear, but the between-subject structure is left implicit.

**Suggested addition** (one sentence, between title and table):

> Five between-subject arms. Within each arm, each subject completes easy (priors) and hard (posteriors after signal) rounds.

This is the kind of question Anujit is likely to ask in the first 60 seconds — preempt it.

Also: **T5 (Flat fee)** is the no-mechanism benchmark, but "Accuracy encouragement" is vague. Add one line: "T5 pays a flat fee plus verbal accuracy encouragement — baseline for intrinsic accuracy motivation."

### TWEAK-6 — Frame 7 (p-BDM pure-incentives test setup) ends abruptly

After the three bullets on payoff structure and the EV gap, the frame ends without signaling what's next. One transition line helps:

> Three candidate designs address this differently (A / B / C).

Or similar. Very small but smooths the flow into the next three slides.

### TWEAK-7 — Frame 13 p-value phrasing

> Empirical result for risk elicitation: p = 0.041 (list) versus p = 0.697 (separated).

These are the p-values for detecting RPS-vs-Framed-Control differences, not detection rates. A reader unfamiliar with B&H may briefly read them as failure rates. Clarify:

> Empirical result (risk elicitation): RPS vs. Framed Control differs significantly in list format (p = 0.041) but not in separated format (p = 0.697).

### TWEAK-8 — Frame 11 ("Three ways to run the test") column headers

Current column headers are bare `A / B / C`. Adding one-word labels under each helps fast scanning without forcing Anujit to flip back to the section titles. E.g.:

```
 & A & B & C \\
 & (strict DVW) & (native framing) & (parallel MPL) \\
\midrule
```

Optional polish.

---

## Positives worth preserving

- Proposal A/B/C example slides all have parallel structure (urn setup, mockup or table, CR-demand note). Anujit can compare at a glance. The 2026-04-20 decision to add a parallel CR-demand note on A was the right call.
- Q3's three-slide build (what the literature says → options and tradeoffs → the actual question) is a genuine improvement. The belief-transfer question in frame 15 is the sharpest version of the ADR-0005 open question and is correctly positioned as a gate on the coarse-separated lean.
- H2 collapsed onto the UJS formal-property claim matches what the design actually identifies. The UJS-vs-CR framing bullet in Q1 handles the "is this enough" question without pre-deciding.
- Q1 opens with "Is there anything I am missing before we move forward?" — correct positioning. Don't let this slide get longer.

---

## ADR consistency check

| ADR | Deck treatment | Status |
|-----|---------------|--------|
| 0001 (RQ: why BDM fails) | Slides 3 (RQ) and 4 (H1) | Consistent. |
| 0002 (drop preference-for-control arm) | No appearance | Consistent (arm not in design). |
| 0005 (B&H belief transfer open) | Frame 15 Q3 | Consistent — posed as open question. |
| 0006 (Condition 2 prioritize A/D) | Frame 5 T3/T4 | Consistent; see CLEANUP-1 for stripping the "condition 1/2" jargon. |
| 0008 (multi-switching descriptive) | Frame 5 Outcomes list | Consistent — "multi-switching" listed without threshold framing. |
| 0009 (dual-metric ε = 0, 5pp) | Frame 5 Outcomes line | Consistent — "ε = 0 and ε = 5pp (DVW 2022)" cited. |
| 0010 (HH instructions) | Not directly in deck | Consistent (not a Q for Anujit per Tier-4). |
| 0011 (p-BDM design from scratch) | Frame 7 and Q2 | Consistent — "DVW WP is not available" stated. |
| 0012 (Azrieli monotonicity IC foundation) | Not directly in deck | Consistent — not a meeting agenda item. |
| 0013 (UJS scoped to behavioral failure) | Frame 4 H2, frame 2 Literature | Consistent — UJS treated as behavioral framework, not IC foundation. |
| 0014 (superseded) | Not in deck | Correctly absent. |
| 0015 (ROCL triggering canonical) | Frame 13 | Consistent — the four-step chain is compressed into the B&H intro, ROCL is named. |

No ADR contradictions.

---

## Consistency with the Questions-for-Anujit doc (02_questions-for-anujit.md)

The deck implements the Questions doc well:
- Q1 on the slide matches Tier-1 Q1 (overall design check).
- Q2 matches Tier-1 Q2 (which of A/B/C discriminates UJS most sharply).
- Q3 matches Tier-1 Q3 (B&H ROCL transfer to beliefs).
- Tier-2 questions (Q4 MPL-incentive-only novelty, Q5 θ values, Q6 auxiliary B&H transfer) are correctly held as backup — not in the deck but ready to raise if time permits. The auxiliary transfer arm (Tier-2 Q6) is foreshadowed by the Q3 block's last line ("auxiliary B&H transfer arm (100–150 additional subjects)").

The one divergence: the Questions doc (Q1) also flags BSR arm inclusion as a sub-question. The deck's Q1 does not surface BSR. If you still want to ask about BSR, add a bullet to frame 6.

---

## Cosmetic / LaTeX

| Item | Location | Severity |
|------|----------|----------|
| Overfull hbox (2.078pt too wide) | line 84 | Trivial — won't read as misaligned. |
| Underfull hbox (badness 1655) | line 200 | Trivial. |

Both are in the design table and the three-ways table respectively. Fixing requires one-column width adjustment; not worth it for 2pt.

---

## Recommendation

**Before Thursday (priority order):**

1. Fix BUG-1 (line 80: `H4` → `H3`). Non-negotiable.
2. Fix CLEANUP-1 (strip `condition 1`/`condition 2` jargon from design table). One minute.
3. Decide on FRAMING-1 (Q2 rewrite). If you want the tighter honest version, swap in the suggested text. If you want to keep the slide compressed and carry the nuance verbally, note which points you'll expand on in the meeting.
4. Consider TWEAK-5 (add the one-sentence between-subject structure line on the design slide) — Anujit will probably ask immediately.

**Nice to have, not blocking:**

5. TWEAK-2 (H1a framing).
6. TWEAK-3 (contribution bullet — decide whether θ-extension lives anywhere visible).
7. TWEAK-4 (Literature slide UJS phrasing).
8. TWEAK-6, 7, 8 (minor polish).

Recompile after edits. Meeting prep is on track.
