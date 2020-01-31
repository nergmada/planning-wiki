---
layout: default
#Check me
title: CP4TP
parent: Planners
#And Me
permalink: /ref/planners/cp4tp
#And me
nav_order: 25
---
# CP4TP: Classical Planning for Temporal Planning Portfolio

Page Contributors: {% git_author %}

{% planner_tag IPC2018 Satisfycing Temporal %}

Planner Quality: -

Year Published: 2018

Paper: {% paper_link CP4TP: A Classical Planning for Temporal Planning Portfolio planners/cp4tp 1 %} [ Furelos-Blanco, D. Jonsson, A. ]

Preceded By: -

CP4TP is a portfolio temporal planner that sequentially runs different temporal planning algorithms until a solution is found. All the constituent temporal planners rely on a compilation to classical planning. The complexity of the compilations increases as we advance in the queue, from exclusively solving sequential problems to solving problems requiring simultaneous events.

## Support

CP4TP has not been tested with eviscerator yet. CP4TP is designed for Temporal domains and so most likely does not support numeric planning, it probably supports classical (non-temporal numeric) planning. 

## Downloading and Compiling CP4TP

CP4TP planner source code can be downloaded from a [BitBucket Submission](https://bitbucket.org/ipc2018-temporal/team1/src/) submitted to IPC 2018. 