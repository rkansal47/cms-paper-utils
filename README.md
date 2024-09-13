# CMS paper / notes utilities

Scripts for syncing CMS notes and papers


## init_repos.sh

To set-up a repo to be synced with Overleaf and a separate repo synced with Gitlab, following https://twiki.cern.ch/twiki/bin/viewauth/CMS/Internal/TdrOverleaf.
Add a symlink to this in `/usr/local/bin/cms_init_repos.sh` and then use as 

```bash
cms_init_repos.sh HIG-23-012 notes <overleaf-repo-hash>
```

**TODO: check if merge conflicts are resolved with `-X ours`**

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