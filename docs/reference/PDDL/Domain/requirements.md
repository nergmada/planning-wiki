# Requirements (PDDL 1.2)
[Return to Homepage](../../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

The following page offers details of requirements defined in PDDL 1.2.

## STRIPS
Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements :strips)`

Allows the usage of basic add and delete effects as specified in STRIPS. e.g.

Add:

`:effect (walls-built ?s)`

Delete:

`:effect (not (walls-built ?s))`

## Typing
Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements :typing)`

Allows the usage of typing for objects. Typing is similar to classes and sub-classes in Object-Oriented Programming e.g.

```
(:types 
    site material - object
    bricks cables windows - material
)
```

## Disjunctive Preconditions
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :disjunctive-preconditions)`

Allows the usage of `or` in goals and preconditions e.g.

```
(or 
    (walls-built ?s) 
    (windows-fitted ?s)
)
```

## Equality
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :equality)`

Allows the usage of `=` to compare objects. For example if we have two objects as arguments `?s1` and `?s2` we can compare them to see if they're the same. e.g.

`(not (= ?s1 ?s2))`

## Existential Preconditions
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :existential-preconditions)`

Allows for the use of `exists` in goals and preconditions. Exists is essentially an additional parameter which we don't need apart from a subset of the conditions for example.

```
(exists (?c - crane)
    (crane-is-free ?c)
)
```
Typically, exists is not used in favour of just adding an additional argument to the action parameters.

## Universal Preconditions
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :universal-preconditions)`

Allows for the use of `forall` in goals and preconditions. Universal is essentially the counter-part to the `exists` statement, providing for a condition that is true across all objects of a type, or just all objects.

```
(forall (?c - crane)
    (crane-is-free ?c)
)
```

Conditions that all the cranes in the problem are free.

## Quantified Preconditions
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :quantified-preconditions)`

Short hand way of expressing both universal and existential preconditions. It is equivalent to

`(:requirements :existential-preconditions :universal-preconditions)`

## Conditional Effects
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :conditional-effects)`

Allows for the usage of `when` in expressing action effects. Essentially saying if something is true, then apply this effect too.

```
(when
    ;Antecedent 
    (and (has-hot-chocolate ?p ?c) (has-marshmallows ?c))
    ;Consequence
    (and (person-is-happy ?p))
)
```

Here we express that when a person has a hot chocolate with marshmallows in, there is additional effect that the person is happy, which might not otherwise be true had we given them a different beverage or indeed a hot chocolate without marshmallows.

## Action Expansions
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :action-expansions)`

Allows for usage of action expansions. This allows for the definition of variant condition and effects of actions. Essentially, we could define a `MOVE` action to describe movement of say a person, but include different expansions to describe movement by plane, train, car or foot. 

This has be rendered redundant as we would instead just express multiple actions such as `MOVE-BY-PLANE` and `MOVE-BY-TRAIN`.

## Foreach Expansions
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :foreach-expansions)`

Allows for usage of `foreach` in action expansions, essentially allowing the application of effects across a type of object or across all objects.

This requirement implies the existence of the `:action-expansions` requirement and therefore is equivalent to 

`(:requirements :action-expansions :foreach-expansions)`

## DAG Expansions
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :dag-expansions)`

Allows the expansions described in Action Expansions to labelled so that you can distinguish between which sub-action was chosen by the planner. For example if we defined a `move` action which makes use of different modes of transport we might want to know exactly what mode was used by labelling.

This requirement implies the existence of the `:action-expansions` requirement and therefore is equivalent to 

`(:requirements :action-expansions :dag-expansions)`

## Domain Axioms
Support: <span style="color:yellow">Medium</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :domain-axioms)`

Allows the use of axioms. Axioms are essentially predicates that are implied by other predicates. See the section on Axioms in the domain reference for PDDL 1.2

## Subgoals Through Axioms
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :subgoals-through-axioms)`

Subgoals through axioms is a way of creating subgoals by showing that an axiom is a subset of the goal. This has become fairly redundant as this is something a planner could extract through domain preprocessing. 

A user should not have to tell a planner the techniques it should use to solve a problem and so subgoals through axioms runs counter to that in some way.

## Safety Constraints
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :safety-constraints)`

A safety constraint is a predicate which must be true by the end of the plan in order for the plan to be considered valid. How this varies from a goal state is not really clear.

## Expression Evaluation
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :expression-evaluation)`

Allows the usage of `eval` in axioms, in which two predicates are compared to one another and if they are equivalent `eval` returns true. e.g.

`(eval (im-not-true ?a) (im-true ?b))`

Evaluates to false, if we assume that `im-not-true` is false and `im-true` is true.

This requirement implies the existence of the `:domain-axioms` requirement and therefore is equivalent to 

`(:requirements :domain-axioms :expression-evaluation)`

## Fluents
Support: <span style="color:pink">Meaning Has Changed</span>  
Usage: <span style="color:red">Rare (in this context)</span>

`(:requirements :fluents)`

Allows the usage of `(fluents t)`, fluent support in PDDL1.2 is different to how later versions of PDDL model numeric values. 

This requirement implies the existence of the `:expression-evaluation` requirement and therefore is equivalent to 

`(:requirements :expression-evaluation :fluents)`

## Open World
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :open-world)`

In planning all unknown values are assumed to be false. That is to say that if we do not know the value of a predicate, then we assume it to be false. This is known as the "closed world" assumption. This requirement mutates the planner to make an "open world" assumption. That is that values which are not known are not necessarily false.

This is rarely supported in more modern planners and often is a flag in the planner execution and not a requirement in the domain.

## True Negation
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :true-negation)`

Don't treat negation as failure, treat it how it is in first order logic. 

This requirement implies the existence of the `:open-world` requirement and therefore is equivalent to 

`(:requirements :open-world :true-negation)`

## ADL
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:requirements :adl)`

ADL is a super requirement which adds the following requirements

- `:strips`
- `:typing`
- `:disjunctive-preconditions`
- `:equality`
- `:quantified-preconditions`
- `:condition-effects`

## UCPOP
Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:requirements :ucpop)`

UCPOP is a super requirement which adds the following requirements

- `:adl` (see above)
- `:domain-axioms`
- `:safety-constraints`

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)