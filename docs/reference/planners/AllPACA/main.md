---
layout: default
title: AllPACA
parent: Planners
permalink: /ref/planners/allpaca
nav_order: 5
---
# The AllPACA Planner: All Planners Automatic Choice Algorithm

Page Contributors: {% git_author %}

tags: [IPC2014](/ref/planners/tags/ipc2014), Optimal

Planner Quality: [31.2 out of 100](/ref/planners/rating)

Year Published: 2014

Paper: Not found, please see the [IPC 2014 booklet](https://helios.hud.ac.uk/scommv/IPC-14/repository/booklet2014.pdf) for details on AllPACA

Preceded By: Fast Downward

The AllPACA planner is a portfolio planner, which automatically chooses which of several planners to run for the planning task that it is given. AllPACA is based on machine learning techniques, which attempt to choose the planner that will result in the fastest solution time, based on the features of the planning task. In the sequential optimal track, AllPACA was pre-trained on all planning tasks the sequential optimal track
in all previous editions of the International Planning Competition. 

For the learning track, AllPACA can also learn to predict planner performance on tasks from each domain during the training phase, and can additionally exploit domainspecific features.

## Support

AllPACA has not been tested with eviscerator as we could not find source code for the planner, or we couldn't get the source code to compile. Fast Downward forms the base planner of AllPACA, please refer to the Fast Downward page for an idea of the supported features in this planner

## Downloading and Compiling AllPACA

No Source code could be located for AllPACA