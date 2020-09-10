---
layout: default
#Check me
title: Cerberus
parent: Planners
#And Me
permalink: /ref/planners/cerberus
#And me
nav_order: 20
---
# Cerberus: Red Black Planning with Mutex Detection and Novelty Heuristic

Page Contributors: {% git_author %}

{% planner_tag IPC2018 Satisfycing %}

Planner Quality: -

Year Published: 2018

Paper: {% paper_link Cerberus: Red-Black Heuristic for Planning Tasks with Conditional Effects Meets Novelty Heuristic and Enchanced Mutex Detection planners/cerberus 1 %} [ Katz, M. ] 

Preceded By: Mercury

Cerberus is built on top of Mercury, a planner which makes use of a Red-Black Heuristic (see our page on Red-Black Heuristics [In Progress]). With the introduction of novelty based heuristic guidance, Cerberus is designed to have better support for Conditional Effects. Furthermore, Cerberus does "Enhanced [Mutual Exclusion] Detection" to derive a SAS+ Planning task (see our page on SAS+ Planning [In Progress]). This allows it to perform a best-first search using the red-black planning heuristic. 

## Support

Cerberus has not been tested with eviscerator as we could not get the source code to compile in a way to test it. Cerberus appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling Cerberus

Cerberus planner source code with a singularity container support can be found as part of a [BitBucket Submission](https://bitbucket.org/ipc2018-classical/team15/src/ipc-2018-seq-sat/) to IPC 2018

Cerberus-gl has source code located [here](https://bitbucket.org/ipc2018-classical/team16/src/ipc-2018-seq-sat/) submitted to the same IPC