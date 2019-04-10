# A PDDL Reference Guide

[Go Straight To Contents](#contents) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

## Introduction

This reference and guide is here to provide easy access to resources related to the field of AI Planning. AI Planning is difficult to quantify under one roof, due to the variety of ongoing research in the field.

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

> Usage: <span style="color:green">High</span>, <span style="color:yellow">Medium</span>, <span style="color:orange">Low</span>, <span style="color:red">Rare</span>

For planners, this reference will aim to provide indication of what features are supported by what planners. It also provide useful hints and notes about the quirks and specific issues certain planners have in running certain problems.

## Contributions, Corrections and Feedback

[Contributions](./guide/contributing.md) are always welcome!

The best way to provide multiple contributions is to request collaborator access to this repository, either via emailing adam.green@kcl.ac.uk or by filing an issue on [this repo](https://github.com/nergmada/pddl-reference). You can fork this repository to your GitHub, make changes and file a pull request.

Alternatively, if you are not able to provide a contribution, but maybe think there is something this guide is missing or is incorrect, please add a new issue to [this repo](https://github.com/nergmada/pddl-reference), and a correction, or additional will be made based on priority. Please use the "[Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)" button available on most pages.

Finally, if you have a planner which you think should be included in this reference guide, please ask for collaborator access or fork the repository (if you're the creator of the planner), or create an issue (if you're a user) and we'll try to include it.

Any other issues/concerns should be sent to adam.green@kcl.ac.uk and I'll try to get back to you ASAP.

## Contents

This site breaks down into two major content sections
- the guide - Focuses on what planning is and using planning and planners to solve planning problems
- the reference - Provides a "handbook" to the language and the planners which solve the problems modelled in said language.

### Guide

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
- [Contributing](./guide/contributing.md)
- [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

### Reference
#### PDDL
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
    - [Domain](./reference/PDDL2.1/domain.md)
        - [Requirements](./reference/PDDL2.1/domain.md#requirements)
            - [List of PDDL 2.1 Requirements](./reference/PDDL2.1/domain.md#list-of-requirements)
        - [Numeric Fluents](./reference/PDDL2.1/domain.md#numeric-fluents)
        - [Durative Actions](./reference/PDDL2.1/domain.md#durative-actions)
            - [:parameters](./reference/PDDL2.1/domain.md#parameters)
            - [:duration](./reference/PDDL2.1/domain.md#duration)
            - [:condition](./reference/PDDL2.1/domain.md#condition)
            - [:effect](./reference/PDDL2.1/domain.md#effect)
    - [Problem](./reference/PDDL2.1/problem.md)
        - [Numeric Fluents](./reference/PDDL2.1/problem.md#numeric-fluents)
        - [Metric](./reference/PDDL2.1/problem.md#metric)
        - [Length (Deprecated)](./reference/PDDL2.1/problem.md#length)
- [PDDL 2.2](./reference/PDDL2.2/main.md)
    - [Domain](./reference/PDDL2.2/domain.md)
        - [Requirements](./reference/PDDL2.2/domain.md#requirements)
            - [List of PDDL 2.2 Requirements](./reference/PDDL2.2/domain.md#list-of-requirements)
        - [Derived Predicates](./reference/PDDL2.2/domain.md#derived-predicates)
    - [Problem](./reference/PDDL2.2/problem.md)
        - [Timed initial literals](./reference/PDDL2.2/problem.md#timed-initial-literals)
- [PDDL 3.0](./reference/PDDL3.0/main.md)
    - [Domain](./reference/PDDL3.0/domain.md)
        - [Requirements](./reference/PDDL3.0/domain.md#requirements)
        - [Constraints](./reference/PDDL3.0/domain.md#constraints)
            - [always](./reference/PDDL3.0/domain.md#always)
            - [sometime](./reference/PDDL3.0/domain.md#sometime)
            - [within](./reference/PDDL3.0/domain.md#within)
            - [at-most-once](./reference/PDDL3.0/domain.md#at-most-once)
            - [sometime-after](./reference/PDDL3.0/domain.md#sometime-after)
            - [sometime-before](./reference/PDDL3.0/domain.md#sometime-before)
            - [always-within](./reference/PDDL3.0/domain.md#always-within)
            - [hold-during](./reference/PDDL3.0/domain.md#hold-during)
            - [hold-after](./reference/PDDL3.0/domain.md#hold-after)
    - [Problem](./reference/PDDL3.0/problem.md)
        - [Preferences](./reference/PDDL3.0/problem.md#preferences)
            - [always](./reference/PDDL3.0/problem.md#always)
            - [sometime](./reference/PDDL3.0/problem.md#sometime)
            - [within](./reference/PDDL3.0/problem.md#within)
            - [at-most-once](./reference/PDDL3.0/problem.md#at-most-once)
            - [sometime-after](./reference/PDDL3.0/problem.md#sometime-after)
            - [sometime-before](./reference/PDDL3.0/problem.md#sometime-before)
            - [always-within](./reference/PDDL3.0/problem.md#always-within)
            - [hold-during](./reference/PDDL3.0/problem.md#hold-during)
            - [hold-after](./reference/PDDL3.0/problem.md#hold-after)
        - [Metric](./reference/PDDL3.0/problem.md#metric)
- [PDDL+](./reference/PDDL+/main.md)
    - [Domain](./reference/PDDL+/domain.md)
        - [Requirements](./reference/PDDL+/domain.md#requirements)
        - [Processes](./reference/PDDL+/domain.md#processes)
        - [Events](./reference/PDDL+/domain.md#events)
- Other PDDL Flavours & Syntaxing
#### Planners
- A-Z of Planners
- All tags
    - Classical Planners
    - Temporal Planners
    - Probabilistic Planners
- How to submit a planner to this guide

<!-- 
- [OPTIC](./reference/planners/OPTIC/main.md)
- [POPF](./reference/planners/POPF/main.md)
- [ENHSP](./reference/planners/ENHSP/main.md)
- [Dino](./reference/planners/DiNo/main.md)
- [SMTPlan+](./reference/planners/SMTPlan/main.md)
- [MetricFF](./reference/planners/MetricFF/main.md)
- [COLIN](./reference/planners/COLIN/main.md)
- [PaaS - Planning as a Service](http://solver.planning.domains/)
- LPRPG-P
- UPMurphi
-->
### Examples (Coming Soon)
### FAQ

## Additional Resources
Below you can find a collection of resources for writing, learning and using PDDL and planning. For more information on what these tools and resources are and how they can help, please visit the [additional resources](./guide/additionalresources.md) page.

- [Planning.Domains](http://planning.domains/)
- Planner Tools
    - [VAL - The Plan Validator](https://nms.kcl.ac.uk/planning/software/val.html)
    - [ROSPlan - Planning in ROS](https://github.com/KCL-Planning/ROSPlan/)
    - [Eviscerator - The Planner tester](https://www.github.com/nergmada/eviscerator)
- PDDL Tools
    - [Visual Studio Code](https://code.visualstudio.com/)
        - [PDDL Plugin for VSCode](https://marketplace.visualstudio.com/items?itemName=jan-dolejsi.pddl)
    - [Sublime Text Editor](https://www.sublimetext.com/)
        - [MyPDDL Plugin for Sublime](https://packagecontrol.io/packages/myPDDL)
    - [Atom Text Editor](https://atom.io/)
        - [MyPDDL Plugin for Atom](https://atom.io/packages/mypddl)
    - [Planning.Domains PDDL Editor](http://editor.planning.domains/)
- Learning Resources
    - [Learn PDDL by Fares K. Alaboud](https://fareskalaboud.github.io/LearnPDDL/)
    - [Introduction to AI Planning. Part I. (video)](https://www.youtube.com/watch?v=EeQcCs9SnhU)
    - [Introduction to AI Planning. Part II. (video)](https://www.youtube.com/watch?v=FS95UjrICy0)
- Publicly Available PDDL Domains
    - [IPC PDDL Domains](https://github.com/potassco/pddl-instances)

## References

- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)
- [PDDL+: Modelling Continuous Time Dependent Effects](https://pdfs.semanticscholar.org/d391/59cb5dfcc21aafd3049002d854ec341037a7.pdf) [Fox, M. Long, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [Plan Constraints and Preferences in PDDL 3](http://www.cs.yale.edu/homes/dvm/papers/pddl-ipc5.pdf) [Gerevini, A. Long, D.]
- [BNF Description of PDDL 3.0](http://cs-www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf) [Gerevini, A. Long, D.]
- [Temporal Planning with Preferences and Time-Dependent Continuous Costs](https://www.aaai.org/ocs/index.php/ICAPS/ICAPS12/paper/view/4699/4708) [Benton, J. Coles, A. Coles, A.]
- [Temporal Planning in Domains with Linear Processes](https://www.ijcai.org/Proceedings/09/Papers/279.pdf) [ Coles, A. J. Coles, A. I. Fox, M. Long, D.]
- [Heuristic Planning for PDDL+ Domains](https://www.ijcai.org/Proceedings/16/Papers/455.pdf) [Piotrowski, W. Fox, M. Long, D. Magazzeni, D. Mercorio, F.]
- [Interval-Based Relaxation for General Numeric Planning](https://pdfs.semanticscholar.org/ba88/832bb0d1feddd7032282f3a2837f93a7117e.pdf) [Scala, E. Haslum, P. Thiebaux, S. Ramirez, M.]
- [The MetricFF Planning System: Translating "Ignoring Delete Lists" to Numeric State Variables](https://jair.org/index.php/jair/article/view/10360/24783) [Hoffmann, J.]
- [Forward-Chaining Partial-Order Planning](https://www.aaai.org/ocs/index.php/ICAPS/ICAPS10/paper/view/1421/1527) [ Coles,A. J. Coles, A. I. Fox, M. Long, D.]
- [A Compilation of the Full PDDL+ Language into SMT](https://www.aaai.org/ocs/index.php/ICAPS/ICAPS16/paper/view/13101/12664) [Cashmore, M. Fox, M. Long, D. Magazzeni, D.]
