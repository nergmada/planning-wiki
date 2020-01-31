---
layout: default
title: BRT
parent: Planners
permalink: /ref/planners/brt
nav_order: 17
---
# BRT: Biased Rapidly-exploring Tree

Page Contributors: {% git_author %}

{% planner_tag IPC2011 Satisfycing %}

Planner Quality: -

Year Published: 2011

Paper: {% paper_link IPC 2011 Booklet ipcbooklets/2011 17 %} [ Alcazar, V. Veloso, M. ] 

Preceded By: Fast Downward

This planner is a Rapidly-exploring Random Tree (RRT) adapted to automated planning that employs Fast-Downward as the base planner. The novelty in this case is that it does not sample the search space in a random way; rather, it estimates which propositions are more likely to be achieved along some solution plan and uses that estimation (called bias) in order to sample more relevant intermediates states. The bias is computed using a message passing algorithm on the planning graph with landmarks as support.

Random search, and random search with bias has been shown to have varying levels of success in planning, see our page on random search. [In Progress]

## Support

BRT has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. BRT appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling BRT

No Source code could be located for BRT
