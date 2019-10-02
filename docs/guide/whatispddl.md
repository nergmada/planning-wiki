---
title: What is PDDL?
parent: Guide
permalink: /guide/whatis/pddl
---
# What is Planning Domain Definition Language (PDDL)?

Contributors: {% git_author %}

## Introduction
Planning Domain Definition Language (PDDL) is a family of languages which allow us to define a planning problem. As planning has evolved, so to has the language used to describe it and as such there are now many versions of PDDL available with different levels of expressivity. 

This guide provides reference for six main evolutions of PDDL, starting with the syntax defined for the 1998 International Conference on Autonomous Planning and Scheduling's AIPS competition. It then looks at further evolutions into PDDL2.1, PDDL2.2, PDDL3.0 and PDDL+

This guide also provides information on some other flavours of PDDL but does not attempt to provide full on comprehensive documentation. 

## PDDL
Confusingly, this guide starts with PDDL version 1.2, which is typically the most basic syntax supported by planners this guide will look at. PDDL 1.2 is primarily driven by a predicate logic way of modelling. In PDDL1.2 we define a set of objects which have predicate properties (properties which are either true or false). 

We then define a set of actions which condition on, and then change these properties. For example we may have an object called "bricks" with the property "laid" set to false. In order to change this property from false to true our planner may have to apply some action "build wall" which has a condition that the bricks are not laid and the outcome (effect) that they are laid.

If we then expand this logic to include and, or, not, implies and the other traditional logical operators, we can begin to express more complex conditions and effects of our actions. Our ultimate aim in planning is achieve some goal state and this two is expressed as some kind of predicate formula.

In the case of our construction example we may want the following goal to be true
Walls Built AND Roof Built AND Windows Installed AND Plumbing fitted etc.

## PDDL 2.1
We now swap our version numbers around to make 2.1 and come onto the first major improvement of PDDL's expressivity, PDDL2.1 introduced two key elements, time and numbers, something which AI Planning syntax was previous unable to expressive (without contrived predicate based approaches) became possible. 

Planning with time and numbers is still quite difficult for both AI Planning and other approaches (such as Constraint Programming). PDDL2.1 models time through the use of a new type of action called a durative action. A durative action has essentially similar properties to a traditional PDDL1.2 action however it introduces a duration parameter which models the length of time an action takes.

It also creates three new points at which to condition on, at the start of the action, at the end of the action and over the duration of the action. It offers a similar ability with effects, wherein we can apply effects at the beginning or end of an action.

Numeric fluents - numbers - allow us to express resources, such as battery charge, materials or anything else which is numeric without distinct properties. Much like predicates, we can both condition on and effect numeric fluents, allowing us to for example model the need for and subsequent consumption of a resource.

## PDDL 2.2
PDDL2.2 provides incremental improvements on 2.1, adding two new features, derived predicates and timed initial literals. Derived predicates are predicates based on other predicates, which allow us to create a simple reusable predicate rather than a oredicate formula we repeated express in our actions

This could be for example, if plane on runway and has pilot then plane can take off. The "plane on runway" and "pilot in plane" are simple predicates and the "plane can take off" is a derived predicate.

Timed Iniial literals are a useful addition to temporal (time) planning, allowing us to express that a fact becomes true at a later point than at the start of the plan. This fact may be for example that a pilot wakes up at 7AM, however our plan starts at 0, which we could consider midnight, therefore the pilot doesn't become available until later in the plan.

## PDDL 3.0
PDDL 3,0 introduced soft constraints to AI planning. A soft constraint is one in which we would like something to happen, but if it is not possible, we are happy to live without it happening. This update to the language introduced a few new keywords to express different types of preferences we might want to be met.

It also assigns a cost to each preference, which is a measure of how much the plan quality decreases if the preference is not met. This allows the user to express Which of their preferences are more important (if any).

## PDDL+
PDDL+ introduced two core concepts, Processes and Events. Both are ways of expressing uncontrollable change in the world we are modelling. A process is something which always happens when it's preconditions are met and as such implements some effect on the domain. 

In a physical model, a process might be the effect of gravity on a ball when the ball is not being held.

An event provides an instantaneous version of a process. Something that happens exactly once when it's precondition is met. This could be for example the outcome of a ball hitting the floor and changing direction (from bouncing down to bouncing up) in a physical model.

## Other Flavours of PDDL
PDDL has a variety of other (more niche) flavours, such as PPDDL, NDDL, MADDL and a whole host of others all of which can be found conveniently listed on Wikipedia. Documenting these are harder as they tend of have more specific use cases and therefore less examples from which to extract behaviour.

If you wish for more information to be available about these, you should consider contributing to this guide. Alternatively, you should add an issue to the github, so we know there's community demand.