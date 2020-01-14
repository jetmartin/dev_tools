# Reset clean & stash

## reset

If you've made some local test and you want to remove them all you can *reset* the workspace to the last commit.

```sh
git reset --hard
```

If you want your workspace to bas in a previous state, you can reset to an old commit.
Bewaure if you want to just look like it was without lose your latest modifications use *--soft* so you keep your local history after that commit.
If you use *--hard*, the history after that point will be erased locally.

```sh
git reset --soft c14809fa
```

## Clean

Git Clean will remove from you workspace the files who are not in your local repository.

```sh
git clean -n # dry-run, will display infos bur nor run the comand.
git clean # Remove files who do not match .gitignore
git clean -d # Remove files and empty directories who do not match .gitignore
git clean -d -x # Will also clean files & directories matching your .gitignore
```

## To completely clean a workspace

```sh
git reset --hard && git clean -d -x
```

## Stash

If you want to test someting and then work on something else without losing your work but without commiting it, git allow you to stash your code.

Stashed can be used to avoid merge issues on *git pull* to "clean" the workspace without loosing the modifications (not as *reset* wich remove them). ex :

```sh
# error : file foobar not up to date, cannot merge.
git stash
git pull
git stash pop
```

This can be also used if you want to test another way to make some code without certitude that you will not go back to the initial method.

```sh
git stash # Stash modifications
git stash --patch # Do not stash but create a patch in interactive mode.
git stash list # List stashed modifications
git stash apply # apply the latest stashed modification
git stash pop # Apply and delete the stash from your stack.
git stash apply stash@{2} # to apply a specific stashed modification.
git stash clear # remove all the stash entries.
```

The *stash-unapply* command do not exist but you can create an alias who will run fiew commands to simulate it.

```sh
# Create alias
git config --global alias.stash-unapply '!git stash show -p | git apply -R'
# Stash something.
git stash apply
# Do you work and then unstash.
git stash-unapply
```
