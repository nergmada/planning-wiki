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