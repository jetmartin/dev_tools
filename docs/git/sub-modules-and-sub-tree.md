# Sub-modules and sub-tree

Sometimes you need to embed a "dependencie" on you project. Like as an exemple a specific pice of code managed by another team and shared acros the company.

For those cases git provide two solutions : *subtrees* and *submodules*.

If you are not familiar to git, don't panic. We gonna make it very simple bellow.

Usually we prefer to use submodules because they allow strong governance on repositories (View, Read, Write permissions as an exemple) and are simpler to understand for new commers to Git.
But you will find people who strongly prefer subtrees.
At the end of the day, it's often as much a matter of why you have to use them (real specificities) than the preference of the lead dev...

> By default, submodule or subtree, edit them on there original repository, not from your project.

## Submodules

A sub module is like a normal repository embeded on a folder within your repository.
A bit like if you've ade a `git clone`on that folder.

That mean that you have to run all remote operations separately from your current git. It will not impact your usual *commit*, *pull* and *push*.
The conterpart is that you have to think to manually *pull* the updates when you need them.

```sh
# Create a submodule on lib/mylib
git submodule add ssh://git@me.tld/mylib.git lib/mylib
# to update (pull) a submodule
git submodule update
```

Submodules are managed by git on a `.gitmodules` files.

## Subtrees

A sub tree is more like a copy of a repository within a folder of your repository. (files and history)
