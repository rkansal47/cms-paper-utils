# CMS paper / notes utilities

Scripts for syncing CMS notes and papers


## init_repos.sh

To set-up a repo to be synced with Overleaf and a separate repo synced with Gitlab, following https://twiki.cern.ch/twiki/bin/viewauth/CMS/Internal/TdrOverleaf.

Make sure to first:

1. Create an Overleaf blank document
2. **Delete the `main.tex` file**
3. Copy the git url

Add a symlink to this in `/usr/local/bin/cms_init_repos.sh` and then use as 

```bash
mkdir note-HIG && cd note-HIG
cms_init_repos.sh HIG-23-012 notes <overleaf-git-url>
```

**If you have not saved your Overleaf git token previously the Overleaf syncing step will fail.**


## copy_files.sh

To update and copy over the necessary files from the Overleaf repo to the master Gitlab repo.
Add a symlink to this in `/usr/local/bin/cms_copy_files.sh` and then use as 

```bash
cms_copy_files.sh HIG-23-012
```


## copy_files_master.sh

To update and copy over the necessary files from the master Gitlab repo to the overleaf repo.
Add a symlink to this in `/usr/local/bin/cms_copy_files_master.sh` and then use as 

```bash
cms_copy_files_master.sh HIG-23-012
```
