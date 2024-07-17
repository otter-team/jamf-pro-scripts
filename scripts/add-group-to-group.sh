#!/bin/bash

#### This adds a local group (group a) to a other local group (group b)
## Created: 2024-07-17
## Last Modified: 2024-07-17



#### Variables
## Note: Leave these empty if used in Jamf Pro Policy context
groupa=""
groupb=""

## Checks if $4 is not empty and groupa is not set manually, sets variable 

if [ "$4" != "" ] && [ "$groupa" == "" ]
then
    groupa=$4
fi

## Checks if $5 is not empty and groupb is not set manually, sets variable 

if [ "$5" != "" ] && [ "$groupb" == "" ]
then
    groupb=$5
fi

## Add group to the other group
dseditgroup -o edit -t group -a $groupa $groupb

## Check on Status
status=$?
if [ $status -eq 0 ]
then
    exit 0
else
    exit 1
fi
