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
	            (at start (decrease (battery-amount ?rover) 8)))
	)
    ... ; Additional actions omitted
)
```


## Contents
- Requirements
- Numeric Fluents
- Durative Actions
    - :parameters
    - :duration
    - :condition
        - at start
        - at end
        - overall
    - :effect
        - at start
        - at end

## Requirements
[back to contents](#Contents)

Support: <span style="color:green">Universal</span>  
Usage: <span style="color:green">High</span>

`(:requirements <requirement_name>)`

Requirements are similar to import/include statements in programming languages, however as PDDL is a kind of declarative language, it is a `:requirement` as a given planner is "required" to facilitate some aspect of the language.

Multiple `:requirements` can be specified through a space separated list e.g.

`(:requirements :strips :adl :typing)`

### List of Requirements
The following is a list of requirements that were added by PDDL2.1 to the language of PDDL. 
- [:fluents](./Domain/requirements#Numeric%20Fluents)
- [:durative-actions](./Domain/requirements#Durative%20Actions)
- [:durative-inequalities](./Domain/requirements#Durative%20Inequalities)
- [:continuous-effects](./Domain/requirements#Continous%20Effects)
- [:negative-preconditions](./Domain/requirements#Negative%20Preconditions)

## Numeric Fluents
[back to contents](#Contents)

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
[back to contents](#Contents)

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


### Effect

## References
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)`