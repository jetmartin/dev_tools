# Quizz

{:.quiz}
How do I clone the files on `~/dev/my_project` if `pwd` is `~/dev` ?

- \[x\] `git clone ssh://git@me.tld/my_project.git`
- \[ \] `git clone ssh://git@me.tld/my_project.git ./`
- \[ \] `git clone ssh://git@me.tld/repo.git dev/my_project`
- \[x\] `git clone ssh://git@me.tld/repo.git ./my_project`

{:.quiz}
How do I display the list of files impacted by last comit from a single user (not the diff) ?

- ( ) `git log -p --author=him -1`
- ( ) `git log --abbrev-commit --author=him -1`
- ( ) `git log -no-merges --author=him -1`
- ( ) `git show --author=him -1`
- (x) `git log --abbrev-commit --name-only --no-merges --author=him -1`

{:.quiz}
How can I check exactly what changes I'm about to commit prior to my commit ?

- (x) `git diff --word-diff`
- ( ) `git diff --name-status`
- ( ) `git commit -p`
- ( ) `git commit -a -p`

{:.quiz}
Wich syntax is valid to create an alias for squashing a branch as follow `git squash branch_to_squash_on_current "Commit message"` ?

- ( ) `git config --global alias.squash 'git merge $1 --squash && git commit -e && git branch -D $1'`
- ( ) `git config alias.squash 'git merge $1 --squash && git commit -m $2 && git checkout $1'`
- ( ) `git config --global alias.squash '!git merge $1 --squash && git commit -m $2'`
- (x) `git config alias.squash '!git merge $1 --squash && git commit -m $2 && git branch -D $1'`
- ( ) `git config --global alias.squash '!git merge $1 --squash && git branch -D $1'`
