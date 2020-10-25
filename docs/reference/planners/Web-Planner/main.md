---
layout: default
title: web-planner
parent: Planners
permalink: /ref/planners/web-planner
nav_order: 100
---
# Web-Planner

Page Contributors: {% git_author %}

{% planner_tag Optimising Satisfycing %}

Year Published: 2017

Paper: [WEB PLANNER: A Tool to Develop Classical Planning Domains and Visualize Heuristic State-Space Search](http://icaps17.icaps-conference.org/workshops/UISP/uisp17proceedings.pdf#page=36) [Magnaguagno, M. Pereira, R. More, M. and Meneguzzi, F.]

Similar to [Planning.Domains](#planning.domains), it is a planner in the cloud with editing, verification, validation and visualization capabilities.
Web-Planner is available at https://web-planner.herokuapp.com/
The editor supports syntax highlighting for PDDL and shows domain (left), problem (center) and output (right) at the same time.
Under the output console a plan button is available to invoke the planner.
PDDL verification and validation are available through the plan button caret.
The verification looks for common errors in the description, such as missing requirements, non-declared variables and objects and reports it to the user.
The validation does the verification and with a user-provided plan is able to identify which preconditions or effects are failing in the current planning instance.
The visualization is accessible through the top menu and contains:
- Heuristic View: state-space explored during planning using Breadth-First Search or Best-First Search with Hamming distance.
- Dovetail: plan explorer, showing how each state is changed during plan execution.

For more information see:
- [DOVETAIL - An Abstraction for Classical Planning Using a Visual Metaphor](https://www.aaai.org/ocs/index.php/FLAIRS/FLAIRS16/paper/viewFile/12966/12544) - FLAIRS 2016
- [WEB PLANNER: A Tool to Develop Classical Planning Domains and Visualize Heuristic State-Space Search](http://icaps17.icaps-conference.org/workshops/UISP/uisp17proceedings.pdf#page=36) - ICAPS/UISP 2017
- [Develop, Visualize and Test Classical Planning Descriptions in your Browser](http://www.meneguzzi.eu/felipe/pubs/icaps-webplan-demo-2019.pdf) - ICAPS/Demos 2019.
- [Knowledge Engineering Tools and Techniques for AI Planning](https://www.springer.com/gp/book/9783030385606) - chapter 11, Springer 2020

## Support

|Requirement | Supported?|
| --- | --- |
|**PDDL1.2** |
|:strips | Yes |
|:typing | Yes |
|:disjunctive-preconditions | No |
|:equality | Yes |
|:existential-preconditions | No |
|:universal-preconditions | No |
|:conditional-effects | No |
|:domain-axioms | No |
|:subgoals-through-axioms | No |
|:safety-constraints | No |
|:open-world | No |
|:quantified-preconditions | No |
|:adl | No |
|:ucpop | No |
|**PDDL2.1** |
|:numeric-fluents | No |
|:durative-actions | No |
|:duration-inequalities | No |
|:continuous-effects | No |
|:negative-preconditions | Yes |
|**PDDL2.2** |
|:derived-predicates | No |
|:timed-initial-literals | No |
|**PDDL3.0** |
|:constraints | No |
|:preferences | No |
|**PDDL3.1** |
|:action-costs | No |
|:goal-utilities | No |
|**PDDL+** |
|:time | No |

Constants are not supported, every literal term is expected to be an object.
Types are not required for fast/compact grounding, rigid preconditions for every parameter are enough.

## Additional Notes

The visualization capabilities of Web-Planner are also available as plugins for Planning.Domains:
- [Dovetail](https://github.com/AI-Planning/dovetail)
- [Statespace](https://github.com/AI-Planning/statespace)