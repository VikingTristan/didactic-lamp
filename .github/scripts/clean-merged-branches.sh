#!/usr/bin/env bash

# set -o errexit # Abort if any command fails

# Ensure that we have all branches
# git fetch --all
# git branch -r | grep -v '\->' | while read remote; do
#   branch_name="${remote#origin/}" 

#   if git show-ref --verify --quiet "refs/heads/$branch_name" ; then
#     echo "Branch '$branch_name' already exists."
#   else
#     echo "Adding '$branch_name' tracking '$remote'."
#     git branch --track "$branch_name" "$remote";
#   fi
# done

# git pull --ff-only --all

branches=$(git branch -r --merged develop)
for branch in $branches
do
    [[ $branch != *"feature/"* ]] && continue
    echo "::set-output name=BRANCH_TO_DELETE::$branch"
    echo "Deleting branch $branch"
    
    # git push origin --delete "$branch"
done