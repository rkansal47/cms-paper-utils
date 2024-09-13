#!/bin/zsh
# Script for copying over files from the master Gitlab repo to the overleaf repo 

repo=$1
overleafrepo="$repo-overleaf"
masterrepo="$repo-master"

(
    # Make sure there are no uncommitted changes in the Overleaf repo
    cd $overleafrepo

    if [[ -n $(git status -s) ]]; then
        echo "There are uncommitted changes in the repository."
        exit 1
    fi

    # Make sure local and overleaf are synced
    local_commit=$(git rev-parse HEAD)
    remote_commit=$(git rev-parse overleaf/master)

    if [[ $local_commit == $remote_commit ]]; then
        echo "The local branch is up-to-date with the remote branch."
    else
        echo "The local branch is not up-to-date with the remote branch."
        exit 1
    fi
)

rm -rf $overleafrepo/{figures,tables,main.tex,notation.tex,$repo.tex,$repo.bib}
cp -r $masterrepo/{figures,tables,main.tex,notation.tex,$repo.tex,$repo.bib} $overleafrepo/