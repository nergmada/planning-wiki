# Requirements (PDDL 3.0)
The following page offers details of requirements defined in PDDL 3.0.

## Preferences
Support: <span style="color:orange">Medium</span>  
Usage: <span style="color:yellow">Medium</span>

`(:requirements :preferences)`

Allows for the usage of preferences within problem definitions (soft goals).

## Constraints
Support: <span style="color:orange">Medium</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :constraints)`

Allows for the use of constraints within domain definitions (goals which must be satisfied in every state). e.g.

```
(:constraints
    (and
        (forall (?l - lorry ?loc - location) (at-most-once (at ?l ?loc)))
    )
)
```