# Domain
A domain file in PDDL 1.2 defines the "universal" aspects of a problem. Essentially, these are the aspects that do not change regardless of what specific situation we're trying to solve. In PDDL 1.2 this is mostly the object types, predicates and actions that can exist within the the model.

```PDDL
(define
    (domain construction)
    (:extends building)
    (:requirements :strips :typing)
    (:types 
        site material - object
        bricks cables windows - material
    )
    (:constants mainsite - site)

    ;(:domain-variables ) ;deprecated

    (:predicates
        (walls-built ?s - site)
        (windows-fitted ?s - site)
        (foundations-set ?s - site)
        (cables-installed ?s - site)
        (site-built ?s - site)
        (on-site ?m - material ?s - site)
        (material-used ?m - material)
    )

    (:timeless (foundations-set mainsite))

    ;(:safety 
        (forall 
            (?s - site) (walls-built ?s)))
        ;deprecated

    (:action BUILD-WALL
        :parameters (?s - site ?b - bricks)
        :precondition (and
            (on-site ?b ?s)
            (foundations-set ?s)
            (not (walls-built ?s))
            (not (material-used ?b))
        )
        :effect (and
            (walls-built ?s)
            (material-used ?b)
        )
        ; :expansion ;deprecated
    )

    ;(:axiom
        :vars (?s - site)
        :context (and
            (walls-built ?s)
            (windows-fitted ?s)
            (cables-installed ?s)
        )
        :implies (site-built ?s)
    )

    ;Actions omitted for brevity
)
```
## Contents
- [Domain Name](#domain-name)
- [Extends](#extends)
- [Requirements](#requirements)
- [Types](#object-types)
- [Constants](#constants)
- [Predicates](#predicates)
- [Timeless Predicates](#timeless-predicates)
- [Safety Constraint](#safety-constraint)
- [Actions](#actions)
- [Axioms](#axioms)

## Domain Name
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(domain <name>)`

A domain always begins by being named. Imediately after we open our first brackets and write `(define` the next argument should be `(domain <name>)`. Although most planners take the domain from the file you pass them on the command line and won't bother checking if the domain name in the domain file corresponds to the domain name in the problem file, some will. It is best practice to include this name, just in case.

`(domain construction)`

Note that this name is also used when we're extending a domain. 

## Extends
[back to contents](#contents)

Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:extends <domain_name>)` 

The `:extends` argument allows a domain to extend another "parent" domain. When the `:extends` argument is used, a domain inherits the following from it's parent
- requirements
- types
- constants
- actions
- axioms
- timeless propositions

## Requirements
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements <requirement_name>)`

Requirements are similar to import/include statements in programming languages, however as PDDL is a kind of declarative language, it is a `:requirement` as a given planner is "required" to facilitate some aspect of the language.

Multiple `:requirements` can be specified through a space separated list e.g.

`(:requirements :strips :adl :typing)`

### List of Requirements
The following is a list of requirements as specified in the 1998 technical manual for the AIPS competition, however, not all are supported anymore.
- [:strips](./Domain/requirements.md#STRIPS)
- [:typing](./Domain/requirements.md#typing)
- [:disjunctive-preconditions](./Domain/requirements.md#Disjunctive%20Preconditions)
- [:equality](./Domain/requirements.md#Equality)
- [:existential-preconditions](./Domain/requirements.md#Existential%20Preconditions)
- [:universal-preconditions](./Domain/requirements.md#Universal%20Preconditions)
- [:quantified-preconditions](./Domain/requirements.md#Quantified%20Preconditions)
- [:conditional-effects](./Domain/requirements.md#Conditional%20Effects)
- [:action-expansions](./Domain/requirements.md#Action%20Expansions)
- [:foreach-expansions](./Domain/requirements.md#Foreach%20Expansions)
- [:dag-expansions](./Domain/requirements.md#DAG%20Expansions)
- [:domain-axioms](./Domain/requirements.md#Domain%20Axioms)
- [:subgoal-through-axioms](./Domain/requirements.md#Subgoals%20Through%20Axioms)
- [:safety-constraints](./Domain/requirements.md#Safety%20Constraints)
- [:expression-evaluation](./Domain/requirements.md#Expression%20Evaluation)
- [:fluents](./Domain/requirements.md#Fluents)
- [:open-world](./Domain/requirements.md#Open%20World)
- [:true-negation](./Domain/requirements.md#True%20Negation)
- [:adl](./Domain/requirements.md#ADL)
- [:ucpop](./Domain/requirements.md#UCPOP)

## Object Types
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>
```
(:types
    <type_name_1> ... <type_name_n> - object
    <sub_name_1> ... <sub_name_n> - <type_name_1>
)
```
Typing allows us to create basic and subtypes to which we can apply predicates. We use types to restrict what objects can form the parameters of an action. Types and subtypes allow us to declare both general and specific actions and predicates e.g.

```
(:types 
    site material - object
    bricks cables windows - material
)
```

Here is a types delaration. We have a type `site` which represents a building site and a type `material` which represents any generic building material.

We then declare sub types `bricks`, `cables` and `windows` which are all types of building materials.

We can declare general predicates which apply to any base type e.g.

`(material-used ?m - material)`

which applys to anything of a material type. Or we can create specific predicates, such as

`(windows-clean ?w - windows)`

Which only apply to a specific sub-type.

We can go further and do the same with actions for example.

```
(:action MOVE-MATERIAL
    :parameters (?s1 - site ?s2 - site ?m -material)
    ...
)
```
Where we wish to express for example the movement of any material from one site to another. The material which we are moving doesn't really matter as it's only being moved. Note that we cannot then use predicates such as `(windows-clean)` within this action as not all `material` has this predicate defined for it.

Alternatively, if we want to use a specific material, such as when we're building a wall we might declare an action like so

```
(:action BUILD-WALL
    :parameters (?s - site ?b - bricks)
    ...
)
```

This action above requires that the specific object is a `bricks` type and therefore we can use predicates which use `bricks`. However, because all `bricks` are `materials` we can also use predicates that take materials for example `(material-used)` within our action.

## Constants
[back to contents](#contents)

Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>

`(:constants mainsite - site)`

Constants allow us to declare objects that are present across all instances of a problem. In the example above we assume that all problems contain a `mainsite` and some may then also contain additional building sites.

This isn't particularly common in practice because we would just declare the object repeatedly in each specific problem.

## Domain Variables
[back to contents](#contents)

Support: <span style="color:pink">Changed</span>  
Usage: <span style="color:red">Rare (in this context)</span>

`(:domain-variables (numthings 2) - integer)`

Domain variables are an older way of expressing numerics which is redefined in PDDL2.1. You likely won't see domains declared like this in favour of the simpler more expressive format used in PDDL2.1.

Further, most planners won't support this syntax.

## Predicates
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

```
(:predicates
    (<predicate_name> <argument_1> ... <argument_n>)
)
```
Predicates apply to a specific type of object, or to all objects. Predicates are either true or false at any point in a plan and when not declared are assumed to be false (except when the Open World Assumption is included as a requirement).

An example of a predicate declaration can be seen below. In most cases predicate normally take only one or two objects as arguments. But this is not a restriction and predicates can (in theory) take as many arguments as the user wishes.

```
(:predicates
    (walls-built ?s - site)
    (windows-fitted ?s - site)
    (foundations-set ?s - site)
    (cables-installed ?s - site)
    (site-built ?s - site)
    (on-site ?m - material ?s - site)
    (material-used ?m - material)
)
```

In this case, when the predicate `(walls-built ?s)` is true for a given site, then we can assume that said site has had walls built on it. When it is false, we would assume that the site does not have walls on it. 

In another case, let's say with have multiple sites with various materials distributed across them, we can use the predicate `on-site` to model the location of a material across different sites. e.g. `(on-site bricks1 site1)` implies that the material `bricks1` are currently located on `site1`. 

To move the bricks we would create an action which indicates that `(on-site bricks1 site1)` is now false and (assuming `site2` is where we're moving them to) that `(on-site bricks1 site2)` is now true.

## Timeless Predicates
[back to contents](#contents)

Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:timeless (<predicate_name> <arguments>))`

A timeless predicate is a predicate which is always true and cannot be changed by any action in the domain. It's not clear why you would need to model something that is always true and never changes, but it was included in the spec. An example is provided below, but I cannot say for certain if this is accurate.

`(:timeless (foundations-set mainsite))`

## Safety Constraint
[back to contents](#contents)

Support: <span style="color:red">Poor</span>  
Usage: <span style="color:red">Rare</span>

`(:safety <condition>)`

A safety condition is a condition which for any plan to be valid, must be true at the end of the plan. How this differs from a goal condition I am honestly not sure. 

It's rarely used in any domains/problems I've see. An example is provided below, but I cannot say for certain if this is accurate.

```
(:safety 
    (forall 
        (?s - site) (walls-built ?s)))
```

It might be used in order to essentially define global goals, goals which must be met regardless of the specific problem. In reality, these kind of global goals would still be encoded into the problem file.

## Actions
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

```
(:action <action_name>
    :parameters (<argument_1> ... <argument_n>)
    :precondition (<logical_expression>)
    :effect (<logical_expression>)
    ; :expansion
)
```

An action defines a transformation the state of the world. This transformation is typically an action which could be performed in the execution of the plan, such as picking up an object, constructing something or some other change.

An action is broken down into three distinct sections, with an alternation possible on the last section.

The first is the `:parameters` section which defines the things we are performing an action on and subsequently what predicates we will be checking and manipulating later.

The second is the `:precondition` section. These are typically a series of predicate conjunctions and disjunctions which must be satisfied in order for the action the applied. Note that although an action's precondition may be satisfied that doesn't mean it is applied in a plan. Ultimately it is the effect the action has that matters.

The third section is a choice between `:effect` and `:expansion` an action cannot have both. Most domains use `:effect`. No details are provided of how to use `:expansion` as not enough planners support it.

### Action Contents
- [Action Example](#action-example)
- [Parameters](#parameters)
- [Preconditions](#preconditions)
- [Effects](#effects)
### Action Example
```
(:action BUILD-WALL
    :parameters (?s - site ?b - bricks)
    :precondition (and
        (on-site ?b ?s)
        (foundations-set ?s)
        (not (walls-built ?s))
        (not (material-used ?b))
    )
    :effect (and
        (walls-built ?s)
        (material-used ?b)
    )
)
```
### Parameters
Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`:parameters (argument_1 ... argument_n)`

`:parameters (?s -site ?b - bricks)`

The parameters defines the type of object we're interested in. Note that a parameter can take any type or subtype. If we have for example three instances of site such as `s1`, `s2` and `s3` and we have two instances of bricks `b1`, `b2`, our planner considers all possible actions such as:

`(BUILD-WALL s1 b1)`  
`(BUILD-WALL s2 b1)`  
`(BUILD-WALL s3 b1)`  
`(BUILD-WALL s1 b2)`  
`(BUILD-WALL s2 b2)`  
`(BUILD-WALL s3 b2)`

Therefore it is not up to us as a user to specify the specific object to which an action applies but rather the **type** of objects to which the action applies.

In this case, when we build a wall we need to know what bricks we're using to build it and where we're building it. Our actions are specific to the problem we've chosen to consider and model, therefore there might additional things that other user want/need to model that I don't. 

Your domain and problem should only consider and model the aspects of the problem which you're trying to solve. For example here I haven't modelled the person who's actually going to perform the work, but maybe if I was the manager of a larger building site I might want to and therefore I would need to adapt my models.

#### Either
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:red">Rare</span>

`:parameters (?x - (either bricks windows))`

The `either` term expresses that a parameter may have one of any type within the either expression. In the example above, `?x` can be of either type `bricks` or type `windows`. 

This functionality is rarely used in favour of subtyping. However, it might be the case where with direct inheritance it's not possible to group two distinctly different types.

### Preconditions
Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>
```
:precondition (<logical_expression>)
```
```
:precondition (and
    (on-site ?b ?s)
    (foundations-set ?s)
    (not (walls-built ?s))
    (not (material-used ?b))
)
```

Preconditions are conditions which must be met in order for an action to be possible. Just because an action is possible, does not mean that it is definitely applied and a planner will always consider if an action moves the state closer to the goal state.

The statement above is a conjunction and can be thought of as shown below

`os(b, s) /\ fs(s) /\ ¬wb(s) /\ ¬mu(b)`

In PDDL `and` and `or` apply across all the predicates within them. For more details on logic keywords see below

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

Forall **cannot** be used as an effect.

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

Exists **cannot** be used as an effect.

### Effects
Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`:effect (logical_expression)`

```
:effect (and
    (walls-built ?s)
    (material-used ?b)
)
```

An effect consists of a conjunctive logical expression, which defines which values should be set to true or false if an action is applied. Note that whilst it is a logical expression, it doesn't not have the expressivity of `precondition`s because there can only be one set of truth values we can assign to it.

This limits us to using `and` and `not` to express the effects of an action. Although in theory we could also use `forall` as well, this is not supported and does not fit well with the modelling process as typically we take all of the objects (and therefore predicates) which we are planning to have an `effect` on as `parameters`.

#### And
`(and (predicate_1) ... (predicate_n))`

A conjunction of predicates, expressing that all values must be true in order to evaluate to true. e.g.

`(and (walls-built ?s) (windows-fitted ?s))`

#### Not
`(not (logical_expression/predicate_name))`

Not negates a predicate value or logical expression. In a precondition it expresses that some predicate value or logical expression is false. In an effect it assigns false to a predicate value.

`(not (material-used ?b))`

## Axioms
[back to contents](#contents)

Support: <span style="color:yellow">High</span>  
Usage: <span style="color:orange">Low</span>
```
(:axiom
    :vars (arguments)
    :context (logical_expression)
    :implies (logical_expression)
)
```


```
(:axiom
    :vars (?s - site)
    :context (and
        (walls-built ?s)
        (windows-fitted ?s)
        (cables-installed ?s)
    )
    :implies (site-built ?s)
)
```

An axiom is a derived predicate which essentially takes its value as the result of evaluating a logical expression over other predicates. 

In the example above, we're saying that for any given building site, if the walls are built (`walls-built`) and the windows are fitted (`windows-fitted`) and the cables installed (`cables-installed`) then this means the site is built (`site-built`). 

This is quite useful if there is a logical expression you're using repeatedly in several locations, as you can simply reduce it to a single predicate. However, I haven't really seen this used in context yet.

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)