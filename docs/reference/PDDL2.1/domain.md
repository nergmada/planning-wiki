# Domain
The domain syntax in PDDL2.1 extended upon version 1.2 to include two key new features, `durative-actions` and `functions` which are referred to as numeric fluents. Additional new requirements were specified on top of the 1.2 spec to allow older planners to identify that they could not solve these neweer domains. 

```
(define (domain rover-domain)
    (:requirements :durative-actions :fluents :duration-inequalities)
    (:types rover waypoint)
    (:functions
        (battery-amount ?r - rover)
        (sample-amount ?r - rover)
        (recharge-rate ?r - rover)
        (battery-capacity)
        (sample-capacity)
        (distance-travelled)
    )
    (:predicates
        ... ; Predicates omitted              
	)
	     
    (:durative-action move
        :parameters 
            (?r - rover
             ?fromwp - waypoint 
             ?towp - waypoint)
        
        :duration 
            (= ?duration 5)
        
        :condition
	        (and 
	            (at start (rover ?rover)) 
	            (at start (waypoint ?from-waypoint)) 
	            (at start (waypoint ?to-waypoint)) 
	            (over all (can-move ?from-waypoint ?to-waypoint)) 
	            (at start (at ?rover ?from-waypoint)) 
	            (at start (> (battery-amount ?rover) 8)))
	            
        :effect
	        (and 
	            (at end (at ?rover ?to-waypoint))
	            (at end (been-at ?rover ?to-waypoint))
	            (at start (not (at ?rover ?from-waypoint))) 
	            (at start (decrease (battery-amount ?rover) 8))
                (at end (increase (distance-travelled) 5))
                )
	)
    ... ; Additional actions omitted
)
```


