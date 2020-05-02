---
documentclass: article
title: A Survey of Advancements in Green Security Games
author: Joe McCall
date: CAP5600
abstract: |
  The field of Green Security Games (GSG) has proven useful in the protection of
  wildlife. By modelling attackers and defenders as intelligent agents in a
  repeated simulation we can employ a winning algorithm to deploy scarce
  resources in actual green security scenarios. Such an abstraction also serves
  as the foundation upon which more intricate scenarios can be built, explored, and
  subsequently adapted to by a learning agent. This paper summarizes the concept
  of GSGs, surveys the advancements that have been made, provides analysis of the validity of the advancements, and suggests future
  opportunities for research.
fontfamily: mathptmx 
fontsize: 10pt
bibliography: 
   - acm_2832581.2832611.bib
   - acm_2891460.2891560.bib
   - acm_2936924.2936946.bib
   - acm_2994501.2994507.bib
   - deep_reinforcement.bib
   - acm_3306127.3331719.bib
   - illegal-killing-for-ivory-drives-global-decline-in-african-elephants.bib
   - citation-320268965.bib
csl: ieee.csl
secnumdepth: 2
header-includes:
  - \usepackage{mathtools}
  - \usepackage[normalem]{ulem}
  - \usepackage[utf8]{inputenc}
...

<!--

Abstract: The abstract should summarize the contents of the paper in short terms, i.e. 150-250 words.

-->

<!-- Write a brief introduction to your topic. This can be background
information needed for the reader to understand the methods you discuss in your
paper. -->
# Introduction

The domain of green security entails the struggle between poachers/illegal
fishers and rangers charged to protect the wildlife. Endangered animals are trapped and killed/trafficked by poachers, and those charged to protect wildlife face a shortage of resources. Typically there are more targets than there are rangers to patrol them, and poachers will continuously attack different targets. Defenders must also protect potentially un-explored/under-explored areas, and operate out of fixed patrol towers to which they must return at the end of a shift. The deployment of limited resources under strict constraints can be facilitated using artificial intelligence. Despite best efforts, species like the African elephant are globally declining due to poaching [@Wittemyer201403984]. Certain strategies to address this treat have been ineffective at best [@inbook]. An approach is needed to capture poachers as they attack, which requires somehow predicting where and when they will attack. These types of predictions fit well within the field of Artificial Intelligence (AI).

Within AI, Stackelberg Security Games (SSG) have
been used to predict potential attacker moves in order to assist in defender
strategies. The application of this strategy to green security domains is
called Green Security Games (GSG, introduced by [@fang15]). The game abstracts
the reality of poachers versus rangers patrolling a vast wildlife area into a
grid-based simulation between attackers and defenders, both of which are AI
agents. The attacker's goal is to place snares for wildlife without being
caught, while the defender's goal is to detect both the snare and the attacker.
Furthermore, the attacker behaves human-like and does not always behave
optimally.

The game is run in episodes [@fang15]. Each round the attacker chooses a target based on the highest estimated utility, and the defender must deploy its resources judiciously to defend those targets. The defender does not have enough resources to defend all targets, so it must employ a strategy to decide which targets should be defended and which targets should be left defenseless. By simulating multiple rounds of this game, an optimized defender strategy is formed. This strategy is applicable to assist real-world rangers in deciding where and how patrols should be deployed.

Advancements in this field introduce additional constraints, challenge
assumptions, and propose novel methods for improving defender strategy. Qian et
al. [@qian16] show that the environment must be partially-observable to model
the defender's decision to explore new areas or patrol areas known to have
snares. Wang et al. [@wang19] introduce the idea that both attackers and
defenders have access to real-time information that can be used to evade and
track. Finally Gholami et al. [@gholami19] show that a defender strategy that
combines a machine-learning agent with an online learning algorithm that does
not rely on prior information can outperform existing models.

The paper is organized in three sections. The Methods/Theory section summarizes the methods for the these papers. The Discussions section summarizes the results, and reflects on the soundness of each paper. The Conclusions section analyzes the research, and provides ideas for further research.

<!-- FEEDBACK -->
<!-- At the end of the introduction give a description of what lies ahead to give guidance to the reader. E.g. The remainder of the article is organized as follows. The next section, ... -->

<!-- Discuss in the second section the methods or the theories that you
studied. Summarize the methods that you have reviewed. -->
<!-- Write about the methods and the theory that you studied. If applicable,
write about the application of the methods/theory. Are the methods/theory that
you have come across sound by your judgment?  -->
# Methods/Theory

<!-- * Include evaluation on soundness of each method presented. Why is this valid? -->

The methods and theory of each paper are described below. Included are the environment as described by the researcher, the method by which a trained AI agent interacts with the environment, and the output of the simulation. It is then discussed why the research is considered valid.

## Green Security Games (GSG)

