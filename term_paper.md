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
defenders leave footsteps that can be used to evade and track. Finally Gholami
et al. [@gholami19] show that a defender strategy that combines a
machine-learning agent with an online learning algorithm that does not rely on
prior information can outperform existing models.

<!-- Discuss in the second section the methods or the theories that you
studied. Summarize the methods that you have reviewed. -->
# Methods/Theory

<!-- Summarize the results of the research. Then write up your reflection of
the methods and/or theories that you studied in the selected paper. Be critical
in your analysis. Are the methods/theories that the authors present sound? What
do you see as the weaknesses and strengths of the proposed methods? -->
# Discussions

<!-- Write up a conclusion that summarizes your analysis of the research. Has
the field been advanced with the research presented in the paper? What is the
impact of the research on the field and what research questions should be
addressed to advance the field? -->
# Conclusions

# References



<!-- vim: set spell wrap linebreak nolist expandtab: -->
