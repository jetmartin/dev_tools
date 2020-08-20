# Git branches

The branches are like parallel developpement steams.
They allow you to manage at the same time several releases of the same application (ex : V1.x and V2.x).
So you can manage bug fix on the current release without impacts on the next release developpement.

But Git and branches also allow you to simplify large scale projects workstream.
First of all Git is decentralised, that means that each tema member work on his local repository. So that avoid conflicts on every single commit.
But you will face the conflict issues on the `push` action.

To completely avoid that issue you can uses several *git flow* or simply *methodologies* using branches.
In such a case, each single modification (aka feature) will be done in a branch (aka feature branch) by a single developper.
Then, when it's all good, you will merge that branch on the main branch (could be Master, Dev, Release, ... regarding to your methodologie).

Morehover, you, as a developper, can merge you update in several branches. A bugFix can be merge on all the branches (current release and next release as an exemple).

There are two kind of branches the *remote tracking branches* and the *local branches*.

The remote traking branches are "linked" to a remote repository. so you can interract with this repository (pull/push). That means that the git history is common between these two repositories, so if you'r having fine commit granularity and frequent synchronisation, most of the time Git will manage on his own the merges like a magician.

The local branches have no linked to any other repository. In other words they are unsecure because they leave only on your computer. If you made any kind ob bad manipulation or if you loose you computer, you loose your work.
They are used mostly for managing local actions in two uses cases :

