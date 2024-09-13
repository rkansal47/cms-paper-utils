# CMS paper / notes utilities

Scripts for syncing CMS notes and papers


## init_repos.sh

To set-up a repo to be synced with Overleaf and a separate repo synced with Gitlab, following https://twiki.cern.ch/twiki/bin/viewauth/CMS/Internal/TdrOverleaf.
Add a symlink to this in `/usr/local/bin/cms_init_repos.sh` and then use as 

```bash
mkdir note-HIG && cd note-HIG
cms_init_repos.sh HIG-23-012 notes
```

## Overleaf synchronization

Unfortunately, it is not easy to automate this step anymore with Overleaf now requiring authentication tokens. 
Instead, first:

1. Create an Overleaf blank document
2. Delete the `main.tex` file
3. Copy the git url

Then, enter these commands manually:

```bash
git remote add overleaf $overleafgiturl
git fetch overleaf
git checkout -b overleaf_master overleaf/master
git merge --allow-unrelated-histories feature/overleaf -X ours
git push overleaf HEAD:master
```

## copy_files.sh

To update and copy over the necessary files from the Overleaf repo to the master Gitlab repo.
Add a symlink to this in `/usr/local/bin/cms_copy_files.sh` and then use as 

```bash
cms_copy_files.sh HIG-23-012
```
