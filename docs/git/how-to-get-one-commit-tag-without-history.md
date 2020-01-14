# How to get one commit/tag without history

You nedd to understand a bit the *clone* coommand.

By default, the `git clone` will create a local copy of the *master* branch only of the remote repository, and will call that repos as *origin*. (as: origin/master)
When we talk about a local copy, that mean a local copy of the all branch history.
When you project is getting bigger, it could sometimes takes time or be useless if you jsut want to get the sources for a compilation and delete them after, and some others usecases.

To manage such advances usecases, you can use bellow paramerters.

```sh
# Specify how many commit from history to clone.
# only the last one in bellow example.
git clone --depth 1 ssh:/git@me.tld/repos.git
# Clone another branch than master
git clone -b samplebranch ssh:/git@me.tld/repos.git
```
