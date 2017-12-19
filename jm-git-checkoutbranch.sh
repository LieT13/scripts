#!/bin/sh

# $1 branch to checkout

branch=$1
if [ -z $branch ]; then
	read -p "Enter branch name: " branch
	branch=${branch:-develop}
fi;
echo "Checking branch $branch"

for i in `ls -d */`; do
	echo "Moving to $i"
	cd $i
	git fetch
	git checkout $branch
	cd -
done;
