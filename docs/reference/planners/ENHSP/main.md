---
layout: default
title: ENHSP
parent: Planners
permalink: /ref/planners/enhsp
nav_order: 33
---
# ENHSP: Expressive Numeric Heuristic Search Planner

Page Contributors: {% git_author %}

{% planner_tag temporal numeric %}

Year Published: 2016

Paper: {% paper_link Interval-Based Relaxation for General Numeric Planning planners/enhsp 1 %} [Scala, E. Haslum, P. Thiebaux, S. Ramirez, M.]

ENHSP, which stands for Expressive Numeric Heuristic Planner is a forward heuristic search planner. It supports the following 

1. Satisficing and Optimal Numeric Planning
2. Numeric Planning with linear and non-linear expressions
3. Planning with discretised autonomous processes and events
4. Global constraints, which are the analogous of always constraints of PDDL
5. Discrete events
6. Universal and existential quantification in formulas (action precondition, constraints and goals)
7. Negative preconditions
8. Novel heuristics based on landmarks and search techniques for planning with autonomous processes

## Support
ENHSP requires `:typing` in all domains it runs on, which makes it incompatible with [Eviscerator](https://www.github.com/nergmada/eviscerator). No support table has been generated. 

## Downloading and Compiling ENHSP
For more information on how to download, compile and use ENHSP, visit its [GitLab page here](https://gitlab.com/enricos83/ENHSP-Public). 

## Additional Notes
- ENHSP grounding is not optimised; this can become a bottleneck when your actions involve many many parameters
- ENHSP does not support durative actions
- Optimal planning is only supported for what is called simple numeric planning, i.e., only increase/decrease effects of constants, and only linear numeric conditions. Objective function can be linear combination of numeric fluents. If no objective function is given, the planner minimises the number of actions.

## Other Relevant Papers ENHSP is built on
[Heuristics for Numeric Planning via Subgoaling](https://www.ijcai.org/Proceedings/16/Papers/457.pdf) [Scala, E., Haslum, P. and Thiébaux, S.]
[Landmarks for Numeric Planning Problems](https://www.ijcai.org/Proceedings/2017/0612.pdf) [Scala, E. Haslum, P. Thiebaux, S. and Magazzeni D.]
[Effect-Abstraction Based Relaxation for Linear Numeric Planning](https://www.ijcai.org/Proceedings/2018/0665.pdf) [Li, D. Scala, E. Haslum, P. and Bogomolov, S]