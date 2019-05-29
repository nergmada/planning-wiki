---
layout: page
title: PDDL 3 Problem
parent: PDDL 3
grand_parent: Reference
permalink: /ref/pddl3/problem
---
# Problem
{: .no_toc }
New syntax is added to PDDL problems in PDDL3. This syntax allows us to express preferences as part of the `:goal` section of a problem file.

```cl
(define
    (problem logistics1)
    (:domain logistics)
    (:objects
        lorry1 lorry2 lorry3 - lorry
        p1 p2 p3 p4 - package
        r1 r2 r3 - recipient
        london portsmouth glasgow - location
    )
    (:init
        ... omitted
    )
    (:goal
        (preference visitLDNthenGLS
            (sometime-after (at lorry1 london) (at lorry1 glasgow))
        )
    )
    (:metric (minimize (is-violated visitLDNthenGLS)))
)
```

## Contents
{: .no_toc .text-delta }

- TOC
{:toc}

## Preferences

[back to contents](#contents)

Support: Medium
{: .label .label-yellow }
Usage: Medium
{: .label .label-yellow }

```cl
    preference <name> <goal>
```

A preference is a soft goal, which often uses a state-trajectory constraint to express its goal. A preference/soft goal is a goal which does not need to be met in order for a plan to be valid but may incur a cost if the preference is not met.

The syntax of a preference is defined such that it can be used as part of a conjunctive goal definition, meaning we can define preferences and goals together. An example preference below shows that `lorry1` would ideally visit `london` before it visits `glasgow`

```cl
(preference visitLDNthenGLS
    (sometime-after (at lorry1 london) (at lorry1 glasgow))
)
```

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

```cl
    sometime-after <before_predicate> <after_predicate>
```

The `sometime-after` state-trajectory constraint expresses that some predicate becomes true, at some point after a separate predicate becomes true.

```cl
    sometime-after (at lorry1 london) (at lorry1 pompey)
```

The above statement expresses that once `lorry1` has been in london some point afterwards in should be in `pompey`.

### sometime-before

```cl
    sometime-before <after_predicate> <before_predicate>
```

The `sometime-before` state-trajectory constraint expresses that some predicate should become true, before a separate predicate becomes true. e.g.

```cl
    sometime-before (delivering lorry1) (at lorry1 warehouse)
```

The above statement expresses that before `lorry1` is marked as delivering it should have been `at` the `warehouse` (i.e. to pickup goods).

### always-within

```cl
    always-within <number> <condition> <predicate>
```

The always within expresses a composition of `always` and `within`, essentially it says that whenever some condition/predicate is true, then within the specified number of steps/time, the other predicate should become true.

### hold-during

```cl
    hold-during <number> <number> <predicate>
```

The `holding-during` state-trajectory constraint expresses that a predicate should hold true between the two points in time expressed. Essentially, action as an `always` with a fixed start and end point.

```cl
    hold-during 20 30 (at lorry1 lorrycarpark)
```

The statement above expresses that `lorry1` should be parked between the points in time `20` and `30`. If we imagine that time in our problem represents hours, then `20` would be 8PM on the first day, and `30` would be 6AM on the next day.

### hold-after

```cl
    hold-after <number> <predicate>
```

The `hold-after` state-trajectory constraint expresses that a predicate should hold true after some point in time.

Note that this predicate must remain true, forever after the give point. This makes it assymetric to `within` which only expresses a fact must become true before some point at least once.

```cl
    hold-after 40 (empty lorry1)
```

The above statement indicates that `lorry1` should be `empty` after `40` and remain empty.

## Metric

For a full definition of the metric block in PDDl, please see [PDDL 2.1](../pddl21/problem#metric)

The metric is a numeric function which must either be minimized or maximised. PDDL3 extends on the definition in PDDL2.1 to include a helper function `is-violated <name>` which when given the name of a preference, gives a count of the number of times that constraint has been violated.

In some cases, users may wish to weight certain preferences as being more costly than others, using a `*` operator, we can multiply the number of violations by a violation cost, to give us a total cost for violating that preference.

e.g. Imagine we have two preferences, `visitLDNthenGLS` and `lorryEndsAtDepot` we can define a metric something like this

```cl
(:metric
    (+
        (* (is-violated visitLDNthenGLS) 10)
        (* (is-violated lorryEndsAtDepot) 5)
    )
)
```

The metric above essentially costs more not to visit `london` before `glasgow` than for the `lorry` to end at the depot.

Usage notes: a preference can be violated once, or multiple times depending on how it's defined. This is not covered in this reference, for more details see section 3.1 of [Plan Constraints and Preferences in PDDL 3](http://www.cs.yale.edu/homes/dvm/papers/pddl-ipc5.pdf) [Gerevini, A. Long, D.]

## Reference

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [Plan Constraints and Preferences in PDDL 3](http://www.cs.yale.edu/homes/dvm/papers/pddl-ipc5.pdf) [Gerevini, A. Long, D.]
- [BNF Description of PDDL 3.0](http://cs-www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf) [Gerevini, A. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)