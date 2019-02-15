# POPF: Partial Order Planning Forwards
[return to homepage](../../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)


Year Published: 2009

Paper: [Temporal Planning in Domains with Linear Processes](https://www.ijcai.org/Proceedings/09/Papers/279.pdf) [ Coles, A. J. Coles, A. I. Fox, M. Long, D.]

Preceded By: Crikey3

POPF is forwards-chaining temporal planner. Its name derives from the fact that it incorporates ideas from partial-order planning — during search, when applying an action to a state, it seeks to introduce only the ordering constraints needed to resolve threats, rather than insisting the new action occurs after all of those already in the plan. Its implementation is built on that for the planner COLIN, and it retains the ability to handle domains with linear continuous numeric effects.

## Support

POPF has several versions and this guide provides support tables for versions 1.1 and 2