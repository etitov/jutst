#!/bin/bash
    diff=$(git diff --name-only bb42d6dcec3d36547bb3235674343a829f1facc0 HEAD | awk -F/ '{print $1, $2}' | sort -u -k 2 | grep task)
    count=`echo $diff | wc -w`
    if [ "$count" == "0" ];
    then
      echo "Nothing to check"
      exit 1
    fi
    if [ $count != 1 ];
    then
      echo "Only single task is allowed"
      exit 1
    fi
    echo "Checking $task"
	slot=$(echo $STR | cut -f1 -d-)
	task=$(echo $STR | cut -f2 -d-)
    cmd="cd $slot && ./gradlew :$task:clean :$task:check"
	echo $cmd
    #$cmd

