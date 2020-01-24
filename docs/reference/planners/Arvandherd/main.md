---
layout: default
title: Arvandherd
parent: Planners
permalink: /ref/planners/arvandherd
nav_order: 5
---
# Arvandherd Planner

Page Contributors: {% git_author %}

tags: [IPC2011](/ref/planners/tags/ipc2011), [Satisfycing](/ref/planners/tags/satisfycing)

Planner Quality: [30 out of 100](/ref/planners/rating)

Year Published: 2011

Paper: [ArvandHerd: Parallel Planning with Portfolios](https://webdocs.cs.ualberta.ca/~mmueller/ps/2011/2011-arvandherd-IPC-booklet.pdf) [ Nakhost, H. Muller, M. Valenzano, R. Schaeffer, J. Sturtevant, N. ]

Preceded By: Fast Downward

ArvandHerd is a satisficing parallel planner that has been entered in the 2011 International Planning Competition (IPC 2011). It uses a portfolio-based approach where the portfolio contains four configurations of the Arvand planner and one configuration of the LAMA planner. Each processor runs a single planner, and the execution is mostly independent from the other processors so as to minimize overhead due to communication. ArvandHerd also uses the Aras plan-improvement system to improve plan quality

## Support

Arvandherd has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. Arvandherd appears to be targeted to solving classical planning problems, so likely does not support any temporal or numeric features in PDDL.

## Downloading and Compiling Arvandherd

No Source code could be located for Arvandherd
