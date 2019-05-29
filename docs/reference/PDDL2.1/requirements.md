---
layout: page
title: PDDL 2.1 Requirements
parent: PDDL 2.1
grand_parent: Reference
permalink: /ref/pddl21/req
---
# Requirements (PDDL 2.1)
## Numeric Fluents

Support: High
{: .label .label-green }  
Usage: High
{: .label .label-green }

```cl
    (:requirements :numeric-fluents)
```

Allows the inclusion of a `:function` block which represent numeric variables in the domain. e.g.

```cl
(:functions
    (battery-amount ?r - rover)
)
```

Note that this overrides the definition in PDDL1.2 in most planners.

## Durative Actions

Support: High
{: .label .label-green }  
Usage: High
{: .label .label-green }

```cl
    (:requirements :durative-actions)
```

Allows the use of `durative-action` in the domain definition. Durative actions are actions which have a duration they take to complete.

```cl
(:durative-action move
    :parameters (<arguments>)
    :duration (= ?duration 5)
    :condition (logical_expression)
    :effect (logical_expression)
)
```

Note that this does **not** imply `:fluents`

## Durative Inequalities

Support: High
{: .label .label-green }  
Usage: High
{: .label .label-green }

```cl
    (:requirements :durative-inequalities)
```

Allows the use of inequalities to express a duration. Rather than expressing that an action has a fixed length of time we can express that an action has a duration range using an inequality.

## Continuous Effects

Support: Medium
{: .label .label-yellow }  
Usage: High
{: .label .label-green }

```cl
    (:requirements :continuous-effects)
```

Allows the use of continuous effects on numerics within durative actions. Because durative actions take a period of time, we could model the change in a numeric value as some function of time. In reality support for this shaky. Linear functions are relatively easy for planners but non-linear effects are still an area of research.

## Negative Preconditions

Support: Low
{: .label .label-red }  
Usage: High
{: .label .label-green }

```cl
    (:requirements :negative-preconditions)
```

Allows the use of `not` in preconditions. The way some planners model actions mean they are not capable of handling negative preconditions. This is more an inconvenience that a serious design flaw as for every predicate their is an opposing predicate which is true when it's false. I.e.

`rover-charged` and `rover-not-charged` are mutually exclusive. In the event where negative preconditions are not support we can introduce a second predicate which represents the negation of the predicate we want to express a negative precondition on.

## References

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)