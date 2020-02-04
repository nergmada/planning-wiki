---
layout: default
#Check me
title: HSP
parent: Planners
#And Me
permalink: /ref/planners/hsp
#And me
nav_order: 38
---
# HSP: Heuristic Search Planner

Page Contributors: {% git_author %}

{% planner_tag IPC1998 IPC2000 Satisfycing %}

Planner Quality: -

Year Published: 1998

Paper: {% paper_link A Heuristic Search Approach to Planning with Temporally Extended Preferences planners/hplanp 1 %} [ Baier, J. A. Bacchus, F. McIlraith, S. A. ]

Preceded By: -

HSP is a planner based on the idea of Heuristic State Space search. In PDDL based planning, it may be the first of its kind, however, it should be noted that STRIPS which PDDL is based on has been around significantly longer. HSP's heuristic is based on the delete free planning relaxation.

HSP's heuristic should not be confused with that of FF's [Link Needed], which is also a delete free relaxation of the planning problem. 

HSP has been the inspiration for several other HSP styled planners, including YAHSP [Link Needed].

HSP was redeveloped for the second IPC (2000) and entered as HSP2.

## Support

HSP has not been tested on eviscerator yet. It is a classical planner and predates any temporal or numeric enhancements to the language of PDDL.

## Downloading and Compiling HSP

Source code for HPlan-P could not be found. Planners published on or before the fifth IPC tend not to have source code available as source code publishing only became a requirement of IPC 2008.