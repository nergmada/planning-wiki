# A PDDL Reference Guide
[Go Straight To Contents](#contents)
## Introduction
This reference and guide is here to provide easy access to resources related to the field of AI Planning. AI Planning is hard to quantify under one roof, due to the variety of ongoing research in the field. 

The International Conference on Autonomous Planning and Scheduling has in the course of supporting AI Planning research created a competition for the AI Planning Software (Planners) that have been built to solve AI Planning problems.

This competition, dating from 1998, has defined a general purpose definition language, Planning Domain Definition Language (PDDL), which is designed to be capable of specifying any planning or scheduling problem you could come across.

In reality, PDDL since it's first incarnation in 1998 has had serious modifications to make it capable of handling the complex tasks we expect of modern autonomous planning and scheduling techniques. 

For more details on PDDL, Planning, the history, the usage and the research, see the guide.

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

The best way to provide a contribution is to request collaborator access to this repository, either via emailing adam.green@kcl.ac.uk or by filing an issue on [this repo](https://github.com/nergmada/pddl-reference). Please **do not** fork this repository, as stale copies of this reference guide will confuse. Further explanation on exactly how to file a contribution, through a branch and pull request are provided in the guide here.

Alternatively, if you are not able to provide a contribution, but maybe think there is something this guide is missing or is incorrect, please add a new issue to [this repo](https://github.com/nergmada/pddl-reference), and a correction, or additional will be made based on priority.

Finally, if you have a planner which you think should be included in this reference guide, please ask for collaborator access (if you're the creator of the planner), or create an issue (if you're a user) and we'll try to include it.

Any other issues/concerns should be sent to adam.green@kcl.ac.uk and I'll try to get back to you ASAP.

## Contents
- Guide
    - [What is AI Planning?](./guide/whatisaip.md)
        - [Domain independent Planning](./guide/whatisaip.md#domain%20independent%20planning)
    - [What is PDDL?](./guide/whatispddl.md)
        - [PDDL](./guide/whatispddl.md#pddl)
        - [PDDL 2.1](./guide/whatispddl.md#pddl-21)
        - [PDDL 2.2](./guide/whatispddl.md#pddl-22)
        - [PDDL 3.0](./guide/whatispddl.md#pddl-3)
        - [PDDL 3.1](./guide/whatispddl.md#pddl-31)
        - [PDDL+](./guide/whatispddl.md#pddl-1)
        - [Other Flavours](./guide/whatispddl.md#other-flavours-of-pddl)
    - [What is a planner?](./guide/whatisplanner.md)
        - [List of planners](./guide/whatisplanner.md#list-of-planners)
        - [Supported Features](./guide/whatisplanner.md#planner-feature-support)
- Reference
    - PDDL
        - [PDDL (1.2)](./reference/PDDL/main.md)
            - [Domain](./reference/PDDL/domain.md)
                - [Extends](./reference/PDDL/domain.md#extends)
                - [Requirements](./reference/PDDL/domain.md#requirements)
                    - [List of PDDL 1.2 Requirements](./reference/PDDL/Domain/requirements.md)
                - [Object Types](./reference/PDDL/domain.md#object-types)
                - [Constants](./reference/PDDL/domain.md#constants)
                - [Predicates](./reference/PDDL/domain.md#predicates)
                - [Timeless Predicates](./reference/PDDL/domain.md#timeless-predicates)
                - [Safety Constraints](./reference/PDDL/domain.md#safety-constraint)
                - [Actions](./reference/PDDL/domain.md#actions)
                - [Axioms](./reference/PDDL/domain.md#axioms)
            - [Problem](./reference/PDDL/problem.md)
                - [Problem Name](./reference/PDDL/problem.md#problem-name)
                - [Domain](./reference/PDDL/problem.md#domain)
                - [Situation](./reference/PDDL/problem.md#situation)
                - [Objects](./reference/PDDL/problem.md#objects)
                - [Init (Initial State)](./reference/PDDL/problem.md#init)
                - [Goal](./reference/PDDL/problem.md#goal)
        - [PDDL 2.1](./reference/PDDL2.1/main.md)
            - [Domain](./PDDL2.1/domain.md)
                - [Requirements](./PDDL2.1/domain.md#requirements)
                    - [List of PDDL 2.1 Requirements](./PDDL2.1/domain.md#list-of-requirements)
                - [Numeric Fluents](./PDDL2.1/domain.md#numeric-fluents)
                - [Durative Actions](./PDDL2.1/domain.md#durative-actions)
                    - [:parameters](./PDDL2.1/domain.md#parameters)
                    - [:duration](./PDDL2.1/domain.md#duration)
                    - [:condition](./PDDL2.1/domain.md#condition)
                    - [:effect](./PDDL2.1/domain.md#effect)
            - [Problem](./PDDL2.1/problem.md)
                - [Numeric Fluents](./PDDL2.1/problem.md#numeric-fluents)
                - [Metric](./PDDL2.1/problem.md#metric)
                - [Length (Deprecated)](./PDDL2.1/problem.md#length)
        - [PDDL 2.2](./reference/PDDL2.2/main.md)
            - [Domain](./PDDL2.2/domain.md)
                - [Requirements](./PDDL2.2/domain.md#requirements)
                    - [List of PDDL 2.2 Requirements](./PDDL2.2/domain.md#list-of-requirements)
                - [Derived Predicates](./PDDL2.2/domain.md#derived-predicates)
            - [Problem](./PDDL2.2/problem.md)
                - [Timed initial literals](./PDDL2.2/problem.md#timed-initial-literals)
        - PDDL 3.0
            - [Domain](./PDDL3.0/domain.md)
                - [Requirements](./PDDL3.0/domain.md#requirements)
                - [Constraints](./PDDL3.0/domain.md#constraints)
                    - [always](./PDDL3.0/domain.md#always)
                    - [sometime](./PDDL3.0/domain.md#sometime)
                    - [within](./PDDL3.0/domain.md#within)
                    - [at-most-once](./PDDL3.0/domain.md#at-most-once)
                    - [sometime-after](./PDDL3.0/domain.md#sometime-after)
                    - [sometime-before](./domain.md#sometime-before)
                    - [always-within](./domain.md#always-within)
                    - [hold-during](./domain.md#hold-during)
                    - [hold-after](./domain.md#hold-after)
            - [Problem](./problem.md)
                - [Preferences](./problem.md#preferences)
                    - [always](./problem.md#always)
                    - [sometime](./problem.md#sometime)
                    - [within](./problem.md#within)
                    - [at-most-once](./problem.md#at-most-once)
                    - [sometime-after](./problem.md#sometime-after)
                    - [sometime-before](./problem.md#sometime-before)
                    - [always-within](./problem.md#always-within)
                    - [hold-during](./problem.md#hold-during)
                    - [hold-after](./problem.md#hold-after)
                - [Metric](./problem.md#metric)
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
