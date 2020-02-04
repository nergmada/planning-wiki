---
layout: default
title: Fast Forward
parent: Planners
permalink: /ref/planners/ff
nav_order: 34.5
---
# FF: The Fast Forward Planning System

Page Contributors: {% git_author %}

{% planner_tag IPC2000 Satisfycing %}

Paper: {% paper_link The Fast-Forward Planning System planners/ff 1 %} [ Hoffmann, J. ]

Preceded By: HSP

Fast Forward is a family of planners, built predominantly on the FF System. FF's novel heuristic, which is based on that of HSP's delete free relaxation, forms the underlying heuristic of many other planners. FF is a forward chaining heuristic state space planner. The main heuristic principle was originally developed by Blai Bonet and Hector Geffner for the HSP [Link Needed] system: to obtain a heuristic estimate, relax the task P at hand into a simpler task P+ by ignoring the delete lists of all operators. While HSP employs a technique that gives a rough estimate for the solution length of P+ , FF extracts an explicit solution to P+.

## MetricFF
MetricFF is an extension to FF to support reasoning with Numerics. 

## JavaFF
JavaFF is a redevelopment of the MetricFF system, with support for temporal planning problems, (through Crikey's [Link Needed] STN approach). The primary purpose of JavaFF was the teaching of applied planning in undergraduate AI Planning courses.

## Support in FF, MetricFF and JavaFF
FF was developed for the classical planning problema  in IPC 2000. It will not support temporal or numeric problems. MetricFF was extended for the purpose of supporting numerics only, and therefore likely does not support temporal domains. Finally JavaFF was developed for temporal-numeric planning problems, although due to the limit factor of the language it was built in, may have trouble supporting large scale domains.

## Building and compiling the FF Planners
FF and MetricFF source code can both be located on the [FF Homepage](https://fai.cs.uni-saarland.de/hoffmann/ff.html)

JavaFF can be located on a number of [github repos](https://github.com/dpattiso/javaff) or directly from [KCL planning](https://nms.kcl.ac.uk/planning/software/javaff.html) 