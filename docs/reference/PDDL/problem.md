# Problem
[return to homepage](../../readme.md) | [return to PDDL main page](./main.md)

A problem forms the other half of a planning problem. In the domain we express the global "worldly" aspects of a problem, such as what actions we can perform and what types of objects exist in the world we're planning in.

The problem then solidifies this expression by define exactly what objects exist, and what is true about them and then finally what the end goal is. What state we want the world to be in once the plan is finished.

```PDDL
(define
    (problem buildingahouse)
    (:domain construction)
    ;(:situation <situation_name>) ;deprecated
    (:objects 
        s1 - site 
        b - bricks 
        w - windows 
        c - cables
    )
    (:init
        (on-site b s1)
        (on-site c s1)
        (on-site w s1)
    )
    (:goal (and
            (walls-built ?s1)
            (cables-installed ?s1)
            (windows-fitted ?s1)
        )
    )
)
```

## Contents
- [Problem Name](#problem-name)
- [Domain](#domain)
- [Situation](#situation)
- [Objects](#objects)
- [Init (Initial State)](#init)
- [Goal](#goal)

## Problem Name
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(problem <name>)`

Each problem is given a name, typically this is a unique identifier. This is to allow for usage of the `situation` keyword which allows a problem to be extended. However whilst the name is commonly included in most problems, the use of situation to extend problems is not. Most problem names are unimaginative like `prob1` or `p1`.

`(problem buildingahouse)`

## Domain
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:domain <domain_name>)`

The domain argument refers to the domain in which the problem exists (see [Domain](./domain) for details of what a domain is). Although often defined in problem files, this argument is typically redundant as most planners take the domain and problem file from the command line and assume that the domain defined in one corresponds to the problem defined in the other. This is not always the case so it is worth specifying the domain name anyway.

`(:domain construction)`

## Situation
[back to contents](#contents)

Support: <span style="color:orange">Low</span>  
Usage: <span style="color:red">Rare</span>

`(:situation <parent_problem_name>)`

A `situation` argument inherits qualities from another problem file. In some cases all of our problems may have common features which we can express as part of a `situation` file. An example might be that all of our problems have two `site`s, a storage depot and a construction site. We could therefore express this as part of a situation and then within our problem file express only the aspects which are unique to the specific problem we're looking at.

The use of situation is not very common and most problem files will define even common elements across each file. It is also not a fully supported feature in some more modern planners.

`(:situation generalbuildingproblem)`

## Objects
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

```
(:objects
    object_name_1 ... object_name_n - some_object_type
    ...
    object_name_1 ... object_name_n - some_object_type
)
```

The objects block allows us to declare a set of objects which exist within our problem. each object name must be unique, and should be typed. If not typed then they will typically take on the properties of the base type `object` (see [Domain - Object Types](./domain#Object%20Types) for details)

```
(:objects
    s1 s2 s3 - site
    ba bb bc - bricks
    windowAlpha windowBeta windowCharlie - windows
    uierjiae faufhf uihrai - cables
)
```

Note that whilst conventionally we would just use an abbreviation followed by a number, we are not required to, and can use even ridiculously unhelpful names (as shown above).

```
(:objects 
    s1 - site 
    b - bricks 
    w - windows 
    c - cables
)
```

## Init
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

```
(:init
    <predicate>
    ...
    <predicate>
)
```

The initial state (init) defines specifically what predicates are true at the start of the problem. This is **not** a logical expression because it is simply a list of predicates which are true. Unless the planner or domain specify otherwise all problems have the "closed world" assumption applied meaning anything not specified as true is considered false. Therefore we only need to list things which are true.

```
(:init
    (on-site b s1)
    (on-site c s1)
    (on-site w s1)
)
```

In the case of our domain and problem, the only facts which are true are that the materials we need to build are `on-site`.

## Goal
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>
```
(:goal logical_expression)
```

The goal is a logical expression of predicates which must be satisfied in order for a plan to be considered a solution. In essence it is what we want the world to look like at the end. Note that as a logical expression, if this expression excludes some predicate, then the value of that predicate is not considered important. This means that a goal should not only consist of the predicates that should be true, but also the predicate which should be false.

Note that all standard logical operators such as `or` and `forall` are available as part of the goal, which means we can express multiple different goal states all of which are acceptable.

```
(:goal (and
        (walls-built ?s1)
        (cables-installed ?s1)
        (windows-fitted ?s1)
    )
)
```

Typically most goals are just conjunctions and negations as there is only one desirable state at the end of the plan.

#### And
`(and (predicate_1) ... (predicate_n))`

A conjunction of predicates, expressing that all values must be true in order to evaluate to true. e.g.

`(and (walls-built ?s) (windows-fitted ?s))`

#### Or
`(or (predicate_1) ... (predicate_n))`

A disjunction of predicates, expressing at least one of the values must be true in order to evaluate true. e.g.

`(or (windows-fitted ?s) (cables-installed ?s))`

#### Imply
`(imply (antecedent_predicate) (consequent_predicate))`

An implies across an antecedent predicate and a consequence predicate. An implies evaluates true whenever the antecedent is false, or the antecedent and consequent are true. e.g.

`(imply (walls-built ?s) (foundations-set ?s))`

#### Not
`(not (logical_expression/predicate_name))`

Not negates a predicate value or logical expression. In a precondition it expresses that some predicate value or logical expression is false. In an effect it assigns false to a predicate value.

`(not (material-used ?b))`

#### Forall
`(forall (argument) logical_expression)`

Forall takes an argument and expresses that some logical expression holds true across it. In this case that all brick objects in the domain have not been used.

```
(forall (?b - bricks) 
    (not (material-used ?b))
)
```

##### When
```
(forall (argument) 
    when (inclusion_expression)
        logical expression
)
```
When extends a forall condition to specify an inclusion condition. Essentially it says `forall` these objects `when` these conditions are met check that these conditions are met.

e.g.

```
(forall (?c - bricks) 
    when (on-site ?c ?s)
        (material-used ?c)
)
```

Is expressing that `forall` bricks, that meet the condition `on-site ?c ?s` they must also meet the condition that they've been used `material-used ?c`.

#### Exists
`(exists (argument) logical_expression)`

Exists expresses the same as `forall` except rather than expressing that every object of a given type meet a logical expression, it expresses that at least one meets the logical expression.

e.g.
```
(exists
    (?c - bricks)
        (not (material-used ?c))
)
```

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)