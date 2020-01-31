---
layout: default
#Check me
title: CFDP
parent: Planners
#And Me
permalink: /ref/planners/cfdp
#And me
nav_order: 20
---
# CFDP: Cost Optimal Planning based on FDP

Page Contributors: {% git_author %}

{% planner_tag IPC2008 Optimising %}

Planner Quality: -

Year Published: 2008

Paper: {% paper_link CFDP:  an approach to Cost-Optimal Planning based on FDP planners/cfdp 1 %} [ Grandcolas, S. Cyril Pain-Barre, C. ] 

Preceded By: FDP

CFDP is a planning system based on the paradigm of planning as constraint satisfaction, that searches for cost optimal plans. It uses an Iterative Deepening Depth First Search procedure. CFDP works directly on a structure related to Graphplan’s planning graph: given a fixed bound on the length of the plan, the structure is incrementally build. Each time the structure is extended, a search for cost-optimal sequential plans is made.

## Support

CFDP has not been tested with eviscerator yet. Fast Downward forms the base planner of CFDP, please refer to the Fast Downward [Link Needed] page for an idea of the supported features in this planner

## Downloading and Compiling CFDP

CFDP planner source code can be downloaded as a [Zip](http://icaps-conference.org/ipc2008/deterministic/data/planners/C-fdp.pdf) based on its submission to IPC 2008
