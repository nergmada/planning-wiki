---
layout: page
title: What is a planner?
parent: Guide
permalink: /guide/whatis/planner
---
# What is a planner?
## Introduction
[Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

An AI Planner is the other half of the proverbial planning equation. Where PDDL allows us to define an AI Planning problem, an AI Planner allows us to attempt to solve one. An AI planner reads in PDDL and uses it in order to decompose and solve the problem.

As AI Planners have evolved alongside the languages they use, different planners have different levels of support for different syntaxes. Older planners do not support more expressive syntaxes such as PDDL3.0 or PDDL+. In some cases, however, older styles of syntax have been deprecated and as such some newer planners may not support certain variants of syntax. 

This means that in some cases a newer planner may not be capable of running an older problem and an older planner may not be capable of running a newer problem. In an attempt to combat this problem, as this guide evolves we'll attempt to include notes about what functionality a broad range of planners support.

There are however a really wide array of planners and some are objectively better or worse than others either unilaterally or in solving specific instances. This guide again will focus primarily on the best general purpose planners, in order to complement the focus on general purpose syntax.

## List of Planners
- [OPTIC](../reference/planners/OPTIC/main.md)
- [POPF](../reference/planners/POPF/main.md)
- [ENHSP](../reference/planners/ENHSP/main.md)
- [Dino](../reference/planners/DiNo/main.md)
- [SMTPlan+](../reference/planners/SMTPlan/main.md)
- [MetricFF](../reference/planners/MetricFF/main.md)
- [COLIN](../reference/planners/COLIN/main.md)
- LPRPG-P
- UPMurphi

## Using AI Planners

Almost all AI planners are built with linux based compilation in mind. Some planners have been successfully ported to Windows and Mac and in some cases, the way in which their source code is written makes them easy to port (such as the Java based planner JavaFF). Planners aren't often distributed in binary form and so often have to be compiled. This guide does not provide approaches for compiling planners. Any guidance on how to compile a planner is provided as guidance only and the planner's creator should be contacted directly if help is needed with compilation.

Once you have a compiled binary for a planner, most planners are designed to be run on the command line. Most planners follow one of two syntaxes for inputting a domain and problem file

`./<planner> <domain> <problem>`

`./<planner> -o <domain> -f <problem>`

The variance largely comes from the fact that the domain file at one point was considered to contain "operators" and the problem file contains "facts" hence the use of command line arguments "o" and "f".

As research tools, planners don't tend to just pass out a plan onto the output, but rather provide feedback on the problem decomposition and search process it's conducting. Eviscerator, the planner testing tool, uses a regex argument to automatically detect the plans in the output of the planner. This allows it to handle different planners which use different outputs. 

## Planner Support

For the benefit of users, this guide has - where possible - provided support tables for planners. These support tables allow you to identify what features a planner does and does not support and make decisions about what planner to apply to the problem you're writing.