## Contents
- [Requirements](#requirements)
- [Numeric Fluents](#numeric-fluents)
- [Durative Actions](#durative-actions)
    - [:parameters](#parameters)
    - [:duration](#duration)
    - [:condition](#condition)
    - [:effect](#effect)

## Requirements
[back to contents](#contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements <requirement_name>)`

Requirements are similar to import/include statements in programming languages, however as PDDL is a kind of declarative language, it is a `:requirement` as a given planner is "required" to facilitate some aspect of the language.

Multiple `:requirements` can be specified through a space separated list e.g.

`(:requirements :strips :adl :typing)`

### List of Requirements
The following is a list of requirements that were added by PDDL2.1 to the language of PDDL. 
- [:fluents](./Domain/requirements.md#Numeric%20Fluents)
- [:durative-actions](./Domain/requirements.md#Durative%20Actions)
- [:durative-inequalities](./Domain/requirements.md#Durative%20Inequalities)
- [:continuous-effects](./Domain/requirements.md#Continous%20Effects)
- [:negative-preconditions](./Domain/requirements.md#Negative%20Preconditions)

## Numeric Fluents
[back to contents](#contents)

Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>

```
(:functions
    (<variable_name> <parameter_name> - <object_type>)
    ...
    (<variable_name> <parameter_name> - <object_type>)
)
```

A numeric fluent, similar to a predicate, is a variable which applies to zero or more objects and maintains a value throughout the duration of the plan. It is declared with a name followed by the object type to which it applies. e.g.

```
(:functions
    (battery-level ?r - rover)
)
```

Means that every rover object in the domain has a variable which maintains a value for `battery-level`. A function can apply to zero or more objects, meaning we could also use it to represent a numeric value between two values, for example a distance.

```
(:functions
    (distance ?wp1 - waypoint ?wp2 - waypoint)
)
```

Numeric fluents can be altered through the effects of both `action`s and `durative-action`s. There are a number of supported effects for numeric fluents.

### Prefix Maths
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>
#### Add
`(+ (sample-capacity) (battery-capacity))`
#### Subtract
`(- (sample-capacity) (battery-capacity))`
#### Divide
`(/ (sample-capacity) (battery-capacity))`
#### Multiply
`(* (sample-capacity) (battery-capacity))`

Prefix notation is used to represent maths operations on numeric fluents. We can see the four primarily binary operations we can perform on numeric fluents. In all of these cases, to convert to infix notation we place the operator between the name of the two fluents.

### Increase
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>

`(increase (battery-level ?r) 10)`

An increase effect increases the value of a numeric variable by the given amount. It is possible to use another numeric variable as the increase value for example.

`(increase (battery-level ?r) (charge-available - ?solarpanel))`

### Decrease
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>

`(decrease (battery-level ?r) 10)`

A decrease effect decreases the value of a numeric variable by the given amount. It is possible to use another numeric variable as the decrease value for example.

`(decrease (battery-level ?r) (power-needed-for-work - ?task))`

### Assign
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>

`(assign (battery-level ?r) 10)`

An assign effect assigns the value of a numeric variable to the given amount. It is possible to use another numeric variable as the assign value for example.

`(assign (battery-level ?r) (max-charge ?r))`

### Scale Up
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:red">Rare</span>

`(scale-up (battery-level ?r) 2)`

A scale up effect increases the value of the numeric variable by the given scale factor. The scale factor can be another numeric variable.

`(scale-up (battery-level ?r) (charge-rate ?r))`

### Scale Down
Support: <span style="color:yellow">High</span>  
Usage: <span style="color:red">Rare</span>

`(scale-down (battery-level ?r) 2)`

A scale down effect decreases the value of the numeric variable by the given scale factor. The scale factor can be another numeric variable.

`(scale-down (battery-level ?r) (consumption-rate ?r))`

## Durative Actions
[back to contents](#contents)

Support: <span style="color:yellow">High</span>  
Usage: <span style="color:green">High</span>

```
(:durative-action <action_name>
    :parameters (<arguments>)
    :duration (= ?duration <duration_number>)
    :condition (logical_expression)
    :effect (logical_expression)
)
```

A durative action is an action which represents an action which takes an amount of time to complete. The amount of time is expressable as either a value or as an inequality (allow for both fixed duration and ranged duration actions). Similar to traditional `action`s we have `condition`s and `effect`s, but it should be noted that the keyword in durative actions is `condition` **NOT** `precondition`. 

This semantic change is designed to represent that a durative action may not just condition when the action starts, but may have conditions which need to be true at the end or over the duration of the action. A good example of this can be found in flight planning, where an action `fly` requires that a runway be free at the start and end of an action, in order for the plane to take off and land, whilst the runway does not need to be free whilst the plane is flying.

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

### Duration
Support: <span style="color:green">Universal - where durative actions are available</span>  
Usage: <span style="color:green">High</span>

#### Fixed Value:

`:duration (= ?duration <duration_number>)`

#### Inequality Value:

`:duration (> ?duration <duration_number>)`

`:duration (< ?duration <duration_number>)`

A duration can be expressed as either a fixed value or an inequality. It is also possible to express duration as the value of a Numeric Fluent, which means an action such as `move` can have a `duration` dependent on say `distance` between two points.

`:duration (= ?duration 10)`

### Condition
Support: <span style="color:green">Universal - where durative actions are available</span>  
Usage: <span style="color:green">High</span>

`:condition (<logical_temporal_expression>)`

A condition is a logical and temporal expression which must be met in order for a durative action to execute. Because a durative action occurs over time, we may wish to express that additional conditions be met for the duration or end of the action, not just the start. This gives rise to three new keywords `at start`, `at end` and `over all`.

#### At Start
An expression or predicate with `at start` prefixed to it, means that the condition must be true at the start of the action in order for the action to be applied. e.g.

`(at start (at ?rover ?from-waypoint)) `

expresses that `at start` the given `rover` is `at` the `from-waypoint`. Confusingly in this particular domain, the `at` is a predicate representing the location of an object `at` a point, whilst `at start` is a keyword. 

`at start` is usually applied per predicate.

#### At End
An expression or predicate with `at end` prefixed to it, means that the condition must be true at the end of the action in order for the action to be applied e.g.

`(at end (>= (battery-amount ?rover) 0)`

In essence we are saying that whilst this fact doesn't have to be true at the start or during the action, it must be true at the end. In this case, we're expressing that the battery amount at the end of the action must be greater than zero.

#### Over All
An expression or predicate with an `overall` prefixed to it, means that the condition must be true throughout the action, including at the start and end. e.g.

`(over all (can-move ?from-waypoint ?to-waypoint))`

At all points in the execution of the action the given expression must evaluate to true. In the case above, we are expressing that it must be possible to move from the `from` waypoint to the `to` waypoint all the way through the action. I.e. we don't want to get half way through the action to find that after a certain point a path has become blocked.

### Effect
Support: <span style="color:green">Universal - where durative actions are available</span>  
Usage: <span style="color:green">High</span>

`:effect (<logical_temporal_condition>)`

An effect similar to in traditional actions, is a condition which is made true when an action is applied. Note that the effect is always more restrictive and typically only allows `and` and `not` as logical expressions. 

Temporal expressions, such as `at start` and `at end` are available, however, `over all` is typically not used. because it's not common to express a boolean effect which is true over the duration of the action. Instead you would set it to true at the start, using an `at start` and set it to false at the end using `at end`

```
:effect
    (and 
        (at start (not (at ?rover ?from-waypoint))) 
        (at start (decrease (battery-amount ?rover) 8)))
        (at end (at ?rover ?to-waypoint))
        (at end (been-at ?rover ?to-waypoint))
```

The above effect is saying that `at start` the rover can no longer be considered as being at the `from` waypoint, and that `at end` it can now be considered as being at the `to` waypoint. It also adds a second predicate `been-at` which indicates that at some point the rover has visited the given waypoint.

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)`