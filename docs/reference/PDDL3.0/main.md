# PDDL 3.0
[return to homepage](../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new)

## Introduction
PDDL 3.0 introduced soft goals to planning. As planning has grown to handle larger more complex problem, the way we express goals has had to change. In previous editions a goal was unavoidable. It had to be met in order for a a plan to be considered valid.

With the introduction of preferences (soft goals), we are now able to express a desireable, but inconsequential goal. A goal which we would like to be satisfied but if it is not, then that is acceptable.

For each soft goal we express, we include a cost for not meeting it. This cost essentially indicates how the plan quality is affected when such goal is not met.

PDDL 3.0 also introduced constraints, a form of strong goal, which essentially can use the same keywords as used for preferences, but instead must be met for the plan to be considered valid.

This allows us to express things such as facts that must become true after another, or facts which must always be true. See the keywords included in the Constraints and Preferences sections below.

## Contents
- [Domain](./domain.md)
    - [Requirements](./domain.md#requirements)
    - [Constraints](./domain.md#constraints)
        - [always](./domain.md#always)
        - [sometime](./domain.md#sometime)
        - [within](./domain.md#within)
        - [at-most-once](./domain.md#at-most-once)
        - [sometime-after](./domain.md#sometime-after)
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

## Reference
- [PDDL - The Planning Domain Definition Language](http://www.cs.cmu.edu/~mmv/planning/readings/98aips-PDDL.pdf), [Ghallab, M. Howe, A. Knoblock, C. McDermott, D. Ram, A. Veloso, M. Weld, D. Wilkins, D.]
- [PDDL2.1: An Extension to PDDL for Expressing Temporal Planning Domains](https://jair.org/index.php/jair/article/view/10352/24759), [Fox, M. Long, D.]
- [PDDL2.2: The Language for the Classical Part of the 4th International Planning Competition](https://pdfs.semanticscholar.org/4b3c/0706d2673d817cc7c33e580858e65b134ba2.pdf) [Edelkamp, S. Hoffmann, J.]
- [Plan Constraints and Preferences in PDDL 3](http://www.cs.yale.edu/homes/dvm/papers/pddl-ipc5.pdf) [Gerevini, A. Long, D.]
- [BNF Description of PDDL 3.0](http://cs-www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf) [Gerevini, A. Long, D.]
- [PDDL Examples](https://github.com/yarox/pddl-examples)
- [OPTIC - Optimising Preferences and Time Dependent Costs](https://nms.kcl.ac.uk/planning/software/optic.html)