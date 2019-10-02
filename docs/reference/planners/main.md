---
layout: default
title: Planners
has_children: true
parent: Reference
permalink: /ref/planners
nav_order: 5
---

# Planners

Contributors: {% git_author %}

An AI Planner is the other half of the proverbial planning equation. Where PDDL allows us to define an AI Planning problem, an AI Planner allows us to attempt to solve one. An AI planner reads in PDDL and uses it in order to decompose and solve the problem.

As AI Planners have evolved alongside the languages they use, different planners have different levels of support for different syntaxes. Older planners do not support more expressive syntaxes such as PDDL3.0 or PDDL+. In some cases, however, older styles of syntax have been deprecated and as such some newer planners may not support certain variants of syntax. 

This means that in some cases a newer planner may not be capable of running an older problem and an older planner may not be capable of running a newer problem. In an attempt to combat this problem, as this guide evolves we'll attempt to include notes about what functionality a broad range of planners support.

There are however a really wide array of planners and some are objectively better or worse than others either unilaterally or in solving specific instances. 

