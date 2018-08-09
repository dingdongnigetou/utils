#!/bin/bash

# cd $target_path & do follow that will make all 'missing' file into 'deleted'
svn st | grep ^! | awk '{print " --force "$2}' | xargs svn rm