* Manage complex merges
* Local branches developpement flow. (See bellow)[#Branches-and-local-dev-branches]

> Avoid local branches if you do not knew why you are doing it.
And remeber they must have a short life time because they are unsecure as they have any kind of backup out of your local environnement.

## Display branches informations

To get branches status

```sh
# List all local branches
git branch
# Display all local branches, remote status and last commit.
git branch -v
# Display all local branches, remote status, remote informations and last commit.
git branch -vv
# Display all local & remotes branches, remote status, remote informations and last commit.
git branch -av
```

Display informations about branches and commits history on all local branches at once

```sh
git show-branch
```

## Main Branches interractions

You can create a branch from the latest commit (*HEAD*) of the *master* branch.
(Remember, by convention, the default branch is named *master* and default remote repository *origin*)

But you also can create a branch from any branches head, commit or tag.

When you've create a branch, you chave to `checkout` the sources to be able to work on it. (in other word, replace your current workspace filesystem by a new one, the one on the branch to *checkout*)

```sh
# Create a branch from Current branch HEAD
git branch branchname
git branch branchname HEAD
#Create a branch
git branch branchname HEAD~3
git branch branchname <sha1-of-commit>
# Create and checkout a branch
git checkout -b branchname
# Create a copy of a branch and checkaout the copy at once.
git checkout -b new_branch old_branch
```

If you will to checkout (and track) a remote branch

```sh
git checkout --track origin/branchname
```

The most common way to checkout and track a remot branch is the following one
> Remeber, try to use the same branch name on local and remote repositories as much as possible.

```sh
#git checkout -b <branch name> <name of remote>/<branch name>
git checkout -b my-feature origin/my-feature
```

Push a local branch to remote repository

```sh
git push -u origin branchname
```

Change or add a tracking branch to the current branch

```sh
git branch -u origin/branchname
```

Beware that Git allow you to use the branch name you want on your local repository.
Git alsso allow you to have sevral remote repositories so your branch can be linked to one or many.
In a basic use case you do not need to take care of such a complexity.

Remeber that git will modify your file system when you checkout a branch.
If some files are not knew to Git (edited files not commited by exemple), you will not be abble to change the current branch.
In such a case, you have to [reset](#reset) your respository (erase your changes), [commit](#commit) your changes (save your modifications) or [stash](#stash) your modification (save them for later without commit).

> Remeber that any modifications not commited and pushed to your remote repository are "at risk" of any bad manipulation.

## Merges

A Merge is the fact to integrate the work you've made in one branch into another.
Git manage the merge taking care of file modifications and when there are conflicts, try to fix them for you.
A conflict is, as an exemple, when the same line of code in a file has been edited on the two branches, whe need to define wich update we want to keep.

Most of the cases Git will be able to manage the conflics for you. when he can't you will have to fix them on your hown.

After a merge you have to make a *merge commit* to "save" the modification.
By default the `merge`command will manage the `merge commit` if there is no conflict to resolve.

> Think to remove useless branches from you local and remote repository after a merge !

There are many merge strategy in Git ([See Git doc](https://git-scm.com/docs/git-merge#_merge_strategies)).
The common use case is to merge a *feature$ or *dev* branch in your *relese* or *master* branch.
So it's a ont to one branch. For information, Git can merge sevral branches at once.
On that commone usecases, the default merge strategy if most of the time the most efficient.

If you'r not using a commit tool or an IDE here is how to manage conflict by hand.
In case of conflicts here is how to read the "conflict" on the file.
In between `\<\<\<\<\<\<\<` and `=======` You will find your updates.
In between `=======` and `\>\>\>\>\>\>\>` the original txt.

```sh
Here are lines that are either unchanged from the common
ancestor, or cleanly resolved because only one side changed.
\<\<\<\<\<\<\< yours:sample.txt
Conflict resolution is hard;
=======
Git makes conflict resolution easy.
\>\>\>\>\>\>\> theirs:sample.txt
And here is another line that is cleanly resolved or unmodified.
```

Just remove useless text to keep waht you want to persisit. and then make your mege commit (it's performed as an usual commit.)

As looking hover the whole project files would be a nightmare, some commands, using Git to see the conflicts.

* Look at the diffs. `git diff` will show a three-way diff, highlighting changes from both the `HEAD` and `MERGE_HEAD` versions.
* Look at the diffs from each branch. `git log --merge -p <path>` will show diffs first for the `HEAD` version and then the `MERGE_HEAD` version.
* Look at the originals. `git show :1:filename` shows the common ancestor, `git show :2:filename` shows the `HEAD` version, and `git show :3:filename` shows the `MERGE_HEAD` version.

Bellow some commands and tips.

```sh
# Checkout the branch where you want to incorporate the modifications.
git checkout master
# Merge a branch on the current branch (master).
git merge my-feature-branch
# Merge without commit
git merge --no-commit my-feature-branch
```

Another commmand con generate a merge, the `pull` command.
Effectively, if anoter person has pushed code to the origin, when you will pull the branch, a merge will be managed by GIT.
Thats why before any `push`, prefer to alwais make a `pull` to manage the merge if needed (otherwise, git will ask you to do so)

### advance merge strategy/options

> In case you'r having lots of conflicts and you'r sure how to manage them you can use advance merge strategy/options.

Advance merge to avoid conflicts if you want to force your mofificaton to apply in case of conflict.
Beware that there are two close way to do so and they are frequently misunerstand.
We try to explain them in a simple way bellow.
By default, prefer the fist option dellow.

*Recursive merge strategy with `ours` option* :
This option forces conflicting hunks to be auto-resolved cleanly by favoring our version.
Changes from the other tree that do not conflict with our side are reflected to the merge result.
For a binary file, the entire contents are taken from our side.

```sh
git merge -s recursive -Xours my-feature-branch
```

*Ours merge strategy* :
This resolves any number of heads, but the resulting tree of the merge is always that of the current branch head, effectively ignoring all changes from all other branches.
It is meant to be used to supersede old development history of side branches. Note that this is different from the -Xours option to the recursive merge strategy.

```sh
git merge -s ours my-feature-branch
```

> Alway prefer the recussive merge strategy (with options) otherwise you'r managing advance stuff...

### Manage conflicts in a nutshell

Identify the files who have a merge issue

```sh
git status
```

Search for `Unmerged paths` where are your conflicts

```sh
Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   README.md
```

In this case the `README.md` file.

Within the file you will identify conflicts as on bellow example

```sh
\<\<\<\<\<\<\< HEAD
Some text
\=\=\=\=\=\=\=
Some other text
\>\>\>\>\>\>\> branch-a
```

To fix them more easily run bellow comand to see a diff or word diff.

```sh
git diff HEAD MERGE_HEAD README.md
# or
git diff --word-diff HEAD MERGE_HEAD README.md
```

Manage the merge byr editing the file to remove the conflict syntax from the file and keep expected text.
Commit the updated file to resolve the conflict.

```sh
git commit . -m "Resolved merge conflict by ..." # describe your action here
# If you have no specific information to share about conflict resolution
# you clould not provide the message, recent Git release will populate the merge message itself.
git commit .
```

If you are facing issues to make your merge commit try bellow commands regarding to your context.
In most cases, the first one is what your are expecting to do.

* Commit [all}](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt--a) `git commit -a`
* Commit [include](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt--i) `git commit -i`

## Branches and local dev branches

When you work in a team, you can be several developpers working at the same time on the same branch.
In such a situation, when you wahnt to push your modifications to the remote repository some conflicts can happends.
But it's never a pleasant fact to have to manage a conflict when you want to push, enven more when ther is some presure on the team.

To avoid such a situation, it's a good practive to work on a local copy of the tracking branch.
So, you can manage the pull of the tracking branch when you have time to manage it.
Merge the tracking branch on you local branch when you have time to manage the merge.

There is not one single convention for personal dev branches, it could be suffix or prefix such as `dev-...`, `my-...`, `local-...`.
I would recomand a scementic name such as `dev` or `local` (wich can easely be protected from push on the origin repository).
Prefix or suffix, it's up to you (suffix allow alphabetical sort and autocomplete with the two branches close to eachoter).

```sh
# Clone remote branch
git checkout --track origin/feature-something
# create a local copy
git checkout -b feature-something-dev feature-something
# Do something here ...
# Frequently pull origin to see if you whill have to manage a merge.
git pull origin feature-something
# When you'r done or have time to manage it ou can merge on your local branch.
git merge feature-something
# manage the merges.
# send back to the tracking branch
git checkout feature-something
git merge --squash feature-something-dev
# commit your changes
Git commit -m "My changes"
# Share your modifications
git push origin feature-something
```
