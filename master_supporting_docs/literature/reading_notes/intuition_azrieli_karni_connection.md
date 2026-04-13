# Intuitive Explanation: Azrieli et al. (2018) and Karni (2009) Connection

**Date:** 2026-04-08
**Purpose:** Plain-language explanation of how the general RPS IC result (Azrieli et al.) connects to the specific belief BDM IC result (Karni).

---

## Karni (2009): IC for the Belief BDM

Karni's proof is specific to one mechanism. The setup:

- You believe Event $E$ happens with probability $\pi(E)$
- You report $\mu$
- A random $r$ is drawn uniformly from $[0,1]$
- If $\mu \geq r$: you get the **event bet** (win if $E$ happens)
- If $\mu < r$: you get an **objective lottery** (win with probability $r$)

**Why truthful reporting is optimal:** Under probabilistic sophistication, you view the event bet as equivalent to a lottery with winning probability $\pi(E)$. So at every possible $r$, you're effectively comparing two lotteries — one with winning probability $\pi(E)$ (the event bet) and one with probability $r$ (the objective lottery). You prefer whichever has the higher winning probability. By reporting $\mu = \pi(E)$, the mechanism gives you the event bet exactly when $\pi(E) > r$ (when it's better) and the objective lottery exactly when $r > \pi(E)$ (when it's better). Any other report creates a "window" of $r$ values where you get the wrong one.

**The two assumptions:**

1. Probabilistic sophistication — you can evaluate the event bet as a lottery with probability $\pi(E)$.
2. Dominance — you prefer lotteries with higher winning probability.

That's it. No expected utility needed.

---

## Is "No Stakes" a Third IC Assumption?

**Short answer:** Yes, but it's a different *kind* of assumption from the other two. Probabilistic sophistication and dominance are assumptions about the agent's *preferences*. No stakes is an assumption about the agent's *situation* — it's a scope condition on when the mechanism works, not a property of the agent.

**What Karni says (p. 606):** "The accuracy of the elicitation procedures described here depends critically on the agent having no stake in the event of interest. If he does have a stake in the event, the evaluations of the payoffs of the bet and the lotteries that figure in the mechanism are event dependent, and the preference relation does not exhibit probabilistic sophistication."

**Why it matters:** The IC proof requires the agent to evaluate the event bet $\beta = x_E y$ as equivalent to the lottery $l(\pi(E), x, y)$. This equivalence — which is what probabilistic sophistication provides — breaks down if the agent's *other* wealth depends on whether $E$ occurs. If the agent is already exposed to $E$ (e.g., she holds a stock that pays off if $E$ happens), then the event bet is not just "win \$H with probability $\pi(E)$" — it's "win \$H in a state where I'm also getting my stock payoff." The utility of winning \$H conditional on $E$ differs from the utility of winning \$H conditional on not-$E$, because background wealth differs across states. This makes preferences state-dependent, which violates probabilistic sophistication.

**Concretely:** Suppose a farmer is asked about the probability of drought. If drought occurs, her crops fail and she's poor. If she holds the event bet (pays \$H if drought), winning \$H when she's poor is worth more to her than winning \$H when she's rich (no drought). The event bet is no longer equivalent to a lottery with probability $\pi(\text{drought})$ — it's *better* than that lottery, because it pays off precisely when the money is most valuable. She would overreport her drought probability to get more insurance-like payoffs.

**How the three assumptions relate:**

| Assumption | Type | What it rules out | Relevant for our project? |
|---|---|---|---|
| Probabilistic sophistication | Preference property | Ambiguity aversion, source preference | Yes — see caveat about prospect theory |
| Dominance | Preference property | Preferring lower probability of better prize | Almost always satisfied |
| No stakes in the event | Scope condition | State-dependent preferences, hedging motives | **Yes — but satisfied by our urn-draw design.** Subjects have no prior exposure to the urn outcome. Their background wealth is independent of which urn is selected. |

**For our project:** The no-stakes condition is satisfied by construction in our urn-draw design. Subjects have no prior financial exposure to the event (which colored ball is drawn from which urn). This is one advantage of using induced probabilities with objective events rather than eliciting beliefs about real-world events where subjects might have stakes (e.g., election outcomes, stock prices, own performance).

**Note:** Karni's footnote 9 adds that "When the agent has a stake in the events of interest, the other methods also fail" — citing Kadane & Winkler (1988). So the no-stakes requirement is not specific to BDM; it applies to all belief elicitation methods. It's a universal scope condition, not a weakness of BDM specifically. Karni and Jaffray developed methods to handle state-dependent preferences (Jaffray & Karni 1999; Karni 1999), but these are more complex.

---


## What Exactly Is Probabilistic Sophistication?

**Source:** Machina & Schmeidler (1992), "A More Robust Definition of Subjective Probability," *Econometrica* 60(4), 745-780.

**The core idea:** A decision-maker is probabilistically sophisticated if she has well-defined subjective probabilities over events AND uses them to evaluate acts — but she is NOT required to be an expected utility maximizer.

**Formally:** Consider two acts (gambles whose outcomes depend on which state of the world obtains):

- Act $f$: pays \$100 if it rains, \$0 otherwise
- Lottery $l$: pays \$100 with probability 0.3, \$0 with probability 0.7

If the decision-maker believes the probability of rain is exactly 0.3, then acts $f$ and $l$ generate the same probability distribution over outcomes: 30% chance of \$100, 70% chance of \$0.

**Probabilistic sophistication says:** If two gambles (whether acts over events or objective lotteries) generate the same probability distribution over outcomes, the decision-maker is indifferent between them. In notation: if $\pi(f^{-1}(x)) = p$ for all outcomes $x$, then $f \sim l(p)$.

**What this requires:**

1. The decision-maker has a **unique subjective probability measure** $\pi$ over events. She assigns definite probabilities to "rain," "no rain," etc.
2. She evaluates acts **only through** their implied probability distributions. She doesn't care about which specific states deliver which outcomes — only about the overall probability of each outcome.

**What this does NOT require:**

- **Not expected utility.** She doesn't need to weight outcomes linearly in probabilities. She can use rank-dependent utility, anticipated utility, or any other model that evaluates probability distributions. She just needs to *have* probabilities and *use* them.
- **Not risk neutrality.** She can be arbitrarily risk-averse or risk-loving.
- **Not reduction of compound lotteries.** She can evaluate a two-stage lottery differently from its reduced single-stage form.

**What violates it:**

- **Ambiguity aversion** (Ellsberg-type behavior). If the decision-maker prefers betting on an urn with known 50-50 composition over an urn with unknown composition, she's treating two events she "should" assign probability 0.5 differently. She doesn't have a single probability measure — or she cares about something beyond the probability distribution (namely, the ambiguity of the source). This violates probabilistic sophistication.
- **Source preference.** If she prefers betting on events she's knowledgeable about vs. events she's ignorant about (even holding probabilities constant), she's not evaluating acts solely through their probability distributions.
- **Probability weighting over subjective events (prospect theory caveat).** Standard prospect theory applies a weighting function $w(p)$ to probabilities. If $w$ is applied identically to both subjective and objective probabilities, probabilistic sophistication holds. But if the weighting differs for subjective events vs. objective lotteries (which some versions of prospect theory allow), it can be violated — because the act $f$ and the lottery $l(\pi(E))$ would be evaluated differently despite generating the same probability distribution.

**Why it matters for Karni (2009):**

Karni's IC proof requires the subject to evaluate the event bet $\beta = x_E y$ as equivalent to the lottery $l(\pi(E), x, y)$. This is *exactly* what probabilistic sophistication guarantees. Once this equivalence holds, the rest of the proof just uses dominance (prefer higher winning probability). Without probabilistic sophistication, the subject might evaluate the event bet differently from the "equivalent" lottery — e.g., because the event bet involves subjective uncertainty while the lottery involves objective randomization — and the IC proof breaks down.

**Why Azrieli et al. (2018) can do without it:**

Azrieli et al.'s monotonicity assumption doesn't require the subject to evaluate the event bet as equivalent to any specific lottery. It only requires: "getting a better thing in one state is weakly better." This is purely about the *comparison* of acts, not about *reducing* acts to probability distributions. So a subject who is ambiguity-averse, or who weights subjective and objective probabilities differently, can still satisfy monotonicity — as long as she doesn't prefer dominated acts. This is why monotonicity is strictly weaker than probabilistic sophistication.

---



## Azrieli, Chambers & Healy (2018): IC for *any* random-round payment scheme

Azrieli et al. ask a much more general question: **When is paying for one randomly chosen task incentive compatible?**

Their setup is abstract — no specific mechanism, no beliefs, no lotteries. Just:

- An experiment with $k$ tasks (decision problems)
- Each task $i$ has a set of options $D_i$
- The subject picks one option from each task
- **Payment rule:** A random state $\omega$ determines which task $i$ counts. The subject is paid according to what she chose in task $i$.

This is the **Random Problem Selection (RPS)** mechanism. It encompasses everything: risk preference elicitation (Holt-Laury), belief elicitation (BDM), auctions, basically any experiment where you do multiple tasks and get paid for one.

**The question:** Under what assumptions on the subject's preferences is RPS incentive compatible — meaning the subject optimally plays each task as if it were the only one that matters?

**The answer (Proposition 1):** Under **monotonicity**. Monotonicity says: if I swap out the outcome in one state $\omega$ for a better outcome, holding everything else fixed, the subject weakly prefers the new act. This is almost a tautology — "getting something better in one scenario while keeping everything else the same is weakly good."

**The proof is beautifully simple:** Suppose the subject deviates from her optimal choice in task $i$ — she picks option $y_i$ instead of her favorite $x_i$. Under RPS, this changes her payoff only when task $i$ is the one selected for payment. In that state, she gets $y_i$ instead of $x_i$. In all other states, nothing changes. By monotonicity, this deviation is weakly worse. Done.

---

## How They Connect

The connection is:

1. **Karni's belief BDM is a special case of RPS.** The "tasks" are the binary comparisons at each possible $r$: "do you prefer the event bet or the $r$-lottery?" The subject's report $\mu$ implicitly answers all of these. The random state $\omega$ (which $r$ is drawn) determines which comparison counts for payment. This is exactly RPS — footnote 16 of Azrieli et al. spells this out explicitly.

2. **Karni's "probabilistic sophistication + dominance" implies Azrieli et al.'s "monotonicity."** In the belief BDM context, monotonicity means: if you could swap in a better lottery at one specific $r$ (holding all other $r$ values fixed), you'd prefer that. Probabilistic sophistication lets you evaluate the event bet as a lottery, and dominance lets you rank lotteries by winning probability. Together, they give you monotonicity in the RPS sense.

3. **But Azrieli et al.'s monotonicity is actually *weaker* than Karni's assumptions.** Karni needs the subject to have well-defined subjective probabilities (probabilistic sophistication) and to rank lotteries by winning probability (dominance). Azrieli et al. only need: "getting a better thing in one state is weakly better." This doesn't require the subject to *have* probabilities at all — just to not prefer dominated acts. Healy & Leo (2025) exploit this in their Proposition 4: belief BDM IC follows from monotonicity alone, without requiring the subject to be probabilistically sophisticated.

---

## The Practical Upshot

| | What you need to assume | What it gives you |
|---|---|---|
| **Karni (2009)** | Probabilistic sophistication + dominance | IC for the specific belief BDM mechanism |
| **Azrieli et al. (2018)** | Monotonicity (weaker) | IC for *any* random-round payment, including belief BDM as a special case |
| **Healy & Leo (2025)** | T-statewise monotonicity (= Azrieli's monotonicity applied to the belief context) | IC for belief BDM and belief MPL, stated as a "simple application of Azrieli et al." |

For our project, the key implication: the IC assumption for belief BDM is *extremely* weak (monotonicity). This makes it all the more puzzling that BDM fails behaviorally. The failure cannot be blamed on strong preference assumptions — it must be about subjects' inability to *identify* the dominant strategy, not about the strategy not existing.

---


## A Subtlety: When Monotonicity Fails

Azrieli et al. also show when monotonicity *doesn't* hold:

- **Monotonicity + reduction of compound lotteries = EU (Fact 1).** If subjects reduce compound lotteries (treat two-stage randomization as equivalent to single-stage), then violating EU also violates monotonicity. This means non-EU subjects who reduce compound lotteries will not satisfy IC under RPS.

- **Ambiguity aversion + order reversal violates monotonicity (Fact 1.2).** Subjects who are ambiguity-averse and satisfy order reversal can exploit the compound lottery structure of RPS to hedge across tasks.

- **Brown & Healy (2018) find monotonicity depends on format.** Monotonicity is violated in list format ($p = 0.041$) but not in separated format ($p = 0.697$). This is striking — the IC *assumption itself* depends on how the experiment is presented.

For our project: if we use a belief BDM with one question per screen (separated format), we can be reasonably confident that monotonicity holds. The BIC failure we observe would then be about comprehension (inability to identify the dominant strategy), not about monotonicity violation. This is an important methodological point for the experimental design.
