#!/bin/zsh
# Script for initializing the Overleaf repo and a separate master repo synced with Gitlab
# Note that the Overleaf syncing has to be done separately (see README)
#
# Usage: ./init_repo.sh <repo> <repotype>
# Example: ./init_repo.sh HIG-23-012 notes

repo=$1
repotype=$2

# first clone and setup the overleaf repo
git clone --recursive https://gitlab.cern.ch/tdr/$repotype/$repo.git $repo || exit
cd $repo
git checkout -b feature/overleaf
python3 utils/general/standalone.py

# replace utils submodule with plain directory
mv utils temp_utils
git submodule deinit -f -- utils
rm -rf .git/modules/utils
git rm -f utils
mv temp_utils utils

# compile locally
latexmk

# ignore all the latexmk outputs
cat <<EOT >> .gitignore
main*
!main.tex
*.log
*.out
EOT

# push
git add .
git commit -am 'add main.tex and friends'
git push --set-upstream origin feature/overleaf

# finally clone the master repo again - this one will be synced with gitlab
cd ..
mv $repo $repo-overleaf
git clone https://gitlab.cern.ch/tdr/$repotype/$repo.git $repo-master
