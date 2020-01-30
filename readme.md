---
layout: default
title: Home
permalink: /
nav_order: 0
---
{% if false %}
If you can see this and want to view the reference guide, you're in the wrong place, the reference guide has been rebranded and moved here: https://planning.wiki
{% endif %}

{% if site.url == "https://nergmada.github.io/planning-wiki/" %}
**WARNING** This is the old website, please use https://planning.wiki as this URL is closing 
{% endif %}

# Planning.Wiki - The AI Planning & PDDL Wiki

> [An] online compendium of planners and pddl material - Dr Malte Helmert

Our Contributors: {% git_author_all %}Jonathan Mounty

**[Join The Planning Community on Slack](https://join.slack.com/t/theplanningcommunity/shared_invite/enQtNjg0MTIzNTE3MTY4LTQ4YTRiNjhjNmVlNmEwMGMxOTQwNTZlYWM2YTk1YjdkZmIyMTU5MzRjZjYzOWYxMjJkNGM3YTM2MWI0MmM2MGY)**



## Introduction

This Wiki is here to provide easy access to resources related to the field of AI Planning. AI Planning is difficult to quantify under one roof, due to the variety of ongoing research in the field.

The International Conference on Autonomous Planning and Scheduling has in the course of supporting AI Planning research created a competition for the AI Planning Software (Planners) that have been built to solve AI Planning problems.

This competition, dating from 1998, has defined a general purpose definition language, Planning Domain Definition Language (PDDL) {% cite pddl1998 %}, which is designed to be capable of specifying any planning or scheduling problem you could come across.

In reality, PDDL since it's first incarnation in 1998 has had serious modifications to make it capable of handling the complex tasks we expect of modern autonomous planning and scheduling techniques. {% cite pddl212003 pddlplus2003 pddl222004 pddl32005 %}

For more details on PDDL, Planning, the history, the usage and the research, see the guide.

## Using This Guide

This wiki splits into three main sections, guide, reference and examples.

The guide section is here to help the uninitiated get an idea of what planning is and how it can be used. It glazes over technical details where they're complex and difficult to understand. *This is not intended to be a substitute to the copious academic literature written in the subject*.

The reference guide itself splits into two sections, one for the language of planners, PDDL. The other section for the planners which can read and solve PDDL problems.

The nature of AI planning and the language means that **not** all features are supported by all planners and not all techniques are used as often as others. The reference here aims to help with that by firstly showing next to each definition an indication of how well supported the feature is and how commonly used it is.

**Support**:

Universal
{: .label .label-blue }
High
{: .label .label-green }
Medium
{: .label .label-yellow }
Poor
{: .label .label-red }


**Usage**: 

High
{: .label .label-green }
Medium
{: .label .label-yellow }
Low
{: .label .label-red }
Rare/None
{: .label .label-purple }

For planners, this reference will aim to provide indication of what features are supported by what planners. It also provides useful hints and notes about the quirks and specific issues certain planners have in running certain problems.

## Community

To help grow the community and support available to new and experienced users alike, we work with The Planning Community slack, to help connect people working and using planning & PDDL. [Drop in and say hello](https://join.slack.com/t/theplanningcommunity/shared_invite/enQtNjg0MTIzNTE3MTY4LTQ4YTRiNjhjNmVlNmEwMGMxOTQwNTZlYWM2YTk1YjdkZmIyMTU5MzRjZjYzOWYxMjJkNGM3YTM2MWI0MmM2MGY)

## Contributions, Corrections and Feedback

![](https://media0.giphy.com/media/sOQ4Fil9Kh9e/giphy.gif?cid=790b76113afc9b4be0680ad083455794202737fe174b33a8&rid=giphy.gif)

[Contributions](/contribute) are always welcome!

The best way to provide multiple contributions is to request collaborator access to this repository, either via emailing adam.green@kcl.ac.uk or by filing an issue on [this repo](https://github.com/nergmada/planning-wiki). You can fork this repository to your GitHub, make changes and file a pull request.

Alternatively, if you are not able to provide a contribution, but maybe think there is something this guide is missing or is incorrect, please add a new issue to [this repo](https://github.com/nergmada/planning-wiki), and a correction, or additional will be made based on priority. Please use the "[Report a problem with this guide](https://github.com/nergmada/planning-wiki/issues/new/choose)" button available on most pages.

Finally, if you have a planner which you think should be included in this reference guide, please ask for collaborator access or fork the repository (if you're the creator of the planner), or create an issue (if you're a user) and we'll try to include it.

Any other issues/concerns should be sent to adam.green@kcl.ac.uk and I'll try to get back to you ASAP.

## Contents

This site breaks down into two major content sections
- the guide - Focuses on what planning is and using planning and planners to solve planning problems
- the reference - Provides a "handbook" to the language and the planners which solve the problems modelled in said language.

### FAQ

## Additional Resources
Below you can find a collection of resources for writing, learning and using PDDL and planning. For more information on what these tools and resources are and how they can help, please visit the [additional resources](/extras) page.

- [Planning.Domains](http://planning.domains/)
- Planner Tools
    - [VAL - The Plan Validator](https://nms.kcl.ac.uk/planning/software/val.html)
    - [ROSPlan - Planning in ROS](https://github.com/KCL-Planning/ROSPlan/)
    - [Eviscerator - The Planner tester](https://www.github.com/nergmada/eviscerator)
    - [Universal Planning Validator (Under Development)](https://github.com/aig-upf/universal-planning-validator)
- PDDL Tools
    - [Visual Studio Code](https://code.visualstudio.com/)
        - [PDDL Plugin for VSCode](https://marketplace.visualstudio.com/items?itemName=jan-dolejsi.pddl)
    - [Sublime Text Editor](https://www.sublimetext.com/)
        - [MyPDDL Plugin for Sublime](https://packagecontrol.io/packages/myPDDL)
    - [Atom Text Editor](https://atom.io/)
        - [MyPDDL Plugin for Atom](https://atom.io/packages/mypddl)
    - [Planning.Domains PDDL Editor](http://editor.planning.domains/)
- Learning Resources
    - [Learn PDDL by Fares K. Alaboud](https://fareskalaboud.github.io/LearnPDDL/)
    - [Introduction to AI Planning. Part I. (video)](https://www.youtube.com/watch?v=EeQcCs9SnhU)
    - [Introduction to AI Planning. Part II. (video)](https://www.youtube.com/watch?v=FS95UjrICy0)
- Publicly Available PDDL Domains
    - [IPC PDDL Domains](https://github.com/potassco/pddl-instances)
- Book: [An Introduction to the Planning Domain Definition Language](http://www.morganclaypoolpublishers.com/catalog_Orig/product_info.php?products_id=1384)

## References

{% bibliography %}

## Non Academic References
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [BNF Description of PDDL 3.0](/_citedpapers/pddl3bnf.pdf) [Gerevini, A. Long, D.]