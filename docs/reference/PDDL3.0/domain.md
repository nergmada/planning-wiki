---
title: PDDL 3 Domain
parent: PDDL 3
grand_parent: Reference
permalink: /ref/pddl3/domain
---
# Domain
{: .no_toc }

Contributors: {% git_author %}

As with all previous installations of PDDL, PDDL 3.0 introduces new requirements. It also introducing syntax for defining constraints. Constraints are form of goal which must be satisfied in all states of the plan.

As an additional curiosity note, whilst it may seem that a constraint adds more complexity to a state space, in general it allows us to reduce it significantly, by increasing the number of invalid states.

```cl
(define
    (domain logistics)
    (:requirements :preferences :constraints)
    (:types
        lorry package recipient location - object
    )
    (:predicates
        (deliver-to ?r - recipient ?p - package)
        (delivered ?p - package)
        (in ?p - package ?l - lorry)
        (at ?l - lorry ?loc - location)
    )
    (:constraints
        (and
            (forall (?l - lorry ?loc - location) (at-most-once (at ?l ?loc)))
            ... additional constraints omitted
        )
    )
    ; Actions omitted
)
```

## Contents
{: .no_toc .text-delta }

- TOC
{:toc}

## Requirements
[back to contents](#contents)

Support: Universal
{: .label .label-blue }
Usage: High
{: .label .label-green }

```cl
    (:requirements <requirement_name>)
```

Requirements are similar to import/include statements in programming languages, however as PDDL is a kind of declarative language, it is a `:requirement` as a given planner is "required" to facilitate some aspect of the language.

Multiple `:requirements` can be specified through a space separated list e.g.

```cl
    (:requirements :strips :adl :typing)
```

### List of Requirements
{: .no_toc }
This is a list of requirements that were added by PDDL3.0 to the language of PDDL.

- [:preferences](./requirements#preferences)
- [:constraints](./requirements#constraints)

## Constraints

[back to contents](#contents)

Support: Medium
{: .label .label-yellow }
Usage: Low
{: .label .label-red }

```cl
(:constraints
    <logical_expression>
)
```

Constraints are a conjunction of various `forall`/`exists` statements, which can make use of the keywords designed to facilitate preferences. Constraints are essentially facts which must be true in all states within a valid plan.

Essentially a constraint expresses something we want to always be true, or some state-trajectory constraint (A constraint on how the state changes over time) . e.g.

```cl
(:constraints
    (and
        (forall (?l - lorry ?loc - location) (at-most-once (at ?l ?loc)))
        ... additional constraints omitted
    )
)
```

The single constraint shown above expresses that for each lorry and location, the lorry should visit that location at most once.

These kind of expressions can help planners reduce the number of states they need to explore by enforcing common sense logic.

Now it may seem logical that if packages can be delivered in any particular order and there could potentially be more than one package to be delivered to a single location, that we would want to express that we only visit any given location exactly once with a given lorry (thus preventing us going to the same place twice).

Users of this feature should be cautious of not ruling out non-apparent solutions. If for example we were planning a lorry based on fuel cost, it may be appropriate for a lorry to visit a location (such as a city) twice, once to deliver a package at the start of the journey, and once at the end to refuel for the journey home at a cheap fuel station.

### always
{: .no_toc }
```cl
    always <predicate>
```

The `always` state-trajectory constraint expresses that every state reached in the execution of the plan, contains the predicate specified.

It essentially creates a constant predicate. In the case below we say that `package1` is in `lorry1` for all states reached by the plan.

```cl
    always (in package1 lorry1)
```

### sometime
{: .no_toc }
```cl
    sometime <predicate>
```

The `sometime` state trajectory constraint expresses at some point within the states reached by a plan, that the predicate specified is true.

It essentially says, at some point, this fact is true. In the case below we're saying that at some point, `lorry1` should be in `glasgow`

```cl 
    sometime (at lorry1 glasgow)
```

### within
{: .no_toc }
```cl
    within <number> <predicate>
```

The `within` state-trajectory constraint express that some predicate must become true within the specified number of plan steps.

This is a rather unusual constraint because it varies between temporal and STRIPS domain. The number in the statement expresses the point in time in temporal plans. The number in the statement expresses the number of plan steps in STRIPS plans.

```cl
    within 10 (at lorry1 collectionpoint)
```

### at-most-once
{: .no_toc }
```cl 
    at-most-once <predicate>
```

The `at-most-once` state-trajectory constraint expresses that a fact be true at most once. It is useful to prevent repeated visits to the same fact. e.g.

```cl
    at-most-once (at lorry1 theendoftheworld)
```

### sometime-after
{: .no_toc }
```cl
    sometime-after <before_predicate> <after_predicate>
```

The `sometime-after` state-trajectory constraint expresses that some predicate becomes true, at some point after a separate predicate becomes true.

```cl
    sometime-after (at lorry1 london) (at lorry1 pompey)
```

The above statement expresses that once `lorry1` has been in london some point afterwards in should be in `pompey`.

### sometime-before
{: .no_toc }
```cl
    sometime-before <after_predicate> <before_predicate>
```

The `sometime-before` state-trajectory constraint expresses that some predicate should become true, before a separate predicate becomes true. e.g.

```cl
    sometime-before (delivering lorry1) (at lorry1 warehouse)
```

The above statement expresses that before `lorry1` is marked as delivering it should have been `at` the `warehouse` (i.e. to pickup goods).

### always-within
{: .no_toc }
```cl
    always-within <number> <condition> <predicate>
```

The always within expresses a composition of `always` and `within`, essentially it says that whenever some condition/predicate is true, then within the specified number of steps/time, the other predicate should become true.

### hold-during
{: .no_toc }
```cl
    hold-during <number> <number> <predicate>
```

The `holding-during` state-trajectory constraint expresses that a predicate should hold true between the two points in time expressed. Essentially, action as an `always` with a fixed start and end point.

```cl
    hold-during 20 30 (at lorry1 lorrycarpark)
```

The statement above expresses that `lorry1` should be parked between the points in time `20` and `30`. If we imagine that time in our problem represents hours, then `20` would be 8PM on the first day, and `30` would be 6AM on the next day.

### hold-after
{: .no_toc }
```cl
    hold-after <number> <predicate>
```

The `hold-after` state-trajectory constraint expresses that a predicate should hold true after some point in time.

Note that this predicate must remain true, forever after the give point. This makes it assymetric to `within` which only expresses a fact must become true before some point at least once.

```cl
    hold-after 40 (empty lorry1)
```

The above statement indicates that `lorry1` should be `empty` after `40` and remain empty.

## Reference

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [Plan Constraints and Preferences in PDDL 3](http://www.cs.yale.edu/homes/dvm/papers/pddl-ipc5.pdf) [Gerevini, A. Long, D.]
- [BNF Description of PDDL 3.0](http://cs-www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf) [Gerevini, A. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)