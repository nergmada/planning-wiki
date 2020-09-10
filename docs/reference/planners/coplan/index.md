---
layout: default
#Check me
title: Co-Plan
parent: Planners
#And Me
permalink: /ref/planners/coplan
#And me
nav_order: 25
---
# Co-Plan

Page Contributors: {% git_author %}

{% planner_tag IPC2008 Optimising %}

Planner Quality: -

Year Published: 2008

Paper: {% paper_link CO-PLAN: Combining SAT-Based Planning with Forward-Search planners/coplan 1 %} [ Robinson, N. Gretton, C. Pham, D. N. ]

Preceded By: -

Co-Plan, a two-phase propositional planning system for the cost-optimal case. During the first phase, Co-Plan constructs the n-step plangraph for increasing values of n, passing the corresponding decision problem at each stage to a modified Boolean satisfiability procedure. This procedure determines whether an nstep plan exists, and if so identifies a plan that has the minimal action cost given the plan length bound n. The second phase proceeds as soon as the first phase yields a plan. This consists of a forward-search in the problem state space, bounded by the action-cost of the best plan found during the first phase.

## Support

Co-Plan has not been tested with eviscerator yet. Co-Plan is designed for classical domains and so most likely does not support temporal numeric planning.

## Downloading and Compiling Co-Plan

Co-Plan planner source code can be downloaded from a [Zip](http://icaps-conference.org/ipc2008/deterministic/data/planners/seq-opt-co-plan.tar.bz2) submitted to IPC 2008