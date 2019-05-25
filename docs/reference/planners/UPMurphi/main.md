# UPMurphi: A Tool for Universal Planning on PDDL+ Problems
[return to homepage](../../../readme.md) | [Report a problem with this guide](https://github.com/nergmada/pddl-reference/issues/new/choose)

Year Published: 2009

Paper: [UPMurphi: A Tool for Universal Planning on PDDL+ Problems](https://pdfs.semanticscholar.org/5721/1105c867c070d81245fd9fa721f00ce3d0f4.pdf) [Penna, G.D. Magazzeni, D. Mercorio, F. Intrigila, B.]

UPMurphi is a planner designed to handle both the continous and discrete aspects of PDDL+ through a discretisation method. It begins by taking the continous representation of the domain and converting continuous actions (i.e. ones with continuous effects) and discretising them into a set of possible actions.

UPMurphi uses these discretised form of actions to conduct a state space search and a plan constructed from the discretisation is generated which is then checked against the original continous domain for validity. If the plan is not valid then the planner increases the granularity of the discretisation and conducts another search.

UPMurphi can also be used to build partial policies within the context of uncertainty planning. 

