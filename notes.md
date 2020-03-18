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

# Restless Pachers: Handling Exploration-Exploitation Tradeoffs in Security Domains

This paper recognizes previous research in GSG but addresses the
exploration-exploitation tradeoff. A patroller cannot defend and explore new
territories simultaneously. Do they protect the targets that are already known
to have a lot of poaching activities or expllore the targets that haven't been
protected for a long time?

The idea behind this paper is to model the problem as a Restless Multi-armed
Bandit model to handle the limited observability challenge.

They use a learning algorithm to learn the RMAB model based on the defender's
historical observations.

Third, they use the Whittle index policy to index the data, that can then be
operated on using a binary search algorithm.

For this term paper, I need to focus on the learning algorithm specifically.


The learning model in use for this paper is Expectation Matching (EM)

Partially Observable Markov Decision Process model (POMDP) models an agent's
decision process. Every target in this game is modelled as a special POMDP
model (as specified in section 4.1). They combine all of the POMDP models to
form a special POMDP model that describes the whole problem. Solving the new
POMDP model gives us the exact optimal strategy for the defender (Section 5).
This can be solved naively, but grows exponentially based on the problem size.

The paper runs experiments using a random strategy as a control group, the
myopic (look ahead 1 round) strategy, exact POMDP (only for small scale
problems mentioned in section 5), and Whittle Index Policy. This paper
specifically compares the Whittle Index Policy to these other algorithms as
baselines.

On the large scale (n = 10), they cannot use the exact POMDP algorithm due to
the large problem size. They do show that using the Whittle Index Policy
out-performs all other strategies.

Furthermore the runtime only increases linearly instead of exponentially like
other algorithms.

The paper compares the RMAB model to the models used in another security paper,
and finds that it offers advantages when learning rounds become large.

This paper compares itself to other work ("When Security Games Go Green"). The
previous papers fail to caputre the defender's lack of observation of attacks.
The defender can only see a few attacks because of the size of the are. The
defender does not have full knowledge of all attacker's actions. The second
limitation mentioned is that the previous work does not address the fact that
defenders may not fully observe the attacker even though she's patrolling the
area. This is referred to as observational uncertainty.


# Don't Put All Your Strategies in One Basket: Playing Green Security Games with Imperfect Prior Knowledge

## Contributions

MINION-sm: a novel online learning algorithm for GSGs whihc does not rely on
any prior error-prone model of attacker behavior. Instead, it builds an
implicit model of the attacker on-the-fly while simultaneously generating
scheduling-constraint-aware patrols.


MINION: a hybrid approach where our MINION-sm model and an ML model (based on
historical data) are considered as two patrol planning experts and we obtain a
balance between them based on their observed empircal performance.

## Other Notes

This paper cites several sources [11, 12, 15, 16, 27] of information that could
be used as other examples of learning algorithms I can use on this paper.

The basic premise behind existing work is that repeated interactions between
patrollers and poachers provides the opportunity to gather data which can be
used to learn models of poacher behavior. This paper asserts that this model is
problematic:

It assumes the collected data is a good representation of the actual poaching
activities that occurred in the past ( and those that will occur in the
future). In other words, our observed data can only prove what we saw, not what
actually is happening. The attackers could be hiding their work very well. This
is known as the "Silent Victim Problem."

The data is unreliable (spatially).

The MINION-sm model trades off exploitation of welll-known high-reward patrol
routes with exporation of untried patrol routes to provide an online policy for
generating randomized patrols. In other words, it addresses the trade-offs
mentioned in the previous paper directly. It sounds like it favors exploration
over exploitation.

The MINION model combines both MINION-sm and a machine learning model (based on
previous papers). MINION evaluates which model is better and takes decisions
accordingly.

Their experiment differs from previous work in that the detection of snares is
disregarded. They assume the defenders can detect snares perfectly. It takes
into account that patrols must start and end at the same spot, and must cover
the same distance every time.

## Expert I - MINION-sm
MINION-sm starts with the FPL-UE (follow-the perturbed-leader with uniform
exploration) algorithm. It randomly flips a coin to choose between
exploration/exploitation. It is impractical for deployments in GSGs. MINION-sm
adds scheduling constraints to this algorithm. Randomness is added to ensure
the route chosen isn't fixed.

## Expert II - Machine Learning Model

Uses years of back-data to feed the inputs of the ML model. The outputs just
give predictions about probability scores (attack risks).


## Combining the two

The algorithm "learns" when it is useful to rely on historical data. If it's
useful, it will use the ML expert. Otherwise it will use the MINION-sm expert.

## Results of experiment

The MINION algorithm outperformed the ML-only algorithm drastically. The paper
concludes that we should not overly rely on historical data to compute the next
move.


# Definitions

## Expectation Matching (EM)

## Restless Multi-armed Bandit (RMAB)

## Wittle index policy

## Stackelberg Security Games (SSG)

TODO

## Stackelberg Assumption

TODO

## SUQR

Subject Utility Quantal Response

## Maximum Likelihood Estimation (MLE)

TODO

## Bayesian Updating

TODO

# Other notes

Green Security Games is different than Stackelberg Security Games in that:

* There are spatial/temporal scheduling considerations
* There are many repeated attackers
