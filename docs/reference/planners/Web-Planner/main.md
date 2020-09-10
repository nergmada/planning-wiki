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

Paper: [WEB PLANNER: A Tool to Develop Classical Planning Domains and Visualize Heuristic State-Space Search](http://icaps17.icaps-conference.org/workshops/UISP/uisp17proceedings.pdf#page=36) [Magnaguagno, M. Pereira, R. Móre, M. and Meneguzzi, F.]

Similar to [Planning.Domains](#planning.domains), it is a planner in the cloud with editor, verification, validation and visualization capabilities.
The planner is available at https://web-planner.herokuapp.com/
For more information see:
- [DOVETAIL - An Abstraction for Classical Planning Using a Visual Metaphor](https://www.aaai.org/ocs/index.php/FLAIRS/FLAIRS16/paper/viewFile/12966/12544) - FLAIRS 2016
- [WEB PLANNER: A Tool to Develop Classical Planning Domains and Visualize Heuristic State-Space Search](http://icaps17.icaps-conference.org/workshops/UISP/uisp17proceedings.pdf#page=36) - ICAPS/UISP 2017
- [Develop, Visualize and Test Classical Planning Descriptions in your Browser](http://www.meneguzzi.eu/felipe/pubs/icaps-webplan-demo-2019.pdf) - ICAPS/Demos 2019.
- [Knowledge Engineering Tools and Techniques for AI Planning](https://www.springer.com/gp/book/9783030385606) - chapter 11, Springer 2020

## Support

The planner supports ``:strips``, ``:negative-preconditions``, ``:equality`` and ``:typing`` requirements.
Types are not required for fast/compact grounding, rigid preconditions for every parameter are enough.

## Additional Notes

Visualization capabilities of Web-Planner are also available as plugins for Planning.Domains:
- [Dovetail](https://github.com/AI-Planning/dovetail)
- [Statespace](https://github.com/AI-Planning/statespace)