# understanding the basics

Git is a SCM tool (Source Code Management).

The purpose of such a tool is to sore each modification on source code.
It store the history of modification with usefull understandable comments.

SCM also allow you to make several evolution at the same time using "branches".
That mean that you can work on two different versions of your project at the same time without issues.
(ex : v1.5.8 and v2.0.0)

What make Git specific is that is is decentralised.
That means that you can use Git localy on your computer without connexion to any server.
(You can work on the plane during you next business trip)

A **repository** is the name of a code storage by project.

In other words, youh have a "central" repository called **origin** by convention on a server where all the developpers will store theyre code.

Each developper will have a *local* copy of the *origin* repository.

To make a local copy, you make a **clone**

So the main actions (life cycle) will be :

- I copy distant repository. That's a `clone`.
- I create/edit a file on my local filesystem.
- I "save" it on my local repository. That's a `commit`.
- I send my modifications to the distant repository to save them out of my computer and make them available for others. That's a `push`.

On that process, if someone has modified the same file as you, Git will not be able to define wich modifications on the same file to keep.
That's a **conflict**.
(Git is a pretty good tool to avoid, manage and auto-fix conflicts.)
So, to avoid issues on interactions with ditant repository, follow bellow process :

- I copy distant repository. That's a `clone`.
- I create/edit a file on my local filesystem.
- I "save" it on my local repository. That's a `commit`.
- I get the modifications from the distant repository. That's a `pull`
- Git will use commit history to manage *conflicts*. If he is not able to fix all the conflicts, you will have to do it manually. That's a **merge** of the files.
- I `commit` the merged files.
- I send my modifications to the distant repository. I made a `push`.

That process in comand lines will look like :

```sh
# Clone repository on the current folder
git clone ssh://git@client.tld/repos.git ./
# edit README file
vi README.md
# Commit file
git commit README.md -m "Some updates on the Readme file"
# pull origin
git pull origin master
# if git message ask to manage manual merge.
git commit -a -m "Merge commit"
# Push your local modifications to origin.
git push origin master
```

On that exemple, you can see that on each action with the remote repository, you can see that the remote name and branch name are specified.
Thats a good practice to ensure that you knew what you'r doing.
So prefer to run `git pull origin master` than `git pull` even if that's the default behavior.
If you'r using several branches or remotes repositories, that will avoid painfull issues...
