# PDDL 1.2 Examples
[return to homepage](../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

**The following section is under construction**

PDDL 1.2 is the first incarnation of the Planning Domain Definition Language (PDDL). In this section you can find examples of PDDL 1.2 including links to live examples on [Planning.Domains](http://planning.domains/). These live examples are provided as examples only and are not intended for real world application.

## Contents


## Example from the Guide

**Why not try this domain out live on [Planning.Domains](http://editor.planning.domains/#read_session=1Vsy4k7Qgk)**

The domain below provides an example construction planning problem. In the problem we are building simple buildings on each site. Each building consists of foundations, walls, cables and windows and once all of these parts have been complete we can consider the site to be built.

The following is omitted from this domain compared to the reference guide

- Timeless Predicates - Unsupported by our live PDDL tool (and most planners)
- Axioms - Unsupported 
- Expansions - Unsupported
- Safety - Unsupported
- Extends - Hard to show, not included
- Domain Variables - Unsupported

[Raw Domain](./domain.pddl)

```LISP
(define
    (domain construction)
    ;requirements
    (:requirements :strips :typing)
    ;types
    (:types
        site material - object
        bricks cables windows - material
    )
    ;constants
    (:constants mainsite - site)
    ;predicates
    (:predicates
        (walls-built ?s - site)
        (windows-fitted ?s - site)
        (foundations-set ?s - site)
        (cables-installed ?s - site)
        (site-built ?s - site)
        (on-site ?m - material ?s - site)
        (material-used ?m - material)
    )
    ;Actions
    (:action LAY-FOUNDATIONS
        :parameters (?s - site)
        :precondition (and
            (not (foundations-set ?s))
        )
        :effect (and
            (foundations-set ?s)
        )
    )

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

    (:action FIT-WINDOWS
        :parameters (?s - site ?w - windows)
        :precondition (and
            (on-site ?w ?s)
            (walls-built ?s)
            (not (windows-fitted ?s))
            (not (material-used ?w))
        )
        :effect (and
            (windows-fitted ?s)
            (material-used ?w)
        )
    )

    (:action INSTALL-ELECTRICALS
        :parameters (?s - site ?c - cables)
        :precondition (and
            (on-site ?c ?s)
            (walls-built ?s)
            (windows-fitted ?s)
            (not (cables-installed ?s))
            (not (material-used ?c))
        )
        :effect (and
            (cables-installed ?s)
            (material-used ?c)
        )
    )

    (:action MOVE-MATERIALS
        :parameters (?from - site ?to - site ?m - material)
        :precondition (and
            (on-site ?m ?from)
        )
        :effect (and
            (not (on-site ?m ?from))
            (on-site ?m ?to)
        )
    )

    (:action SIGN-OFF-SITE
        :parameters (?s - site)
        :precondition (and
            (walls-built ?s)
            (windows-fitted ?s)
            (cables-installed ?s)
        )
        :effect (and
            (site-built ?s)
        ) 
    )
)
```

Below we can see an example construction problem file which complements the above domain. The problem file defines the specifics of our problem. In the file below we have a single site, upon which we wish to complete a build.

```LISP
(define
    (problem buildingahouse)
    (:domain construction)
    (:objects 
        s1 - site 
        b - bricks 
        w - windows 
        c - cables
    )
    (:init
        (on-site b mainsite)
        (on-site c mainsite)
        (on-site w mainsite)
    )
    (:goal (and
            (site-built s1)
        )
    )
)
```