---
layout: default
title: Kairos
parent: Planners
permalink: /ref/planners/kairos
nav_order: 40
---
# Kairos

Page Contributors: {% git_author %}

{% planner_tag temporal numeric %}

Year Published: 2026

Home Page: [PlanSys2/kairos](https://github.com/PlanSys2/kairos) (Apache-2.0)

Kairos is a planner for PDDL 2.1 to 3.1 and PDDL+, written in C++20 for robotics and used as the default planner of PlanSys2, the ROS 2 planning framework. Sequential and numeric tasks are searched with heuristics such as FF, landmarks and novelty; temporal tasks either compress durative actions and reschedule them, or search start and end snap actions over a simple temporal network, as POPF does; PDDL+ tasks (processes, events, continuous effects) are planned in steps of time, and every plan is validated in continuous time. Tasks too large to ground are searched without grounding. It is anytime, validates every plan it returns, and answers "unsolvable" only with a proof.

It runs as a command (`kairos domain.pddl problem.pddl`) or as a C++ library, and can be installed from planutils or, in ROS 2, as `ros-$ROS_DISTRO-kairos`.

## Support

|Requirement|Supported?|
|-|-|
|**PDDL 1.2**
|:strips| Yes
|:typing| Yes
|:disjunctive-preconditions| Yes
|:equality| Yes
|:existential-preconditions| Yes
|:universal-preconditions| Yes
|:conditional-effects| Yes
|:quantified-preconditions| Yes
|:adl| Yes
|**PDDL 2.1**
|:numeric-fluents| Yes
|:durative-actions| Yes
|:duration-inequalities| Yes
|:continuous-effects| Yes
|:negative-preconditions| Yes
|**PDDL 2.2**
|:derived-predicates| Yes
|:timed-initial-literals| Yes
|**PDDL 3**
|:constraints| Yes
|:preferences| Yes
|**PDDL 3.1**
|:action-costs| Yes
|:object-fluents| Yes
|**PDDL+**
|:time (processes and events)| Yes
