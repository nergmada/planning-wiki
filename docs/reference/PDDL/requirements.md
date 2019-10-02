---
layout: default
title: PDDL Requirements
parent: PDDL
grand_parent: Reference
permalink: /ref/pddl/requirements
---
# Requirements (PDDL 1.2)
{: .no_toc }

Contributors: {% git_author %}

The following page offers details of requirements defined in PDDL 1.2.

## Contents
{: .no_toc .text-delta }

- TOC
{:toc }

## STRIPS

Support: Universal
{: .label .label-blue }
Usage: High
{: .label .label-green }

```cl
    (:requirements :strips)
```

Allows the usage of basic add and delete effects as specified in STRIPS. e.g.

Add:

```cl
    :effect (walls-built ?s)
```

Delete:

```cl
    :effect (not (walls-built ?s))
```

## Typing

Support: Universal
{: .label .label-blue }
Usage: High
{: .label .label-green }

```cl
    (:requirements :typing)
```

Allows the usage of typing for objects. Typing is similar to classes and sub-classes in Object-Oriented Programming e.g.

```cl
(:types
    site material - object
    bricks cables windows - material
)
```

## Disjunctive Preconditions

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :disjunctive-preconditions)
```

Allows the usage of `or` in goals and preconditions e.g.

```cl
(or
    (walls-built ?s)
    (windows-fitted ?s)
)
```

## Equality

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :equality)
```

Allows the usage of `=` to compare objects. For example if we have two objects as arguments `?s1` and `?s2` we can compare them to see if they're the same. e.g.

```cl
    (not (= ?s1 ?s2))
```

## Existential Preconditions

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :existential-preconditions)
```

Allows for the use of `exists` in goals and preconditions. Exists is essentially an additional parameter which we don't need apart from a subset of the conditions for example.

```cl
(exists (?c - crane)
    (crane-is-free ?c)
)
```

Typically, exists is not used in favour of just adding an additional argument to the action parameters.

## Universal Preconditions

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :universal-preconditions)
```

Allows for the use of `forall` in goals and preconditions. Universal is essentially the counter-part to the `exists` statement, providing for a condition that is true across all objects of a type, or just all objects.

```cl
(forall (?c - crane)
    (crane-is-free ?c)
)
```

Conditions that all the cranes in the problem are free.

## Quantified Preconditions

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :quantified-preconditions)
```

Short hand way of expressing both universal and existential preconditions. It is equivalent to

```cl
    (:requirements :existential-preconditions :universal-preconditions)
```

## Conditional Effects

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :conditional-effects)
```

Allows for the usage of `when` in expressing action effects. Essentially saying if something is true, then apply this effect too.

```cl
(when
    ;Antecedent
    (and (has-hot-chocolate ?p ?c) (has-marshmallows ?c))
    ;Consequence
    (and (person-is-happy ?p))
)
```

Here we express that when a person has a hot chocolate with marshmallows in, there is additional effect that the person is happy, which might not otherwise be true had we given them a different beverage or indeed a hot chocolate without marshmallows.

## Action Expansions

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :action-expansions)
```

Allows for usage of action expansions. This allows for the definition of variant condition and effects of actions. Essentially, we could define a `MOVE` action to describe movement of say a person, but include different expansions to describe movement by plane, train, car or foot.

This has be rendered redundant as we would instead just express multiple actions such as `MOVE-BY-PLANE` and `MOVE-BY-TRAIN`.

## Foreach Expansions

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :foreach-expansions)
```

Allows for usage of `foreach` in action expansions, essentially allowing the application of effects across a type of object or across all objects.

This requirement implies the existence of the `:action-expansions` requirement and therefore is equivalent to

```cl
    (:requirements :action-expansions :foreach-expansions)
```

## DAG Expansions

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }


```cl
    (:requirements :dag-expansions)
```

Allows the expansions described in Action Expansions to labelled so that you can distinguish between which sub-action was chosen by the planner. For example if we defined a `move` action which makes use of different modes of transport we might want to know exactly what mode was used by labelling.

This requirement implies the existence of the `:action-expansions` requirement and therefore is equivalent to

```cl
    (:requirements :action-expansions :dag-expansions)
```

## Domain Axioms

Support: Medium
{: .label .label-yellow }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :domain-axioms)
```

Allows the use of axioms. Axioms are essentially predicates that are implied by other predicates. See the section on Axioms in the domain reference for PDDL 1.2

## Subgoals Through Axioms

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :subgoals-through-axioms)
```

Subgoals through axioms is a way of creating subgoals by showing that an axiom is a subset of the goal. This has become fairly redundant as this is something a planner could extract through domain preprocessing.

A user should not have to tell a planner the techniques it should use to solve a problem and so subgoals through axioms runs counter to that in some way.

## Safety Constraints

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :safety-constraints)
```

A safety constraint is a predicate which must be true by the end of the plan in order for the plan to be considered valid. How this varies from a goal state is not really clear.

## Expression Evaluation

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :expression-evaluation)
```

Allows the usage of `eval` in axioms, in which two predicates are compared to one another and if they are equivalent `eval` returns true. e.g.

```cl
    (eval (im-not-true ?a) (im-true ?b))
```

Evaluates to false, if we assume that `im-not-true` is false and `im-true` is true.

This requirement implies the existence of the `:domain-axioms` requirement and therefore is equivalent to

```cl
    (:requirements :domain-axioms :expression-evaluation)
```

## Fluents

Support: Meaning Has Changed
{: .label .label-purple }
Usage: Rare (in this context)
{: .label .label-purple }

```cl
    (:requirements :fluents)
```

Allows the usage of `(fluents t)`, fluent support in PDDL1.2 is different to how later versions of PDDL model numeric values.

This requirement implies the existence of the `:expression-evaluation` requirement and therefore is equivalent to

```cl
    (:requirements :expression-evaluation :fluents)
```

## Open World

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :open-world)
```

In planning all unknown values are assumed to be false. That is to say that if we do not know the value of a predicate, then we assume it to be false. This is known as the "closed world" assumption. This requirement mutates the planner to make an "open world" assumption. That is that values which are not known are not necessarily false.

This is rarely supported in more modern planners and often is a flag in the planner execution and not a requirement in the domain.

## True Negation

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :true-negation)
```

Don't treat negation as failure, treat it how it is in first order logic.

This requirement implies the existence of the `:open-world` requirement and therefore is equivalent to

```cl
    (:requirements :open-world :true-negation)
```

## ADL

Support: High
{: .label .label-green }
Usage: Low
{: .label .label-red }

```cl
    (:requirements :adl)
```

ADL is a super requirement which adds the following requirements

- `:strips`
- `:typing`
- `:disjunctive-preconditions`
- `:equality`
- `:quantified-preconditions`
- `:condition-effects`

## UCPOP

Support: Poor/None
{: .label .label-red }
Usage: Rare/None
{: .label .label-purple }

```cl
    (:requirements :ucpop)
```

UCPOP is a super requirement which adds the following requirements

- `:adl` (see above)
- `:domain-axioms`
- `:safety-constraints`

## References

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)