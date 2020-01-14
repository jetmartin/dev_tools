# Create a new project

Before creating a new project, you should ensure some basic git cofigurations are set.
At least your git user mane and email.
[See configuration](#config).

## Create from scratch

To create a new repository you simply has to use the `init` command.

```sh
# Create a git repository on the current folder
git init
# Create a git repository on the specified directory
#git init <directory>
git init ~/my-repo
```

By default, when you init a repository your intial commit will be done in a *master* branch by convention.

There are many advanced options such as `--bare` or `--shared` but they are commonly used for central repository such as *origin* not as developper onces.

The common use case of `init` is when you've started some local work and want to share or backup it.
Then the usual scenario is as follow.

```sh
cd my-folder
# Create repository
git init
# Add files to git.
git add .
# Save thje files to git.
# Bellow commit message is a convention !
git commit -m "Initial commit"
# Add a remote repository
git remote add origin ssh://me.tld/my-repo.git
# Send the local default branch to the remote repository
# (and create master as traking branch at once)
git push -u origin master
```

## Create from existing remote repository

This is the simplest way to start working on a project.

The `clone` command make a local copy of any distant repository.
By default you just has to provide the repository to clone URL. Git will create a new folder to checkout the repository.
The folder name will be the url basemane. (ex : for `http://some/test/path` the basename will be `path`)

That means that after a clone, you will have to move on the new folder to run git commands.

You can pass an extra agument wich will be the path where to clone the repository.

```sh
# Will create my_project on current folder.
git clone ssh://git@me.tld/my_project.git
# Will clone on current folder.
git clone ssh://git@me.tld/my_project.git ./
# Will clone on renamed folder and move on it.
git clone ssh://git@me.tld/some_long_name.git my_project && cd my_project
```

## Git template

If you create frequently new projects, git allow you to manage *Git templates*.
They are templates files who will be automaticaly copied on any new project (`git init`or `git clone`) by default (usign global config) or using command arguments.
That's usefull to normalise your projects and the git repos confugurations.

How to manage templates :

```sh
git init --template='~/.git_template/template'
# or
git config --global init.templatedir '~/.git_template/template'
git init
```

Sample template files :

```txt
.editorconfig
.gitignore
.gitconfig
human.txt
CHANGELOG.md
CONTRIBUTING.md
LICENCE
README.md
ROADMAP.md
```
