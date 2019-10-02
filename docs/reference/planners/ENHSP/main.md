---
layout: default
title: ENHSP
parent: Planners
permalink: /ref/planners/enhsp
nav_order: 5
---
# ENHSP: Expressive Numeric Heuristic Search Planner

Page Contributors: {% git_author %}

Year Published: 2016

Paper: [Interval-Based Relaxation for General Numeric Planning](https://pdfs.semanticscholar.org/ba88/832bb0d1feddd7032282f3a2837f93a7117e.pdf) [Scala, E. Haslum, P. Thiebaux, S. Ramirez, M.]

ENHSP, which stands for Expressive Numeric Heuristic Planner is a forward heuristic search planner. It supports the following 

1. Classical Planning
2. Numeric Planning with linear and non-linear expressions
3. Planning with discretised autonomous processes and events
4. Global constraints, which are the analogous of always constraints of PDDL
5. discrete events
6. universal and existential quantification in formulas (action precondition, constraints and goals)
7. negative preconditions
8. novel heuristics based on landmarks and search techniques for planning with autonomous processes

## Support
ENHSP requires `:typing` in all domains it runs on, which makes it incompatible with [Eviscerator](https://www.github.com/nergmada/eviscerator). No support table has been generated. 

## Downloading and Compiling ENHSP
For more information on how to download, compile and use ENHSP, visit its [GitLab page here](https://gitlab.com/enricos83/ENHSP-Public). 

## Additional Notes
ENHSP has support for non-linear continuous effects assuming they are monotonic.