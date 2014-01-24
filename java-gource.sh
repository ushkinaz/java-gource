#!/bin/bash
# Extracting java classes changelog from git - for using in gource visualisation.

if [ "$#" -lt "2" ]
then
        echo "Usage: $(basename $0) <commit1> <commit2>";
        exit 1
fi;


while read -r commit_line; do
	sh1=$(echo "$commit_line" | cut -d ';' -f1 -)
	timestamp=$(echo "$commit_line" | cut -d ';' -f2 -)
	author=$(echo "$commit_line" | cut -d ';' -f3 -)
	while read -r file_line; do
		file=$(echo $file_line | cut -c3- | sed -e 's/.*\/src\/main\/java\///' -e 's/.*\/src\/test\/java\///')

		changes=$(echo $file_line | cut -c1)
	    echo "$timestamp|$author|$changes|$file"
	done < <(git diff-tree --name-status -r --no-commit-id  $sh1 | grep '.java$')
done < <(git log --pretty="%H;%ct;%cN" --no-merges --diff-filter=AMD --reverse $1..$2)
