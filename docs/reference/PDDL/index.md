---
layout: default
title: PDDL
has_children: true
parent: Reference
permalink: /ref/pddl
nav_order: 0
---

# PDDL 1.2

Contributors: {% git_author %}

## Introduction

PDDL 1.2 {% cite pddl1998 %} formed the basis of the 1998 AIPS Competition. PDDL 1.2 is based largely on concepts set out for STRIPS, a sort of precursor languages which used a similar design pattern for describing problems through the use of predicates and actions.

Problems in PDDL are defined in two parts, a domain and a problem file. The following sections divide respectively, representing constituent parts of the domain and the problem.

## Domain And Problem File

### Domain

```cl
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
        ;(forall
        ;    (?s - site) (walls-built ?s)))
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

    (:axiom
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

### Problem File

```cl
(define
    (problem buildingahouse)
    (:domain construction)
    ;(:situation <situation_name>) ;deprecated
    (:objects
        s1 - site
        b - bricks
        w - windows
        c - cables
    )
    (:init
        (on-site b s1)
        (on-site c s1)
        (on-site w s1)
    )
    (:goal (and
            (walls-built ?s1)
            (cables-installed ?s1)
            (windows-fitted ?s1)
        )
    )
)
```

{% bibliography --cited %}