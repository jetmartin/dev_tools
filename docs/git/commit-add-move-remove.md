# Commit, add, move & remove

## Add

To add new files to your repository, you have to use the *git add*.
You can sepecify the files or add all new files.
The mouve and remove comand also exists but the add command an avoid them.

To make it simple when you Create a new file, move, delete or rename a file, you want to tell to your Git repository thaht the file exist or has changed befor to commit it (save them in your repository).

Bellow command will manage all of those operations for you at once :

```sh
git add .
```

> It's important to move files and not remove them and add new onces to keep the history of modification on you files.

If I ad one file and delete another my workspace will not be synch with my Git.
This can be well shown using `git status`.

```sh
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    testfile.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        newfile.md
```

After `git add .` All the files are knew to git but the modification is not "saved" on it yet.

```sh
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   newfile.md
        deleted:    testfile.md
```

## Commit

After adding all changes on your files, you will have to save the new files and modificatiosn from your overall worspace to your git.
To do so, use bellow command. Beware to made a usefull commit message. Avoid using "WIP" or such kind of messages...

```sh
# add all files modifications (add, move, remove)
git add .
# commit all files modification and file editions.
git commit -m "A simple commit"
```

The *all* (*-a*) option can solve most commit issues. Beware, it is not ans *add* option.

```sh
git commit -a -m "Another simple commit"
```

If you want to commit just some of the file you are working one, you has to specify them as arguments.

```sh
git commit myfile.ext folder/myotherfile.ext -m "Specific files commit."
```

You can use expressions (as welle as for the `add` comand) to manages the files to commit such as ".", "folfer/", "*.ext", etc

```sh
git commit *.ext -m "Specific files extention commit."
git commit folder/ -m "Specific folder updates to commit"
git commit folder_a/ folder_b/  -m "Specific folders modifications to commmit"
```

As we've said, your commit history is a real tool. So you have to do your best to keep it clear and clean.
So if you've mad a bad commit, you do not need to ad another commit, you can *amend* it.
> Do not amend public commits. In other words, if you've pushed your modifications, it's to late.

```sh
git commit --amend -m "My new message" # Update the last commit message
git commit myforgottenfile.ext --amend --no-edit # Add a file to the last commit without edit message.
```

### Smart commits

*Smart commits* are not part of Git. They are implemented by Git tools surch as Bitbucket, Github, Gitlab, ...
They are used to manage actions on other tools using the git commit messages.
You can then used them to change the status of a task, or logg time spend on a task manager.

When you use smart commits, you frequently use commit message templates.
The aim of the template is to help your team to have clean commit messages.

Commit message format exemple :

```txt
#{ID} - {Done|In-progress|Re-open} : {Message}
```

To add commit templates, you can use the following command where *.gitmessage* is a text file used as template.

```sh
git config commit.template="~/.gitmessage"
```

When you use templates, you could like to commit in interactive mode (wich open a text editor).
In such a case, it's a common use case that you template will gave you notice how to make your commit. (commented lines will not be saved on your message).
To commit in interactive mode use bellow command.

```sh
git commit README.md -e
```

You can also use [git alias](./using-git-aliases.md) to create a custom command wich manage your commit message template.

ex : `mycommit README.md -id "33" -m "Update Readme"` will manage a commit message such as `JIRA-33 Update Readme`

### Commit good practices

The commit message is a usefull and key element of your projects maintainability.
In anycases, avoid "*WIP*" messages !

There are many documentation on the topic, see [here](https://twitter.com/r00k/status/1175100703829909505) or [here](https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message) or [this article](https://dev.to/jacobherrington/how-to-write-useful-commit-messages-my-commit-message-template-20n9) (just picked up fiew from many).
See [here](https://gist.github.com/zakkak/7e06725ebd1336bfebebe254de3de825) for an example of commit template to help you improve your commits.

### Empty folders commit

> Git do not commit empty folders.

So too be able to commit a folder structure without you have to put at least on file on the lower level folders.

By convention an empty *.gitkeep* file will be set by some git tools by default but this do not always made consensus.
If git do not commit empty files, there is a good reason.

In most of the cases, we prefer to use a *README.md* file -wich is another convention- wich explicitely explain why you have to commit an empty folder.
The uses cases where you need an empty file are rare, so you necesarily have a specific need that you need to explain to others.

## Squash

> Him : "Squash your commits !"
> You : "But what is it ? it's not even a Git comand !"

Squash your commits allow to merge severals commits into one single clean commit.
In some dev framwork where features branches are a verry smal amount of dev (such as defect fixing), to keep clean and lisible git history, each branch has to be merge as a single commit.

> Beware Your commits are a real and usefull tool. You should not squash your commits if you don't knew why you'r doing it.

Bellow exemple show how to merge a feature branch on master branch squashing the commits (as a single commit) and delete the useless branch.

```sh
# Checkout destination branch
git checkout master
# Squash the feature branch on it
git merge MyFeatureBranch --squash
# Commit the merge
git commit -m "Feature Name"
# Delete useless branch
git branch -D MyFeatureBranch
```
