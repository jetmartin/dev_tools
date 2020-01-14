# Diff & patch

> Prior to any commit you should have to run the *diff* command to ensure of what your are about to commit.

It allow you to ensure your commits are clean (no white lines, ...) otherwise you could generate complex merges or dirty code you can easily avoid.

> A diff of the remote repository can help you to avoid merges issues or manage when you will need time to manage a complex merge.

By default the command diff the current HEAD (latest commit of the current branch) and the current workspace (filesystem).

By default git diff and merge lines by lines. The *word-diff* allow you to diff within each single lines.

> The *--word-diff* option can really help you in case of complexe merges or looking for a code issue in complex functions.

```sh
# Diff all workspace
git diff
# Diff specific files
git diff -- README.md
# Diff a local branch and a remote branch.
# You may need to 'git fetch' first.
git diff master origin/master
# Diff a a file from a local branch vs a remote branch.
git diff master origin/master -- README.md
# Word diff instead of default line diff
git diff --word-diff
# Diff with staged (synonym of --staged).
git diff --cached
# Generate patch
git diff --patch
# Generate the patch and create the *.patch file.
git diff --patch > mypatch.patch
# Display files and type of modification
git diff --name-status
# Ignore spaces/blank lines
# -b | --ignore-space-change
git diff -b
# -w | --ignore-all-space
git diff -w
# --ignore-blank-lines
git diff --ignore-blank-lines
```

Diff from one commit to another from the basic to the most complex.

```sh
git diff <commit> <commit>
# This is to view the changes between two arbitrary <commit>.

git diff <commit>..<commit>
# This is synonymous to the previous form. If <commit> on one side is omitted, it will have the same effect as using HEAD instead.

git diff <commit>...<commit>
# This form is to view the changes on the branch containing and up to the second <commit>, starting at a common ancestor of both <commit>.
# "git diff A...B" is equivalent to "git diff $(git merge-base A B) B".
# You can omit any one of <commit>, which has the same effect as using HEAD instead.
```

How to apply a patch :

```sh
# Do not apply patch, test if applicable.
git apply --check mypatch.patch
# Apply patch
git apply mypatch.patch
# Apply the patch in reverse
git apply --reverse mypatch.patch
# When the patch does not apply cleanly, fall back on 3-way merge.
git apply -3 mypatch.patch
# For atomicity, git apply by default fails the whole patch and does not touch the working tree when some of the hunks do not apply.
# This option makes it apply the parts of the patch that are applicable, and leave the rejected hunks in corresponding *.rej files.
git apply --reject mypatch.patch
# Excludes files matching the patern.
git apply --exclude=*.md mypatch.patch
# only aply on files matching the patern.
git apply --include=*.md mypatch.patch
# ignore changes in whitespace in context lines if necessary
git apply --ignore-space-change mypatch.patch
git apply --ignore-whitespace mypatch.patch
```

Exemple of adance used such as Unix mailbox format.

```sh
# To produce patch for several commits, you should use format-patch git command.
git format-patch -k --stdout R1..R2
#This will export your commits into patch file in mailbox format.
#To generate patch for the last commit
git format-patch -k --stdout HEAD^
# git am - Apply a series of patches from a mailbox
git am -3 -k mypatch.patch
```
