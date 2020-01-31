---
layout: default
#Check me
title: CBP
parent: Planners
#And Me
permalink: /ref/planners/cbp
#And me
nav_order: 18
---
# CBP: Cost Based planner

Page Contributors: {% git_author %}

{% planner_tag IPC2011 Satisfycing %}

Planner Quality: -

Year Published: 2011

Paper: {% paper_link IPC 2011 Booklet ipcbooklets/2011 21 %} [ Fuentetaja, R. ] 

Preceded By: -

CBP performs heuristic search in the state space using several heuristics. On one hand it uses look-ahead states based on relaxed plans to speed-up the search; on the other hand the search is also guided using a numerical heuristic and a selection of actions extracted from a relaxed planning graph. The relaxed planning graph is built taking into account action costs. The search algorithm is a modified Best-First Search (BFS) performing Branch and Bound (B&B) to improve the last solution found.

## Support

CBP has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. CBP appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling CBP

No Source code could be located for CBP
