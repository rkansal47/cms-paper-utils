#!/bin/zsh
# Script for copying over files from the Overleaf repo to the master Gitlab repo 

repo=$1
overleafrepo="$repo-overleaf"
masterrepo="$repo-master"

(
    cd $overleafrepo
    git fetch overleaf
    git pull
)

rm -rf $masterrepo/{figures,tables,main.tex,notation.tex,$repo.tex,$repo.bib}
cp -r $overleafrepo/{figures,tables,main.tex,notation.tex,$repo.tex,$repo.bib} $masterrepo/