# Domain
[return to homepage](../../readme.md) | [return to PDDL2.2 main page](./main.md)

The domain syntax for PDDL2.2 adds very minimal changes to the domain. As with any update to PDDL it introduces new requirements, however, other than that the only new syntax is Derived Predicates, which are defined in a similar way to how actions are defined, and are defined in the same section of the domain file.

```
(define
    (domain railways)
    (:requirements :derived-predicates :timed-initial-literals)
    (:types 
        train station - object
    )
    (:predicates
        (train-not-in-use ?t - train)
        (train-has-guard ?t - train)
        (train-has-driver ?t - train)
        (train-usable ?t - train)
    )
    (:functions
        ... - omitted
    )
    (:durative-action MOVE-TRAIN
        ... - omitted
    )
    (:derived (train-usable ?t - train)
        (and
            (train-has-guard ?t)
            (train-has-driver ?t)
        )
    )
    (:derived
        ... - omitted
    )
)
```

## Contents
- Requirements
- Derived Predicates

## Requirements
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements <requirement_name>)`

Requirements are similar to import/include statements in programming languages, however as PDDL is a kind of declarative language, it is a `:requirement` as a given planner is "required" to facilitate some aspect of the language.

Multiple `:requirements` can be specified through a space separated list e.g.

`(:requirements :strips :adl :typing)`

### List of Requirements
This is a list of requirements that were added by PDDL2.2 to the language of PDDL.

- [:derived-predicates](./Domain/requirements.md#derived-predicates)
- [:timed-initial-literals](./Domain/requirements.md#timed-initial-literals)

## Derived Predicates
[back to contents](#contents)

Support: <span style="color:orange">Medium</span>  
Usage: <span style="color:orange">Low</span>

`(:derived <predicate_name> <logical_expression>)`

A derived predicate is declared by naming the predicate who's result is being derived, and a logical expression which is evaluated to work out the value. 

Note, that a derived predicate is declared similarly to actions, in that we use the `:derived` keyword for each declaration of a derived predicate.

```
(:derived (train-usable ?t - train)
    (and
        (train-has-guard ?t)
        (train-has-driver ?t)
    )
)
```

The example above specifies that a train is only usable if it has a train and a driver. 

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)