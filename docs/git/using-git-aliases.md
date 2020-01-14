# Using git aliases

To create aliases, edit your `.git/config` or use `git config alias.myAliasName ...`.

Warning, on bellow exemple, we used a git template and the commit is interactive. (you have to type your commit message). That's why there is only one parameter for the alias (the branch to merge name).

> As this is an alias, it's not out of the box, you have to reproduice that config one each developer environnement.

usage :

```sh
git sqash MyBranch
```

Create an alias in comand line :

```sh
git config alias.last "log -1 HEAD"
```

Creating alias by editting config file :

```sh
[commit]
        template = ~/.gitmessage

[alias]
        squash = !"git merge $1 --squash && git commit -e && git branch -D $1"
```

## Syntax

An alias without `!` is treated as a Git command;

```sh
commit-all = commit -a
```

With the `!`, it's run as its own command in the shell.
You can use sevral syntaxes `!(cmd)`, `!"cmd"`, `"!cmd"`, `!cmd`
As an exemple you can now use shell variables and default values.

```sh
[alias]
    # Merge, squash commits and delete branch.
    # Use dev branch if there is no parameter.
    m = !"git merge ${1-dev} --squash && git commit -e && git branch -D ${1-dev}"
```

This will also allow you to use shell functions for more complex stuff.
You can declare and use it in a one liner or use speparately declared functions.

```sh
[alias]
    # a 'f' function to echo a variable or the default value.
    say = "!f() { \
        msg=${1-Hello World}; echo $msg; \
      }; f"
```

Git provides a mechanism for parsing and finding files in your $PATH that may contain commands or functions.
It is common to have a bin directory in your home directory on Linux and Unix types systems.
Git will use files found with the naming convention of `git-{alias}` and run the code in these files using the alias.
Git removes the `git-` part.
These files also need to have the executable bit set. (`chmod +x ./myfile`)

As an exemple for the file : `~/bin/git-message` or `/usr/local/bin/git-message` use the `git message`cmd to run bellow code.

```sh
#!/bin/sh

echo "${1-Hello World}"
```

## Smart commits alias example

Bellow exemple illustrate how to use aliases to manage smart commits.
This example should not be used as-is. it's just a sample of working code, not a complete & secure script.

> Others aproaches can be to use pre-commit hook to ckeck commit message and display errors or use commit template (aka .gitmessage).

To commit using the Bitbucket following template :
`<ISSUE_KEY> #<COMMAND_1> <optional COMMAND_1_ARGUMENTS> #<COMMAND_2> <optional COMMAND_2_ARGUMENTS>`.

To make it short from this to that :

- `git commit -m "JRA-123 #time 2d 5h #comment Update Readme"`
- `git bcommit README.md --id "123" --t "2d 5h" --m "Update Readme"`

```sh
#!/bin/sh

while [ $# -gt 0 ]; do
  case "$1" in
    --id | --m | --t)
        v="${1/--/}"
        declare $v="$2"
        shift
      ;;
    *)
       files="${files-} $1"
  esac
  shift
done

git commit ${files-} -m "JIRA-${id} #time ${t} #comment ${m}"
```
