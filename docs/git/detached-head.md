# Detached head

In git, commits always go on top of HEAD. In otherwords, they 'insert a new commit at HEAD'.
HEAD is, normally, a symbolic reference to [the top of] a branch. So when you checkout a brach, the HEAD change to be the latest commit of the current branch.
> So HEAD is not always the last commit of the master branch.

when you checkout anything that is not a proper, local, branch name, then HEAD is no longer a symbolic reference to anything.
Instead, it actually contains the SHA-1 hash (the commit id) of the commit you are switching to.
This is called a detached HEAD.
I such a case, `.git/HEAD` contain the actual (40-hex-digit) hash of the corresponding commit instead of some string like ref: refs/heads/branch.

Bellow commands are exemple of cases causing a detached HEAD.

```sh
git checkout master^        # parent of master
git checkout HEAD~2         # grandparent of current HEAD
git checkout origin/master  # a non-local branch
git checkout tagname        # since you cant commit to a tag!
```

A comon case causing that issue is checkout a remote branch without creating a local one :

```sh
git checkout origin/my-branch
# insteads of creating a local remote traking branch.
# git checkout -b my-branch origin/my-branch
```

You can fix the situation just creating a local branch as bellow :

```sh
git checkout -b my-branch
```

Now HEAD will refer to the latest commit of a local branch.
Beware, at that point the branch is not a remote traking branch, you have to add the remote tracking branch to the current branch.

```sh
# you can use several options such as -u, --set-upstream-to or --track
git branch -u origin/my-branch
```
