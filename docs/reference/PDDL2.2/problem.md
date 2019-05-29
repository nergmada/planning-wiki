---
layout: page
title: PDDL 2.2 Problem
parent: PDDL 2.2
grand_parent: Reference
permalink: /ref/pddl22/problem
---
# Problem
{: .no_toc }
The problem syntax in PDDL 2.2 is expanded very lightly in order to support Timed Initial Literals. The choice of keyword is an interesting one because `at` is a commonly used predicate name used to indicate that some locatable is in some location i.e. `(at Adam Bush-House)`.

The way in which this keyword is used to define timed initial literals means however that it *should not* conflict with domains that make use of `at` as a predicate name. However, this is entirely dependent on how the planner parses a plan.

```cl
(define
    (problem trainplanning1)
    (:domain railways)
    (:objects
        Pompey Guildford London - station
        train1 train2 - train
    )
    (:init
        (train-not-in-use train1)
        (at 20 (train-not-in-use train2))
    )

    ... goal omitted
)
```

## Contents
{: .no_toc .text-delta }

- TOC
{:toc }

## Timed Initial Literals

[back to contents](#contents)

Support: Medium
{: .label .label-yellow }
Usage: Medium
{: .label .label-yellow }

```cl
    (at <time_value> <predicate>)
```

A timed initial literal is defined using the time keyword, followed by the value for the point in time which the predicate becomes true, followed by the predicate itself.

In planning, time is treated as just a number, and no assumptions are made about the scale it represents, therefore writing something such as `at 10` could express 10 seconds, minutes or indeed hours.

Ultimately it is the responsibility of the modelling user to determine what scale they wish to map their model to, and therefore the "resolution" they get for the accuracy of time.

```cl
    (at 20 (train-not-in-use train2))
```

The statement above expresses that at some time 20, the train `train2` will no longer be in use.

## References

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)