The Green Security Game as introduced by Fang et al. [@fang15] is a zero-sum
game, meaning that a positive environment for one player is a negative environment for the other. Specifically, for a given reward function, either the attacker is successful, or the defender, but not both. 

The game is run in T ( $<\infty$ ) rounds, and each round has multiple
episodes. At the end of each episode the defender can change her deployment
strategy. The defender has K guards to protect N ($\ge K$) targets, each with a
different reward. A guard (defender) can defend one target $i$ and an attacker
can attack one target. If the attacker attacks an unguarded target, the
defender is penalized and the attacker is rewarded. If the attacker attacks a
defended target, the attacker is penalized and the defender is rewarded. After
each round the defender assigns guards in order to maximize the expected
utility. The attacker and defender strategies are described below.

<!-- There are further details regarding the coverage vector <c_i>, etc. Do I
copy this down verbatim? Is it plagiarism if I do? -->

### Attacker 

The strategy utilized by the attacker depends on the Subject Utility Quantal
Response (SUQR) concept, which has proven to accurately model bounded
rationality of human attackers [@nguyen13]. 

In other words, the attacker uses the his belief in the defender's strategy
$c_t$ and his limited memory of previous rounds to decide on the target to
attack in that round. This definition is given formally in [@fang15].

<!-- Potential for criticism: these assume the attackers will have no access to
automated tools. However as computing resources become more available attackers
may cease to act boundedly rational. -->

### Defender

The defender strategy is represented by a coverage vector $c = \langle c_i
\rangle$ where $0 \le c_i \le 1$ is the probability that target $i$ is covered
by a guard. It also satisfies $\sum_{i=1}^{N}c_i \le K$ [@fang15]. In other
words it is impossible to have more total coverage than there are guards.

To compute the utility of the defender we use @fig:defenderStrategy. The
expected utility for a defender with a given strategy $c$ is the probability
target $i$ is covered times the reward of that target for the defender, plus
the probability that target is not covered times the penalty of that target for
the defender.

