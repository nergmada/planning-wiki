---
layout: default
#Check me
title: Freelunch
parent: Planners
#And Me
permalink: /ref/planners/freelunch
#And me
nav_order: 35
---
# The Freelunch Planning System

Page Contributors: {% git_author %}

{% planner_tag IPC2014 Satisfycing %}

Planner Quality: -

Year Published: 2014

Paper: {% paper_link IPC 2014 Booklet ipcbooklets/2014 43 %} [ Balyo, T. ]

Preceded By: Fast Downward [Link Needed]

Freelunch is an open-source planning system written in Java. It takes input in the multivalued SAS+ format, which can be obtained from PDDL by the Fast Downward translation tool. Freelunch also provides a Java API to makeits use in Java applications convenient. The philosophy
of Freelunch is to first find a plan of arbitrary quality and then improve it using post planning optimization techniques. Several algorithms are implemented in Freelunch, many of them are based on translation of planning problems into satisfiability (SAT) and using a SAT solver.

## Support

Freelunch has not been tested with eviscerator yet. Freelunch is designed for classical domains and so most likely does not support temporal numeric planning.

## Downloading and Compiling Delfi

Source code for Freelunch can be found in a [Zip](https://helios.hud.ac.uk/scommv/IPC-14/repo_planners/seq-sat.zip) of submissions from IPC 2014

