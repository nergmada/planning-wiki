---
layout: default
title: DiNo
parent: Planners
permalink: /ref/planners/dino
nav_order: 28
---
# DiNo: Discrete Non-linear Heuristic Planner

Page Contributors: {% git_author %}

{% planner_tag temporal numeric %}

Year Published: 2016

Paper: [Heuristic Planning for PDDL+ Domains](https://www.ijcai.org/Proceedings/16/Papers/455.pdf) [Piotrowski, W. Fox, M. Long, D. Magazzeni, D. Mercorio, F.]

Preceded By: UPMurphi

Discretised Nonlinear Heuristic Planner (DiNo) with domain-independent planning heuristics and informed search algorithms. DiNo supports planning for linear and nonlinear continuous PDDL+ models with processes and events, as well as Timed Initial Literals and Timed Initial Fluents.

DiNo is based on the Discretise and Validate approach and it has been designed to automatically interface with the VAL plan validator.

DiNo has been developed as an extension of UPMurphi.

## Support
DiNo requires `:typing` in all domains it runs on, which makes it incompatible with [Eviscerator](https://www.github.com/nergmada/eviscerator). No support table has been generated. 

## Downloading and Compiling DiNo
For more information on how to download, visit [DiNo's GitHub page](https://github.com/KCL-Planning/DiNo), which includes a comprehensive compilation guide

## Additional Notes
DiNo supports non-linear continuous effects through discretisation, which is its main purpose.