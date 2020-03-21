---
documentclass: article
title: A Survey of Advancements in Green Security Games
author: Joe McCall
date: CAP5600
abstract: |
  The field of Green Security Games (GSG) has proven useful in the protection of
  wildlife. By modelling attackers and defenders as intelligent agents in a
  repeated simulation we can employ a winning algorithm to deploy scarce
  resources in actual green security scenarios. This paper summarizes the concept
  of GSGs, surveys the advancements that have been made, and suggests future
  opportunities for research.
fontfamily: mathptmx 
fontsize: 10pt
bibliography: 
   - acm_2832581.2832611.bib
   - acm_2936924.2936946.bib
   - acm_2994501.2994507.bib
   - deep_reinforcement.bib
   - acm_3306127.3331719.bib
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
fishers and rangers charged to protect the wildlife. The rangers are limited in
number and have strict constraints applied. 

In the field of Artificial Intelligence, Stackelberg Security Games (SSG) have
been used to predict potential attacker moves in order to assist in defender
strategies. The application of this strategy to green security domains is
called Green Security Games (GSG, introduced by [@fang15]). The game abstracts
the reality of poachers versus rangers patrolling a vast wildlife area into a
grid-based simulation between attackers and defenders, both of which are AI
agents. The attacker's goal is to place snares for wildlife without being
caught, while the defender's goal is to detect both the snare and the attacker.
Furthermore, the attacker behaves human-like and does not always behave
optimally.

The game is run in episodes [@fang15]. By simulating multiple rounds of this
game, an optimized defender strategy is formed. This strategy is applicable to
assist real-world rangers in deciding where and how patrols should be deployed.

Advancements in this field introduce additional constraints, challenge
assumptions, and propose novel methods for improving defender strategy. Qian et
al. [@qian16] show that the environment must be partially-observable to model
the defender's decision to explore new areas or patrol areas known to have
snares. Wang et al. [@wang19] introduce the idea that both attackers and
defenders have access to real-time information that can be used to evade and
track. Finally Gholami et al. [@gholami19] show that a defender strategy that
combines a machine-learning agent with an online learning algorithm that does
not rely on prior information can outperform existing models.

<!-- Discuss in the second section the methods or the theories that you
studied. Summarize the methods that you have reviewed. -->
# Methods/Theory

## Green Security Games (GSG)

The Green Security Game as introduced by Fang et al. [@fang15] is a zero-sum
game. It is run in T ( $<\infty$ ) rounds, and each round has multiple
episodes. The defender has K guards to protect N ($\ge K$) targets, each with a
different reward. A guard (defender) can defend one target and an attacker can
attack one target. If the attacker attacks an unguarded target, the defender is
penalized and the attacker is rewarded. If the attacker attacks a defended
target, the attacker is penalized and the defender is rewarded. After each
round the defender assigns guards in order to maximize the expected utility.

## Exploration/Exploitation Tradeoffs

Explain what Qian et al. [@qian16] show as a shortcoming of GSG [@fang15].

### Restless Multi-armed Bandit (RMAB) Problem

### Whittle Index Policy Algorithm

## Real-Time Information

Explain what Want et al. [@wang19] show as shortcomings of prior work, and how
GSG-I augments the existing game and DeDOL helps to solve it.

### GSG-I Problem

### DeDOL Algorithm

## Imperfect Prior Knowledge

Explain what Gholami et al. [@gholami19] show as shortcomings of prior work, and how MINION-sm and MINION help improve defender strategies in GSGs.

### MINION-sm

### MINION

<!-- Summarize the results of the research. Then write up your reflection of
the methods and/or theories that you studied in the selected paper. Be critical
in your analysis. Are the methods/theories that the authors present sound? What
do you see as the weaknesses and strengths of the proposed methods? -->
# Discussions

Include:
* GSG abstraction - benefits and trade-offs. What benefit does the GSG abstraction have over an attempted perfect simulation?
* RMAB - How does this improve on the GSG abstraction? Are there any assumptions being made?
* GSG-I - Same question
* MINION - Is this seemingly the ultimate solution? How would it perform against GSG-I? How can its work be combined with previous work discussed in this paper?

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
