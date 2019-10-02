---
layout: default
title: PDDL+
has_children: true
parent: Reference
permalink: /ref/pddlplus
nav_order: 4
---
# PDDL+

Contributors: {% git_author %}

PDDL+ introduced processes and events, to the domain of PDDL. Where previous updates to PDDL had introduced intractable rules such as `Derived Predicates` and `Constraints`, PDDL+ is the first to consider essentially actions which **must** be applied when their preconditions are met.

`Processes` directly correspond to a durative action and last for as long as their pre-condition is met. A process is something like gravity's effect on a ball, increases the velocity of the ball until it either reaches terminal velocity or indeed, it hits the ground.

`Events` directly correspond to instantaneous actions, and happen the instant their preconditions are met, usually with the effect of transforming their state such that their precondition is no longer met. `Events` are uncontrollable, and in our ball example, we might consider an event to be the ball hitting the ground. In that instance, the velocity of the ball is negated, and multiplied by some bounce coefficient.

`Processes` and `events` are still very much a challenge for some planners, and support is somewhat patch, with certain planners losing support for earlier features in PDDL in order to support this new feature. Most notably, `Processes` can (and usually do) have a continuous effect in a state, and therefore cause problems if we define a preference such as `preference (always (< (velocity ball) 10))`.

## Reference

- [PDDL+: Modelling Continuous Time Dependent Effects](https://pdfs.semanticscholar.org/d391/59cb5dfcc21aafd3049002d854ec341037a7.pdf) [Fox, M. Long, D.]