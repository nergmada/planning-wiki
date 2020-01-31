---
layout: default
title: Fast Downward
parent: Planners
permalink: /ref/planners/fd
nav_order: 34
---
# The Fast Downward Planning System

Page Contributors: {% git_author %}

{% planner_tag IPC2004 IPC2006 IPC2008 IPC2011 IPC2014 IPC2018 Optimising Satisfycing %}

Paper: {% paper_link The Fast Downward System planners/fd 1 %} [ Helmert, M. ]

Fast Downward is the name for a number different planners built on top of the Fast Downward planning system, this page will serve to aggregate all of them.

## Fast Downward

Year Published: 2004

Fast Downward is a classical planning system based on heuristic search. It can deal with general deterministic planning problems encoded in the propositional fragment of PDDL2.2, including advanced features like ADL conditions and effects and derived predicates (axioms). Like other well-known planners such as HSP and FF, Fast Downward is a progression planner, searching the space of world states of a planning task in the forward direction. However, unlike other PDDL planning systems, Fast Downward does not use the propositional PDDL representation of a planning task directly. Instead, the input is first translated into an alternative representation called multivalued planning tasks, which makes many of the implicit constraints of a propositional planning task explicit. Exploiting this alternative representation, Fast Downward uses hierarchical decompositions of planning tasks for computing its heuristic function, called the causal graph heuristic, which is very different from traditional HSP-like heuristics based on ignoring negative interactions of operators.

## Fast Diagonally Downward

Year Published: 2004

The configuration Fast Diagonally Downward employed multi-heuristic best-first search using helpful transitions and helpful actions as preferred operators

## Fast Downward Autotune

Year Published: 2011

Paper: {% paper_link FD-Autotune: Domain-Specific Configuration using Fast Downward planners/fdautotune 1 %} [ Fawcett, C. Helmert, M. Hoos, H. Karpas, E. Roger, G. Seipp, J. ]

FD Autotune is a learning planning system, based on the idea of domain-specific configuration of the parameters of Fast Downward, by means of a generic automated algorithm configuration procedure.

## Fast Downward Stone Soup

Year Published: 2011

Paper: {% paper_link Fast Downward Stone Soup: A Baseline for Building Planner Portfolios planners/fdstonesoup 1 %} [ Helmert, M. Roger, G. Karpas, E. ]

Fast Downward Stone Soup is a sequential portfolio planner that uses various heuristics and search algorithms that have been implemented in the Fast Downward planning system. Fast Downward Stone Soup shows a proof of concept of how to mix planners to create portfolios

## Fast Downward Cedalion

Year Published: 2014

Paper: {% paper_link Fast Downward Cedalion planners/fdcedalion 1 %} [ Seipp, J. Sievers, S. Hutter, F. ]

Cedalion is an algorithm on top of FD's Portfolio system to automatically configure the parameters of sequential portfolio planners.

## Fast Downward Uniform

Year Published: 2014

Paper: {% paper_link Fast Downward Uniform Portfolio planners/fduniform 1 %} [ Seipp, J. Braun, M. Garimort, J. ]

The Fast Downward uniform portfolio runs 21 automatically configured Fast Downward instantiations sequentially for the same amount of time. 

## Fast Downward Merge & Shrink

Year Published: 2018

Paper: {% paper_link Fast Downward Merge-and-Shrink planners/fdmergeandshrink 1 %} [ Sievers, S. ]

Fast Downward Merge-and-Shrink uses the optimized, efficient implementation of the merge-and-shrink framework available in the Fast Downward planning system

## Fast Downward Remix

Year Published: 2018

Paper: {% Fast Downward Remix planners/fdremix 1 %} [ Seipp, J. ]

FD Remix is an offline portfolio planner than pre-calculates the configuration of the portfolio in a preprocessing phase.

## Support

This table has been calculated manually based on the main page on [PDDL Support](http://www.fast-downward.org/PddlSupport) of Fast Downward's Website

|Requirement | Supported?|
| --- | --- |
|**PDDL1.2** |
|:strips | Yes |
|:typing | Yes |
|:disjunctive-preconditions | Yes |
|:equality | Yes |
|:existential-preconditions | Yes |
|:universal-preconditions | Limited* |
|:conditional-effects | Yes |
|:domain-axioms | No |
|:subgoals-through-axioms | No |
|:safety-constraints | No |
|:open-world | No |
|:quantified-preconditions | Limited* |
|:adl | Yes* |
|:ucpop | No |
|**PDDL2.1** |
|:numeric-fluents | No |
|:durative-actions | No |
|:duration-inequalities | No |
|:continuous-effects | No |
|:negative-preconditions | Yes |
|**PDDL2.2** |
|:derived-predicates | Yes |
|:timed-initial-literals | No |
|**PDDL3.0** |
|:constraints | No |
|:preferences | No |
|**PDDL3.1** |
|:action-costs | Yes |
|:goal-utilities | No |
|**PDDL+** |
|:time | No |

## Downloading and Compiling Fast Downward (Main)

For more information on how to download, compile and use Fast Downward, visit their [compilation page here](http://www.fast-downward.org/ObtainingAndRunningFastDownward). 

## Additional Notes

Fast Downward forms the base planner of nearly 70% of modern planning systems, and very few of them modify the parsing stage of the problem, therefore the support table listed above is a good (but not perfect) indicator of what features are supported in many planners