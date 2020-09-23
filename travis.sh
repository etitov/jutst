#!/bin/bash
    diff=$(git diff --name-only 42f31f4c3db9728f7ca386225fe770ae93d23d76 HEAD | awk -F/ '{print $1, $2}' | sort -u -k 2 | grep task)
	echo $diff
    count=`echo $diff | wc -w`
    if [ "$count" == "0" ];
    then
      echo "Nothing to check"
      exit 1
    fi
    if [ $count != 2 ];
    then
      echo "Only single task is allowed"
      exit 1
    fi
    echo "Checking $task"
	slot=`echo $diff | cut -f1 -d' '`
	task=`echo $diff | cut -f2 -d' '`
	cd="cd $slot"
    cmd="cd ./$slot && ./gradlew :$task:clean :$task:check"
    echo $cmd 
	#$cmd
	#ls -l

