# Git hooks

Hooks are programs you can place in a hooks directory to trigger actions at certain points in git’s execution.
Hooks that don’t have the executable bit set are ignored.

By default the hooks directory is `$GIT_DIR/hooks` but thaht can be changed via the core.hooksPath configuration variable (`git config core.hooksPath`).

Hooks can get their arguments via the environment, command-line arguments, and stdin. See the documentation for each hook below for details.
`git init` may copy hooks to the new repository, depending on its configuration. See the [templates](#Git-template) for details.

Usualy for almost each git action you have a `pre`, `post` and sometime `prepare` hook.

A sample hook usecases :

**pre-push** : This hook is called by Git `push` and can be used to prevent a push from taking place. The hook is called with two parameters which provide the name and location of the destination remote.

Th aim is to add a prompt if you gonna push on *master* branch.

Crate a hook file.

```sh
mkdir ./hooks
touch ./hooks/pre-push
```

Copy bellow script on the file.

```sh
#!/usr/bin/env bash
protected_branch='master'
current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ $protected_branch = $current_branch ]
  then
    read -p "You're about to push to master. [y|n] > " -n 2 -r < /dev/tty
    echo
        if echo $REPLY | grep -E '^[Yy]$' > /dev/null
        then
            exit 0 # carry on
        fi
        exit 1 # exit
else
    exit 0
fi
```

Anoter example is to prevent for any "WIP" (Work in Progress) commit message.

```sh
#!/usr/bin/env bash

# An example hook script to verify what is about to be pushed.  Called by "git
# push" after it has checked the remote status, but before anything has been
# pushed.  If this script exits with a non-zero status nothing will be pushed.
#
# This hook is called with the following parameters:
#
# $1 -- Name of the remote to which the push is being done
# $2 -- URL to which the push is being done
#
# If pushing without using a named remote those arguments will be equal.
#
# Information about the commits which are being pushed is supplied as lines to
# the standard input in the form:
#
#   <local ref> <local sha1> <remote ref> <remote sha1>
#
# This sample shows how to prevent push of commits where the log message starts
# with "WIP" (work in progress).

remote="$1"
url="$2"

z40=0000000000000000000000000000000000000000

while read local_ref local_sha remote_ref remote_sha
do
  if [ "$local_sha" = $z40 ]
  then
    # Handle delete
    :
  else
    if [ "$remote_sha" = $z40 ]
    then
      # New branch, examine all commits
      range="$local_sha"
    else
      # Update to existing branch, examine new commits
      range="$remote_sha..$local_sha"
    fi

    # Check for WIP commit
    commit=`git rev-list -n 1 --grep '^WIP' "$range"`
    if [ -n "$commit" ]
    then
      echo >&2 "Found WIP commit in $local_ref, not pushing"
      exit 1
    fi
  fi
done

exit 0
```

Those are basic usecase.
In facts, it's more used in such usecases :

- Force some code quality validation before such as checkstyle or so before any push action.
- Validate commit messages are valid regarding to internal conventions
- Validate tag format are complient to project rules
- etc.

> As hooks depend of the current repository, do not used them only on the local repository only.
It's a common practice to duplicate them on local dev environnement as well as on remote repository or to used `pre` hooks on remote only.

As an exemple :

- A pre-push hook validate code on local repository.
- A pre-received hook has to do the same validation on the remote repository in case on of the dev team member do not installed or bypassed the hooks on his local environnement.
