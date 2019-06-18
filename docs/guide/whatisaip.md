---
layout: page
title: What is AI Planning?
parent: Guide
permalink: /guide/whatis/aip
---
# What is AI Planning?

Contributors: {% git_author %}

## Introduction
AI Planning is a field of Artificial Intelligence which explores the process of using autonomous techniques to solve planning and scheduling problems. A planning problem is one in which we have some initial starting state, which we wish to transform into a desired goal state through the application of a set of actions.

In a simple example, imagine we wish to build a house. On our building site we can assume all the materials are ready to be used and we essentially now have to decide which order to perform construction in. Each step of construction in this situation could be modelled as an action (for example laying foundations, building the walls, installing the plumbing and electricals etc.). 

Certain actions cannot happen before others - we cannot build a wall before we have a foundation - so through the use of predicate logic we can express this problem by saying "if there is no foundation, we cannot build a wall". 

AI planning can leverage this form of expression in order to solve this problem and others. Of course in reality planning the construction of a house is not particularly difficult, but imagine instead we were planning the construction of an Olympic stadium. The same problem can be broken down into similar simple tasks which are dependent on priot conditions being met

## Domain Independent Planning
The core philosophy built into PDDL, and as a result many planners, is that the techniques applied to solving a problem should know nothing about the problem they are solving.

That is to say the techniques which we apply to solve for example a logistics problem, we could also apply to a manufacturing problem. This is interesting because unlike other fields of Artificial Intelligence, such as Machine Learning, we are not dependent on there being pre-existing information on the problem, or the path to a solution, other than the starting state, the actions we can apply and the end state.

Often these three pieces of information are readily available, purely from the nature inherent to the problems a planner is trying to solve. 

For example if we are planning the construction of large stadium, we know what needs to be completed in order for the stadium to be finished, we know that there is currently no stadium built and we know the different actions that can be performed to change the state closer to the position we desire it to be in.

We need no knowledge of how previous stadiums were built, or what orderings were used (for example building foundations then frames etc.). This lack of need for knowledge means we can approach problems which for example have not been previously solved.

Also, if we assume that previous solutions to a planning problem are sub-optimal (i.e. they're not as good as they could be), applying a technique like learning would essentially train to solve problems sub-optimally. Therefore we need any appraoch which is methodical, objective and avoids learning from prior approaches which are sub-optimal.

## State Space Search
Although there is a lot more to solving a plan than a state space search, the general (but not universal) unifying factor of different planners is that they perform some kind of "state space" search.

If we imagine that from the initial state, we can access various new states, by applying actions, the result is we form a tree of possible states, with the initial state being the root. From that root we perform a search, attempting to find a state as close as possible to the root, which has all of the facts we need in order to satisfy the goal.

