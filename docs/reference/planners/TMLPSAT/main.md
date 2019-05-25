# TM-LPSAT: Continuous Time in a SAT based planner
[return to homepage](../../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

Year Published: 2004

Paper: [Continuous Time in a SAT-based Planner](https://www.aaai.org/Papers/AAAI/2004/AAAI04-085.pdf) [Shin, J-A. Davis, E.]

TM-LPSAT uses a LP solver (called Cassowary) and a DPLL SAT Solver (called RelSAT) it compiles PDDL+ domains into a set of LPSAT constraints. The process it does this by is to generate a plan by using the SAT solver in order to satisfy the goal predicates, and assuming that any and all numeric constraints can be made true. 

Once it finds a potential solution (by assuming a subset of numeric conditions are true) it then uses the LP solver to find a set of values that satisfies those numeric conditions. If no such set of values exists, then this set of numeric conditions are considered unsatisfiable together and are excluded from the search (i.e. the sat solver is no longer permitted to have all of these conditions marked as true together).

Once it finds a satisficing set of predicates and numeric values, it converts these back to a PDDL plan form. Note that to handle the temporal planning aspect of PDDL+ it uses real value timestamps which then form part of the linear program.