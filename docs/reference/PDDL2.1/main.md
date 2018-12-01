# PDDL 2.1
[return to homepage](../../readme.md)
## Introduction
PDDL 2.1 was the language of the 2002 AIPS Competition and built upon the syntax defined for [PDDL 1.2](../PDDL/main). In the 2002 Competition, planners were set the challenge of considering more complicated domains and problems which feature both temporal and numeric considerations (scheduling and resources). As a result, additions the language were necessary to facilitate modelling time and numbers.

This guide will only show features that have been changed or added to PDDL 1.2 in order to form 2.1

## Contents
- [Domain](./domain.md)
    - [Requirements](./domain.md#requirements)
        - [List of PDDL 2.1 Requirements](./domain.md#list-of-requirements)
    - [Numeric Fluents](./domain.md#numeric-fluents)
    - [Durative Actions](./domain.md#durative-actions)
        - [:parameters](./domain.md#parameters)
        - [:duration](./domain.md#duration)
        - [:condition](./domain.md#condition)
        - [:effect](./domain.md#effect)
- [Problem](./problem.md)
    - [Numeric Fluents](./problem.md#numeric-fluents)
    - [Metric](./problem.md#metric)
    - [Length (Deprecated)](./problem.md#length)