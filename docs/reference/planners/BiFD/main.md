---
layout: default
title: BiFD
parent: Planners
permalink: /ref/planners/bifd
nav_order: 15
---
# BiFD - Bi-directional Fast Downwards

Page Contributors: {% git_author %}

{% planner_tag IPC2014 Satisfycing %}

Planner Quality: -

Year Published: 2014

Paper: {% paper_link IPC 2014 Booklet ipcbooklets/2014 18 %} [ Alcazar, V. Fernandez, S. Borrajo, D. ]

Preceded By: Fast Downward

Bi-directional Fast Downward is a 2-portfolio planner comprising of Fast Downward and Fast Downward Regression (FDr), when searching it conducts search from the initial state to the goal state, and vice versa. Most domains used as benchmarks in automated planning are asymmetrical. In general, it is unclear whether searching forward or backward is the best option a priori. Furthermore, planners that search backward have important differences (both advantageous and disadvantageous) with those that search forward. Here we propose BiFD, which combines Fast Downward with FDr (Fast Downward Regression) in a portfolio. This aims to exploit the advantages of searching in both directions while trying to minimize their disadvantages.

## Support

BiFD has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. BiFD appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling BiFD

No Source code could be located for BiFD
