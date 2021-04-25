#!/bin/bash
# Script taken from:
# https://stackoverflow.com/questions/5894946/how-to-add-gits-branch-name-to-the-commit-message
# and modified for use with husky.
COMMIT_MSG_FILE=$1

if [ -z "$COMMIT_MSG_FILE" ]; then
    echo "Error getting message file with pre commit hook"
    exit 1;
fi

BRANCH_PATH=$(git symbolic-ref -q HEAD) #Something like refs/heads/myBranchName
BRANCH_NAME=${BRANCH_PATH##*/}      #Get text behind the last / of the branch path
firstLine=$(head -n1 $COMMIT_MSG_FILE)
if [ -z "$firstLine"  ] ;then #Check that this is not an amend by checking that the first line is empty
    sed -i "1s/^/($BRANCH_NAME): \n/" $COMMIT_MSG_FILE  #Insert branch name at the start of the commit message file
fi