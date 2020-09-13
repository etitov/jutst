#!/bin/bash
    diff=$(git diff --name-only 4fbee8fb7c20775550477609036b4eb0c431b500 HEAD | awk -F/ '{print $1, $2}' | sort -u -k 2 | grep task)
    count=`echo $diff | wc -l`
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
	slot=`echo $diff | cut -f1 -d' '`
	task=`echo $diff | cut -f2 -d' '`
	cd="cd $slot"
    cmd="./gradlew :$task:clean :$task:check"
	echo $cd
	echo $cmd
	cd $slot
    $cmd
	ls -l

