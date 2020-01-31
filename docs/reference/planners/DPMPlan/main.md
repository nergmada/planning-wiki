---
layout: default
title: DPMPlan & MIPlan
parent: Planners
permalink: /ref/planners/dpmplan
nav_order: 32
---
# DPMPlan & MIPlan

Page Contributors: {% git_author %}

{% planner_tag IPC2014 Optimising %}

Year Published: 2014

Paper: {% paper_link IPC 2014 Booklet ipcbooklets/2014 23 %} [Núñez, S. Borrajo, D. Linares López, C.]

Preceded By: -

MIPlan portfolios have been generated using Mixed-Integer Programming (MIP), which computes the portfolio with the best achievable performance with respect to a selection of training planning tasks. The resulting portfolio is a linear combination of candidate planners defined as a sorted set of pairs < planner, time >

The idea behind DPMPlan is to modify the objective function used to configure MIPlan in a temporal objective function. Thereby, the MIP task will maximize the objective function for each instant (measured in seconds).

## Support

MIPlan and DPMPlan has not been tested with eviscerator yet. DPMPlan and MIPlan are designed for classical domains and so most likely do not support temporal numeric planning.

## Downloading and Compiling DPMPlan & MIPlan

Both MIPlan and DPMPlan can be found in this [zip](https://helios.hud.ac.uk/scommv/IPC-14/repo_planners/seq-opt.zip) of submissions to IPC 2014