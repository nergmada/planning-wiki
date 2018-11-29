# A PDDL Reference Guide
[Go Straight To Contents](#Contents)
## Introduction
This reference and guide is here to provide easy access to resources related to the field of AI Planning. AI Planning is hard to quantify under one roof, due to the variety of ongoing research in the field. 

The International Conference on Autonomous Planning and Scheduling has in the course of supporting AI Planning research created a competition for the AI Planning Software (Planners) that have been built to solve AI Planning problems.

This competition, dating from 1998, has defined a general purpose definition language, Planning Domain Definition Language (PDDL), which is designed to be capable of specifying any planning or scheduling problem you could come across.

In reality, PDDL since it's first incarnation in 1998 has had serious modifications to make it capable of handling the complex tasks we expect of modern autonomous planning and scheduling techniques. 

## Using This Guide
This guide splits into three main sections, guide, reference and examples. 

The guide section is here to help the uninitiated get an idea of what planning is and how it can be used. It glazes over technical details where they're complex and difficult to understand. *This is not intended to be a substitute to the copious academic literature written in the subject*.

The reference guide itself splits into two sections, one for the language of planners, PDDL. The other section for the planners which can read and solve PDDL problems. 

The nature of AI planning and the language means that **not** all features are supported by all planners and not all techniques are used as often as others. The reference here aims to help with that by firstly showing next to each definition an indication of how well supported the feature is and how commonly used it is.

>Support: <span style="color:green">Universal</span>, <span style="color:yellow">High</span>, <span style="color:orange">Medium</span>, <span style="color:red">Poor</span>  
Usage: <span style="color:green">High</span>, <span style="color:yellow">Medium</span>, <span style="color:orange">Low</span>, <span style="color:red">Rare</span>

For planners, this reference will aim to provide indication of what features are supported by what planners. It also provide useful hints and notes about the quirks and specific issues certain planners have in running certain problems. 

## Contributions, Corrections and Feedback
Contributions are always welcome!

The best way to provide a contribution is to request collaborator access to this repository, either via emailing adam.green@kcl.ac.uk or by filing an issue on this repo. Please **do not** fork this repository, as stale copies of this reference guide will confuse. Further explanation on exactly how to file a contribution, through a branch and pull request are provided in the guide here.

Alternatively, if you are not able to provide a contribution, but maybe think there is something this guide is missing or is incorrect, please add a new issue to this repo, and a correction, or additional will be made based on priority.

Finally, if you have a planner which you think should be included in this reference guide, please ask for collaborator access (if you're the creator of the planner), or create an issue (if you're a user) and we'll try to include it.

Any other issues/concerns should be sent to adam.green@kcl.ac.uk and I'll try to get back to you ASAP.

## Contents
- Guide
    - [What is AI Planning?](./guide/whatisaip.md)
        - [Domain independent Planning](./guide/whatisaip.md#Domain%20Independent%20Planning)
    - [What is PDDL?](./guide/whatispddl.md)
        - [PDDL](./guide/whatispddl.md#PDDL)
        - [PDDL 2.1](./guide/whatispddl.md#PDDL%202%2E1)
        - [PDDL 2.2](./guide/whatispddl.md#PDDL%202%2E2)
        - [PDDL 3.0](./guide/whatispddl.md#PDDL%203%2E0)
        - [PDDL 3.1](./guide/whatispddl.md#PDDL%203%2E1)
        - [PDDL+](./guide/whatispddl.md#PDDL+)
        - [Other Flavours](./guide/whatispddl.md#Other%20Flavours%20of%20PDDL)
    - [What is a planner?](./guide/whatisplanner.md)
        - [List of planners](./guide/whatisplanner.md#List%20of%20Planners)
        - [Supported Features](./guide/whatisplanner.md#Planner%20Feature%20Support)
- Reference
    - PDDL
        - [PDDL (1.2)](/reference/PDDL/main.md)
            - [Domain](./reference/PDDL/domain.md)
                - [Extends](./reference/PDDL/domain.md#Extends)
                - [Requirements](./reference/PDDL/domain.md#Requirements)
                    - [List of supported Requirements](./reference/PDDL/Domain/requirements.md)
                - [Object Types](./reference/PDDL/domain.md#Object%20Types)
                - [Constants](./reference/PDDL/domain.md#Constants)
                - [Predicates](./reference/PDDL/domain.md#Predicates)
                - [Timeless Predicates](./reference/PDDL/domain.md#Timeless%20Predicates)
                - [Safety Constraints](./reference/PDDL/domain.md#Safety%20Constraint)
                - [Actions](./reference/PDDL/domain.md#Actions)
                - [Axioms](./reference/PDDL/domain.md#Axioms)
            - [Problem](./reference/PDDL/problem.md)
                - [Problem Name](./reference/PDDL/problem.md#Problem%20Name)
                - [Domain](./reference/PDDL/problem.md#Domain)
                - [Situation](./reference/PDDL/problem.md#Situation)
                - [Objects](./reference/PDDL/problem.md#Objects)
                - [Init (Initial State)](./reference/PDDL/problem.md#Init)
                - [Goal](./reference/PDDL/problem.md#Goal)
        - PDDL 2.1
            - Domain
                - Requirements
                    - :numeric-fluents
                    - :durative-actions
                    - :durative-inequalities
                    - :continuous-effects
                    - :negative-preconditions
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
            - Problem
                - Numeric Fluents
                - Metric
                - Length (Deprecated)
        - PDDL 2.2
            - Domain
                - Requirements
                    - :derived-predicates
                    - :timed-initial-literals
            - Problem
                - Timed initial literals
        - PDDL 3.0
            - Domain
                - Requirements
                    - :preferences
                    - :constraints
                    - :action-costs
                - Constraints
            - Problem
                - Preferences
                    - always
                    - sometime
                    - within
                    - at-most-once
                    - sometime-after
                    - sometime-before
                    - always-within
                    - hold-during
                    - hold-after
        - PDDL 3.1
            - Domain
                - Requirements
                    - :object-fluents
        - PDDL+
            - Domain
                - Requirements
                    - :time
                - Processes
                    - :parameters
                    - :precondition
                    - :effect
                - Events
                    - :parameters
                    - :precondition
                    - :effect
        - Other PDDL Flavours & Syntaxing
            - Domain
                - Requirements
                    - :goal-utilities
                    - :constants
                    - :predicates
                    - :functions
                    - :types
    - Planners
- FAQ
