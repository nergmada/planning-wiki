# Requirements (PDDL 2.2)

The following page offers details of requirements defined in PDDL 2.2.

## Derived Predicates

Support: <span style="color:orange">Medium</span>
Usage: <span style="color:orange">Low</span>

`(:requirements :derived-predicates)`

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

Support: <span style="color:orange">Medium</span>
Usage: <span style="color:yellow">Medium</span>

`(:requirements :timed-initial-literals)`

Allows the use of Timed Initial Literals when defining problems. e.g.

`(at 10 (train-not-in-use t1))`