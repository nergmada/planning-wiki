---
layout: default
title: ACOPlan
parent: Planners
permalink: /ref/planners/acoplan
nav_order: 10
---
# Ant Colony Optimisation (ACO) Plan

Page Contributors: {% git_author %}

{% planner_tag IPC2011 Satisfycing %}

Planner Quality: [14.9 out of 100](/ref/planners/rating)

Year Published: 2009

Paper: {% paper_link ACO Plan: Planning with Ants planners/acoplan 1 %} [ Baioletti, M.  Milani, A. Poggioni, V. Rossi, F ]

Preceded By: -

ACOPlan is a planner based on the ant colony optimization framework, in which a colony of planning ants searches for near optimal solution plans with respect to an overall plan cost metric. This approach is motivated by the strong similarity between the process used by artificial ants to build solutions and the methods used by state–based planners to search solution plans. Planning ants perform a stochastic and heuristic based search by interacting through a pheromone model.

## Support

ACOPlan has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. ACOPlan appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling ACOPlan

No Source code could be located for ACOPlan
