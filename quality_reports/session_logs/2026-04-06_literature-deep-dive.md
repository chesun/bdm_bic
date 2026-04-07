# Session Log: 2026-04-06 — Literature Deep Dive & Mechanism Taxonomy

## Goal
Read newly downloaded papers (Burfurd & Wilkening 2018, Hao & Houser 2012, Burdea & Woon 2022, Holt & Smith 2016, Azrieli et al. 2018, Karni 2009, Healy 2020 note), create a mechanism taxonomy, and bring reading notes to publication-ready accuracy.

## Operations

**Papers read and notes added (7 new entries, papers 13-19):**
- Paper 13: Burfurd & Wilkening (2018, JESA) — SBDM format comparison + quiz effects
- Paper 14: Hao & Houser (2012, JRU) — declarative vs clock mechanism
- Paper 15: Burdea & Woon (2022, JEP) — BDM vs BSR vs flat fee online
- Paper 16: Healy (2020, unpublished note) — origin of "RBC" terminology
- Paper 17: Holt & Smith (2016, AEJ:Micro) — synchronized lottery choice menu
- Paper 18: Azrieli, Chambers & Healy (2018, JPE) — RPS IC under monotonicity
- Paper 19: Karni (2009, Econometrica) — foundational belief BDM IC proof

**Mechanism taxonomy created:**
- `master_supporting_docs/literature/reading_notes/mechanism_taxonomy.md`
- Maps BDM, MPL, clock, TPL, iterative MPL across value and belief elicitation
- Documents simplicity refinements (CBC, OSP, GSO/UJS) from Brown et al.
- Three perspectives on BDM-MPL relationship (formal equivalence, different formats, different game-theoretic properties)
- IC hierarchy with precise axiom numbering (Axiom 5 < Axiom 6 < risk-neutral EU)
- Historical lineage corrected: Ducharme & Donnell 1973 → Grether 1981 → Karni 2009

**Cross-paper themes filled in (4 themes):**
1. Comprehension is the binding constraint, not preferences
2. Format matters more than formal IC properties
3. Cognitive heterogeneity concentrates BIC failures
4. Experience helps but doesn't fully solve the problem

## Decisions

- **Savage (1971) ≠ BDM-for-beliefs.** Savage developed scoring rules; the BDM-for-beliefs lineage is Ducharme & Donnell (1973) → Grether (1981) → Karni (2009). Multiple critics caught this conflation.
- **GSO ≠ UJS formally.** GSO is the 2022 working paper term (4 structural properties); UJS is the 2025 reformulation (justifiability in simplified games). Brown et al. use "GSO" as their label but define it via C&K 2025's UJS conditions. For our paper: cite as UJS.
- **Karni IC conditions ≠ Azrieli et al. conditions.** Karni requires probabilistic sophistication + dominance. Azrieli et al. requires only statewise monotonicity (weaker). Both apply to belief BDM but are different formulations.
- **Hao & Houser clock is NOT OSP** per Tsakas (2019), cited by C&K (2025).
- **Prospect theory may NOT satisfy probabilistic sophistication** — probability weighting over subjective events can violate the condition. Important caveat for our theoretical positioning.
- **RBC term originated in Healy (2020) note**, dropped in published Healy & Leo (2025) chapter.
- **Martin & Munoz-Rodriguez (2022) invented the CBC framing** (computer bidders + contingency-by-contingency payoff tables). Brown et al. adopted it.
- **Instructions decision tabled** until design is finalized. HH (Hao-Houser analogy) format recommended for speed; quiz is essential.

## Results

- Reading notes: 19 papers, all critic-verified
- Final review scores: Papers 1-9: 90/100, Papers 10-19: 89/100, Taxonomy: 88/100
- All flagged errors corrected (Healy chapter number, Savage misattribution, footnote 16 inequality, clock accuracy characterization, prospect theory caveat, historical lineage)
- Mechanism taxonomy: critic-verified, internally consistent

## Additional Operations (later in session)

**Papers 20-23 read and notes added:**
- Paper 20: Brown & Healy (2018, EER) — monotonicity violated on list screen (p=0.041) but NOT on separated screens (p=0.697)
- Paper 21: Tsakas (2019, GEB) — static BDM almost never has obviously dominant strategies; ascending Karni = dominant but NOT obviously dominant
- Paper 22: Holt & Smith (2009, JEBO) — "dice lottery" BDM framing; 25% comprehension failure; only 45% Bayesian subjects
- Paper 23: Grether (1981, Caltech WP) — first BDM-for-beliefs in economics; 4.4% vs 12.9% error rates

**Cross-paper themes expanded:** 4 → 5 themes, 4 → 7 implications. Theme 5 (theory-behavior gap) added as the core framing for our paper. Benoit et al. caveat added to Theme 1. Brown et al. year standardized to 2026.

**Critic reviews:**
- Papers 20-23: 90/100
- Updated themes: 88/100

## Status
- Done: Literature deep dive complete. **23 papers** with detailed, critic-verified notes. Mechanism taxonomy documented. 5 cross-paper themes + 7 implications synthesized.
- Pending: CS Comments for papers 3, 4, 5, 7, 9, 11, 12. Pressure-test research direction via `/discover interview`.
