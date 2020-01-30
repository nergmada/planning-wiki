---
layout: default
title: PDDL 2.2 Problem
parent: PDDL 2.2
grand_parent: Reference
permalink: /ref/pddl22/problem
---
# Problem
{: .no_toc }

Contributors: {% git_author %}

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
