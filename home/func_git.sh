#!/bin/bash

git-add()
{
	git add --all .
}

git-push()
{
	if [ -z $@ ] ; then
		echo "Commit message not given!"
	else
  	    git add --all .
		git commit -a -m "$@" 
		git push
	fi
}