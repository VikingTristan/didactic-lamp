#!/usr/bin/env bash

set -o errexit # Abort if any command fails

branches=$(git branch -r --merged develop)
for branch in $branches
do
    [[ $branch != *"feature/"* ]] && continue
    
    # Remove prefixes from branchname
    branch=${branch#"origin/"}

    echo "::set-output name=BRANCH_TO_DELETE::$branch"
    echo "Deleting branch $branch"
    
    git push origin --delete "$branch"
done