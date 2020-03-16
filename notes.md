# Overview

Introduce Green Security Games, how they are an application of Artificial
Intelligence Concepts. What concepts are applied? How is AI helping?

Focus on:

* Planning, learning in the Fang, Stone, Tambe paper
* Multi-agent systems and parameter learning in the Fang and Nguyen paper
* ML models and online learning in the Gholami et al paper.

Do not get hung up on Markov processes and models. I should be able to focus on
the models being proposed, how they differ from the models in the other papers
to solve the problem, and on the learning algorithms that are being discussed
to learn the different models.

# Strategy

* Introduce SSG
* Introduce field of Green Security
* Explain why traditional SSG is insufficient to model Green Security Domain concerns
* What is GSG? What advancements does it make over traditional SSG?
* What is the Plan Ahead algorithm (PA-M)? Fixed Sequence (FS-M)?
* What does each paper contribute to the GSG model?


# Green Security Games: Apply Game Theory to Addressing Green Security Challenges

Provides an overview of the application of Stackelberg Security Games (SSGs) to
Green Security domains.

Explains that there are unique differences to traditional security games, in
that failure of the attacker is often lower cost, leading to more frequent
attacks.

# When Security Games Go Green: Desigining Defender Strategies to Prevent Poaching and Illegal Fishing

Introduces Green Security Games.

It is a specification of a Stackelberg Security Game (SSG) that allows for
bounded rationality by the attacker along with partial observability of the
defender's strategies.

Previous work uses MLE to learn the parameters of the SUQR model for individual
attackers, which may lead to skewed results.

GSG incorporates Bayesian Updating to determine the optimal strategy for the
defender. The strategy proposed in this paper combines PA-M with Learning
Bayesian Update (Learn-BU) to form BU-PA-M-$\gamma$.

Experiments were run on a computer with a lot of memory using MATLAB. The
control group used a short-sighted strategy and applied MAXIMIN (which is
similar to min/max game trees) to find a solution.

They found that FS-M and PA-M(-$\gamma$) outperformed the myopic strategies.
They also found that, given PA-2 and FS-2 vastly outperformed PA-1 and FS-1,
planning is very important.

This paper also found that it is better to over-estimate the attacker's memory
of the defender's strategy.

They compared the effectiveness of a strategy where the defenders knew the
exact locations of the attackers against the machine-learning algorithms *BU*
and *BU$\prime$*, and found that they were very close. This indicates that the
proposed learning algorithms are very effective.



# Definitions

## Stackelberg Security Games (SSG)

TODO

## Stackelberg Assumption

TODO

## SUQR

TODO

## Maximum Likelihood Estimation (MLE)

TODO

## Bayesian Updating

TODO
