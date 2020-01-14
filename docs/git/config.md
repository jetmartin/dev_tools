# Config

When you initialize your Git environnement you must configure some user parameters.
It could be configured as *global* (once for all your projects) or as *local* for a specific repository.

```sh
git config --global user.name "Me"
git config --global user.email "me@me.tld"
```

This configs are the one visible on the git Logs. Ex :

```sh
commit b8c620960e55d0b0c24396920b95a93b7141cb24
Author: Me <me@me.tld>
Date:   Wed Nov 21 18:24:06 2018 +0100

    My usefull commit Message.
```

As an exemple those global settings will be your organisation mane and email, valid for most of your repositories.

[See official documentation](https://git-scm.com/docs/git-config) for more details.

## Local conf

If for some reasons (client repository, ...) you may need specific configurations.
In such situation, you will set local user settings.

Before setting local configurations, you has to intialise a local repository.

You can do it by cloning the client repository (in most of the cases) or init a repository ad-hoc localy and then link it later to the remote client repository. (see [remote repository section](#remote-repository))

```sh
# Clone repository on the current folder
git clone ssh://git@client.tld/repos.git ./
# Configure your local user.
git config user.name "Me"
git config user.email "me@client.tld"
```

## Config files

It exist 4 files where the git confiuration is managed.
In day to day life, the two last are the most used and knew as "*global*" and "*local*".

- **$(prefix)/etc/gitconfig** System-wide configuration file.
- **$XDG_CONFIG_HOME/git/config** Second user-specific configuration file.
- **~/.gitconfig** User-specific configuration file. Also called "*global*" configuration file.
- **$GIT_DIR/config** (.git/config) Project-specific configuration file. Also called "*local*" configuration file.

There is no way to share config file acros users using git.
As a convention to do so, use a .gitconfig file at the root folder of your repository and see the [share git config section](#Share-git-config).

### Add a conf at the right place

You can edit the files manually but you need to be sure of what's you'r doing.
It's more common to use bellow comands.

```sh
git config --global user.name "My name" # Global config file (~/.gitconfig)
git config user.name "My name" # local config file (.git/config)
git config --file .gitconfig user.name "My name" # custom config file.
```

/!\\ Do never share user.* config or any other personal or specific data on a .gitconfig file !
This is just an exemple of comand usage.

### Config files Syntax

@TODO

Alias syntax

```sh
show-logs = "log"
show-logs = !"git log"
```

## Share git config

Beware, due to security concer, Git do not allow to share config "on the fly".
you will be dependent of each developper to include that config file on his local git.

```sh
[include]
  path = ../.gitconfig
```

or

```sh
git config --local include.path ../.gitconfig
```

## Git attributes

These attributes affect how the contents stored in the repository are copied to the working tree files when commands such as git checkout and git merge run.

The most common usecase is to normalize files between windows and Unix filesystems.

Bellow an abstract of file as exemple.

```sh
# Set the default behavior, in case people don't have core.autocrlf set.
* text         eol=lf
# Declare files that will always have CRLF line endings on checkout.
*.cmd text     eol=crlf
*.bat text     eol=crlf
# Declare files that will always have LF line endings on checkout.
*.sh           text eol=lf
*.java         text eol=lf
*.conf         text eol=lf
# Define binary file attributes.
# - Do not treat them as text.
# - Include binary diff in patches instead of "binary files differ."
*.gz      -text diff
*.exe     -text diff
*.jar     -text diff
```
