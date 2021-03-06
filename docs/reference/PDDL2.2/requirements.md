---
layout: default
title: PDDL 2.2 Requirements
parent: PDDL 2.2
grand_parent: Reference
permalink: /ref/pddl22/requirements
---
# Requirements (PDDL 2.2)

Contributors: {% git_author %}

The following page offers details of requirements defined in PDDL 2.2.

## Derived Predicates

Support: Medium
{: .label .label-yellow }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :derived-predicates)
```

Allows the usage of derived predicates in domains. e.g.

```cl
(:derived (train-usable ?t - train)
    (and
        (train-has-guard ?t)
        (train-has-driver ?t)
    )
)
```

## Timed Initial Literals

Support: Medium
{: .label .label-yellow }
Usage: Medium
{: .label .label-yellow }

```cl
    (:requirements :timed-initial-literals)
```

Allows the use of Timed Initial Literals when defining problems. e.g.

```cl
    (at 10 (train-not-in-use t1))
```