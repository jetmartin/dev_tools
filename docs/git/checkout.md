# Checkout

Git checkout allow you to modify your local filesystem by files knew to git.
The main usecase is to switch from one branch to another.

But this also allow you to get a signle file from Git.

```sh
# Checkout a branch, tag or commit
git checkout my-branch
git checkout my-tag
git checkout HEAD
git checkout d926579
# Checkout a single file
git checkout README.md
# Checkout an older version of a single file.
git checkout master~2 README.md
# IF branch and file have the same name the branch is the defautl behavior. to checkout the file :
git checkout -- my-branch
```

In case of conflicts you can use sevral strategy (reset, stash, ...) or simply ask git to precede to a merge on checkout.
See [git documentation](https://git-scm.com/docs/git-checkout#git-checkout---conflictltstylegt) for advanced merge options.

```sh
# In case of conflict, allow git to try an automated merge
git checkout -m my-branch
```

You can checkout a remote tracking branch in one line, using the same parameters (checkout an older commit, ...).

```sh
#git checkout -b <branch name> <name of remote>/<branch name>
git checkout -b my-feature origin/my-feature
```
