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