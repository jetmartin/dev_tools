# Remote repository

By convention the default remote repository is named **origin**.
That's the default name for the remote repository on a git clone.

But you can link several remote repositories.
To knew how many repositorues exist, what's there names and urls, use bellow commands.

```sh
git remote # display remote names
git remote -v # display remote names & urls
git remote get-url origin # display remote specified by name (origin) url.
```

This can be usefull for delivery code on a client infrastrucure.
As an exemple, you can work on your company repository and deliver on your client one.
In a more advanced context you can even link directly two developpers repository without using the centralised repository. (never do that if you don't knew what you'r doing)

```sh
# To add client remotes repositories as "client"
git remote add client ssh://git@client.tld/repos.git
# get sources from your compnay repository on your local repository
git pull origin master
# deliver sources on client repository
git push client master
```

To change the remote url for *client* remote repository

```sh
git remote set-url client ssh://git@client.tld/repos.git
```
