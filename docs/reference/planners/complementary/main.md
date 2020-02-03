---
layout: default
#Check me
title: Complementary
parent: Planners
#And Me
permalink: /ref/planners/complementary
#And me
nav_order: 24
---
# Complementary (1 & 2)

Page Contributors: {% git_author %}

{% planner_tag IPC2018 Optimising %}

Planner Quality: -

Year Published: 2018

Paper: {% paper_link Complementary1 planners/complementary1 1 %} [ Franco, S. H. S. Lelis, L. Barley, M. Edelkamp, S. Martinez, M. Moraru, I. ], {% paper_link Complementary1 planners/complementary2 1 %} [ Franco, S. H. S. Lelis, L. Barley, M. ]

Preceded By: Fast Downward

The Complementary planners uses pattern databases (PDBs). A PDB is a heuristic function in the form of a lookup table that contains optimal solution costs of a simplified version of the task (see our page on PDBs [In Progress]). In this planner they use a method that dynamically creates multiple PDBs which are later combined into a single heuristic function. At a given iteration, the method uses estimates of the search space size to create a PDB that complements the strengths of the PDBs created in previous iterations.

Complementary1 make improvements on Complementary2, removing time limits, and restrictions on the initial size of the pattern database used. New seeding algorithms were also introduced.

## Support

Complementary has not been tested with eviscerator yet. Fast Downward forms the base planner of Complementary, please refer to the Fast Downward [Link Needed] page for an idea of the supported features in this planner

## Downloading and Compiling Complementary

Complementary1 planner source code can be downloaded from a [BitBucket Submission](https://bitbucket.org/ipc2018-classical/team9/src/ipc-2018-seq-opt/) to IPC 2018

Complementary2 planner source code can be downloaded from a [BitBucket Submission](https://bitbucket.org/ipc2018-classical/team32/src/ipc-2018-seq-opt/) to IPC 2018