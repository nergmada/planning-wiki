# PDDL 2.1
## Introduction
PDDL 2.1 was the language of the 2002 AIPS Competition and built upon the syntax defined for [PDDL 1.2](../PDDL/main). In the 2002 Competition, planners were set the challenge of considering more complicated domains and problems which feature both temporal and numeric considerations (scheduling and resources). As a result, additions the language were necessary to facilitate modelling time and numbers.

This guide will only show features that have been changed or added to PDDL 1.2 in order to form 2.1

## Contents
- [Domain](./domain.md)
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