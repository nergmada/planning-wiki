---
layout: page
title: PDDL 3 Requirements
parent: PDDL 3
grand_parent: Reference
permalink: /ref/pddl3/requirements
---
# Requirements (PDDL 3.0)

Contributors: {% git_author %}

The following page offers details of requirements defined in PDDL 3.0.

## Preferences

Support: Medium
{: .label .label-yellow }
Usage: Medium
{: .label .label-yellow }

```cl
    (:requirements :preferences)
```

Allows for the usage of preferences within problem definitions (soft goals).

## Constraints

Support: Medium
{: .label .label-yellow }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :constraints)
```

Allows for the use of constraints within domain definitions (goals which must be satisfied in every state). e.g.

```cl
(:constraints
    (and
        (forall (?l - lorry ?loc - location) (at-most-once (at ?l ?loc)))
    )
)
```