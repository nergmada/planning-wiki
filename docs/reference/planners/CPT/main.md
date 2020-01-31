---
layout: default
#Check me
title: CPT
parent: Planners
#And Me
permalink: /ref/planners/cpt
#And me
nav_order: 27
---
# CPT (2, 3 & 4): Constraint Programming Temporal Planner

Page Contributors: {% git_author %}

{% planner_tag IPC2004 IPC2006 IPC2011 Optimising Temporal %}

Planner Quality: -

Year Published: 2004

Paper: {% paper_link CPT planners/cpt 1 %} [ Vidal, V. ], {% paper_link CPT 2 planners/cpt2 1 %} [ Vidal, V. ], {% paper_link IPC Booklet 2011 (CPT 4) ipcbooklets/2011 25 %} [ Vidal, V. ]  

Preceded By: -

CPT is a family of temporal planners, consisting of CPT, CPT2, CPT3 and CPT4. CPT is a Constraint Programming based approach to the Optimal Temporal problem in planning. This planner relies of Partial Order Causal Link (POCL) based branching in the search space, and uses Constraint Programming (CP) to perform pruning and reduce the search space (see sections on CP and POCL [In Progress]).

## Support

CPT has not been tested with eviscerator yet. CPT is designed for temporal domains and so most likely does not support numeric planning, it probably supports classical (non-temporal numeric) planning, but is probably less efficient in these domains.

## Downloading and Compiling CPT

CPT3 planner source code can be downloaded from a [Zip](http://icaps-conference.org/ipc2008/deterministic/data/planners/seq-opt-cpt3.tar.bz2) submitted to IPC 2008. CPT4 can be found on the personal website of Vincent Vidal [here](http://v.vidal.free.fr/onera/#cpt)

IPC 2008 notes the following about CPT3:

> We encountered problems when compiling the planner on 64-bit machines. Specifically, compilation succeeded, but the planner failed on solvable instances (e.g. Peg Solitaire #1). Hence, we recommend compiling the planner on 32-bit machines, which worked for us. (Running the 32-bit planner on a 64-bit machine did not cause problems.)