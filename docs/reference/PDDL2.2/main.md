---
layout: default
title: PDDL 2.2
has_children: true
parent: Reference
permalink: /ref/pddl22
nav_order: 2
---
# PDDL 2.2

Contributors: {% git_author %}

## Introduction

PDDL 2.2 {$ cite pddl222004 %} introduces a key new feature not previously considered in PDDL, Timed Initial Literals. In previous versions, we assumed that a predicate was either true or false at the start.

This is not a realistic way of modelling because it fails to consider facts which may become true later. For example, in dynamic planning, where we are planning and re-planning as the world changes, we may wish to represent resources or states which are in the course of changing which we have no control over.

Imagine for instance, we are planning a rail schedule. We've generated some schedule from a plan, which the trains at this point in time are currently running to. Something goes wrong, for example a train breaks down. We now have less resources, but what we also have is a state that is currently in motion.

So for example we may have another dozen trains currently in use that won't become available until some later stage than the point we're currently planning at. We can't represent these realistically with actions because actions are optional, instead we need some mechanism to represent the uncontrollable change of state at a later point in time.

This is what timed initial literals allow us to do, by indicating at what point in time a fact which was previously false, becomes true.

Now we could arguably jury rig this behaviour with cleverly created durative actions and predicates, that are forced to run at a certain point and then subsequently release the resource after the time has elapsed, but these approaches will almost certainly have a significant overhead to them, because creating a durative action which the planners has to figure out it has to run in order to do everything else, will increase the state space necessary to explore.

Bottom line, Timed Initial Literals add a simple yet powerful new aspect to planning.

PDDL 2.2 also reintroduces Axioms as derived predicates, with a different simpler syntax to them. To be clear, these features are the same but consist of different syntax, typically planners support the newer syntax.

*This is speculative.

{% bibliography --cited %}