---
layout: default
#Check me
title: HPlan-P
parent: Planners
#And Me
permalink: /ref/planners/hplanp
#And me
nav_order: 37
---
# HPlan-P: Heuristic Planning with Preferences

Page Contributors: {% git_author %}

{% planner_tag IPC2006 Optimising %}

Planner Quality: -

Year Published: 2006

Paper: {% paper_link A Heuristic Search Approach to Planning with Temporally Extended Preferences planners/hplanp 1 %} [ Baier, J. A. Bacchus, F. McIlraith, S. A. ]

Preceded By: TLPlan

HPlan-P is a classical planner designed to reason with temporally extended preferences. This is not to be confused with temporal planning where the objective is to reason with time. Temporally extended preferences, are preferences that express desired properties of the plan order, or rather the ordering in which facts should ideally be achieved. 

Referring to PDDL3 [Link Needed], preferences can express properties such as `(sometime-after f g)` where in, fact `f` should be achieved sometime after fact `g`.

This means an action which achieves `f` should be placed after an action that achieves `g`, thus imposing an ordering on the plan. HPlan-P introduces techniques for reasoning with preferences.

## Support

HPlan-P has not been tested with eviscerator yet. It was developed for classical planning domains and so most likely has no temporal or numeric support.

## Downloading and Compiling HPlan-P

Source code for HPlan-P could not be found. Planners published on or before the fifth IPC tend not to have source code available as source code publishing only became a requirement of IPC 2008.