$$
U_i^d(c) = c_i R_i^d + (1 - c_i)P_i^d
$${#fig:defenderStrategy}

The defender's strategy in round $t$ is denoted by $c^t$.

<!--
The PlanAhead-M (PA-M) algorithm is introduced to produce the optimal strategy
for the defender. Its goal is to provide balance between attempting to compute
the optimal strategy for all rounds simultaneously (which be comes
computationally expensive as $T$ becomes large), and simply defending the
targets with the highest expected utility. It computes the "optimal strategy for
the current round as if it is the $M^{th}$ last round of the game" [@fang15].
-->

The objective is to maximize the defender's average utility over the all the rounds of the game. This is done with a planning algorithm. Each episode the defender uses the configured algorithm to determine which areas to defend. The discussed algorithms include PlanAhead-M (PA-M), FixedSequence-M (FS-M), and an enhanced PA-M
that incorporates Bayesian Updating (BU). They are formally defined in [@fang15] and evaluated in the experiment. In particular, BU allows the learning algorithm to build a probability distribution to predict where the attacker will attack, based on historical data.

<!-- Note: this is finding the maximum. It may get stuck in a local maxima -->

### Output

The experiment evaluates the performance of a learning GSG algorithm with the baseline algorithms typically found in Stackelberg Security Games, and a non-learning myopic strategy which does not consider historical data. The experiment is run under controlled conditions under a strict time limit with the same data. The experiment is sound.

## Exploration/Exploitation Tradeoffs

Qian et al. [@qian16] built upon the work done by Fang et al. [@fang15] by introducing a new constraint that fit the real-world better: the dilemma between exploring new territories and continuing to patrol known hot-spots. 

The authors suggest that the original GSGs fail to consider that 
attacks on unguarded targets can only be discovered if the guards explore that
area first. In other words, the environment is only partially observable by the
defender. The defender must choose between patrolling targets with known
poaching activities and exploring the targets that may or may not have been
attacked.

Intuitively, the more the defender patrols an area, the less likely that area will be attacked, given the attacker can observe the defender's actions. Attacks are discretized into intensity. A more intense attack will yield a higher reward for the attacker, but is more observable by the defender, while a less intense attack yields a lower reward but is more covert. The experiment done by Qian et al. [@qian16] models this property using a combination of transition matrices and an observation matrix. The experiment intends to learn the transition matrices, the observation matrix, and a value for the initial belief using an expectation-maximization algorithm (a technique used to handle non-observable variables). Each round, adjustments are made to the attacker transition matrices, a defender observation matrix, and an initial belief value.

### Restless Multi-armed Bandit (RMAB) Problem

The dilemma between exploration and exploitation is modelled as a Restless Multi-armed Bandit (RMAB) problem. In such a problem, limited resources (guards) must protect
several targets, but they have no insight into targets which they do not
protect. In a traditional multi-armed bandit problem the player attempts to maximize his score by pulling one more arms of the slot machine to maximize the reward. The restless variant is introduced here to show that non-activated arms (i.e., unexplored areas) affect the "payout" of the activated arms. This means the environment being simulated is stochastic.

When RMAB is applied to GSG, the defender choosing an area to patrol is akin to the "pulling" of an arm for that round for a reward (the defender catches the attacker). Likewise, the attacker choosing to attack an area is "pulling" that arm for a reward (the attacker successfully ensnares an animal).


### Whittle Index 

The Whittle index is the heuristic index policy that assists the agent in deciding which arm to activate. Basically, the higher the Whittle index, the more likely the attacker or defender is to attack of defend an area respectively.

### Output

A fully-trained agent from this experiment can be considered rational if it predicts where and when actual attacks happen. The simulation more closely matches the real world given the addition of the exploration/exploitation dilemma. This is an improvement over a model that ignores such a dilemma, so the research is valid.


## Real-Time Information

* Explain what Want et al. [@wang19] show as shortcomings of prior work, and how GSG-I augments the existing game and DeDOL helps to solve it.

### GSG-I Problem

* GSG-I is an augmentation of GSG that includes real-time information
* Explain how it is closer to reality than GSG

### DeDOL Algorithm

* Explain what the Double-Oracle framework is
* Expand upon the domain-specific heuristics it uses

## Imperfect Prior Knowledge

* Explain what Gholami et al. [@gholami19] show as shortcomings of prior work, and how MINION-sm and MINION help improve defender strategies in GSGs.
* Historical information is unreliable because it exhibits spatial bias [@gholami19]. In other words, since we only know about attacks that we can observe, and the area around guard posts is more observed than other areas, historical data will reward guarding targets closer to the outposts much higher than other, potentially more valuable targets.
* Show how Gholami et al. [@gholami19] adjusted the GSG presented in [@fang15] to illustrate their point.
* Introduce the two experts used in the MINION algorithm - MINION-sm and Machine Learning

### MINION-sm

* Explain MINION-sm as the online-learning algorithm without historical data
* MINION-sm starts with the FPL-UE (follow-the perturbed-leader with uniform exploration) algorithm. It randomly flips a coin to choose between exploration/exploitation. It is impractical for deployments in GSGs. MINION-sm adds scheduling constraints to this algorithm. Randomness is added to ensure the route chosen isn't fixed.

### Machine Learning (ML)

* Show how MINION adds a Machine-Learning element to take advantage of historical data.

### MINION

* Show how patrol planning balances between the two experts
* State that the experiments showed that MINION outperformed MINION-sm and ML individually

<!-- Summarize the results of the research. Then write up your reflection of
the methods and/or theories that you studied in the selected paper. Be critical
in your analysis. Are the methods/theories that the authors present sound? What
do you see as the weaknesses and strengths of the proposed methods? -->
# Discussions

Include:

* GSG abstraction - benefits and trade-offs. What benefit does the GSG abstraction have over an attempted perfect simulation?


The work done by Qian et al. [@qian16] successfully introduce a more realistic scenario when simulating GSGs. The use of the RMAB is a useful abstraction of the real-world dilemma between exploring new areas and patrolling existing areas. The results of the experiment clearly show an improvement over existing models, especially as learning rounds increase. Care must be taken to address the fact that poachers are often well-funded [@inbook] and have just as much observability of the defenders as the defenders do of the poachers.

* GSG-I - Same question
* MINION - Is this seemingly the ultimate solution? How would it perform against GSG-I? How can its work be combined with previous work discussed in this paper?
* Additional insight - how this problem is still not fully addressed, and what could be done in further research.

The introduction of GSG has effectively abstracted the conflict between
poachers and the law enforcement agents attempting to stop them. The ability to
simulate multiple rounds against a simulated human presents a clear benefit for
learning algorithms to assist in the deployment of guards to patrol vast areas.
Fang et al. [@fang15] showed that the enhanced PA-M strategy provided a high
average expected utility compared to the baseline algorithm used. Assuming the
abstraction is valid, this indicates the strategy would be successful if
employed by actual law enforcement.

However, the assumption that adversaries act with bounded rationality may only
be useful in the short-term. Access to computing resources (and even the PAWS
application) is growing more ubiquitous, and it's only a matter of time before
poachers have the same access to the AI research as law enforcement. A means to
detect whether or not the attacker is utilizing AI assistance would be highly
valuable in this case.

<!-- Discuss over-fitting -->


<!-- Write up a conclusion that summarizes your analysis of the research. Has
the field been advanced with the research presented in the paper? What is the
impact of the research on the field and what research questions should be
addressed to advance the field? -->
# Conclusions

* Summarize research
* Discuss how PAWS is helping law enforcement currently, and how these algorithms can be used to improve it
* Find a unique idea as a future research goal

# References



<!-- vim: set spell wrap linebreak nolist expandtab: -->
