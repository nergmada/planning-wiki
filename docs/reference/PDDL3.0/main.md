---
layout: default
title: PDDL 3
has_children: true
parent: Reference
permalink: /ref/pddl3
nav_order: 3
---
# PDDL 3.0

Contributors: {% git_author %}

## Introduction
PDDL 3.0 {% cite pddl32005 %} introduced soft goals to planning. As planning has grown to handle larger more complex problem, the way we express goals has had to change. In previous editions a goal was unavoidable. It had to be met in order for a a plan to be considered valid.

With the introduction of preferences (soft goals), we are now able to express a desireable, but inconsequential goal. A goal which we would like to be satisfied but if it is not, then that is acceptable.

For each soft goal we express, we include a cost for not meeting it. This cost essentially indicates how the plan quality is affected when such goal is not met.

PDDL 3.0 also introduced constraints, a form of strong goal, which essentially can use the same keywords as used for preferences, but instead must be met for the plan to be considered valid.

This allows us to express things such as facts that must become true after another, or facts which must always be true. See the keywords included in the Constraints and Preferences sections below.

{% bibliography --cited %}