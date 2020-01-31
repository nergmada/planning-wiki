---
layout: default
#Check me
title: DecStar
parent: Planners
#And Me
permalink: /ref/planners/decstar
#And me
nav_order: 29
---
# DecStar: STAR-topology DECoupled Search Planner

Page Contributors: {% git_author %}

{% planner_tag IPC2018 Optimising %}

Planner Quality: -

Year Published: 2018

Paper: {% paper_link DecStar – STAR-topology DECoupled Search at its best planners/decstar 1 %} [ Gnad, D. Shleyfman, A. Hoffmann, J. ]

Preceded By: Fast Downward [Link Needed]

DecStar extends Fast Downward by Star-Topology Decoupling (STD). It exploits independence between components of a planning task to reduce the size of the state-space representation. Partitioning the state variables into components, such that the interaction between these takes the form of a star topology, decoupled search only searches over action sequences affecting the center component of the topology, and enumerates reachable assignments to each leaf component, separately. This can lead to an exponential reduction in the search-space representation size.

## Support

DecStar has not been tested with eviscerator yet. DecStar is designed for classical domains and so most likely does not support temporal numeric planning.

## Downloading and Compiling DecStar

Source code for DecStar can be found on a [BitBucket Submission](https://bitbucket.org/ipc2018-classical/team2/src/ipc-2018-seq-opt/) to IPC 2018