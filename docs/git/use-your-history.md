# Use your history

The commit, as comments or clean code, are part of developper responsability.
Proper commits ensure easy debug and simplifyfuture tasks to do on application lifecycle.
Use logs & more to find modifications.

As log commands can be used frequently and be complexe, the [git aliases](#Using-git-aliases) are frequently used.

```sh
git log -1 # display last commit.
git log -p -1 # Add diff to log.
git log --author=Me # Display user commits
git log --author="Me\|You" # Display users commits
git log --grep="#JIRA-34:" # Search for text in commit message.
git log -S"Hello, World!" # look for a modification in a file
git log -G"[a-z]@[a-z].com" # look for a modification in a file using a regex
git log -- README.md # Display file history
git log --pretty=oneline --abbrev-commit # display one line with shorten ID & commit message.
# b8c6209 Initial commit
git log --pretty=oneline --abbrev-commit --name-only # display dhorten ID, commit message and files commited.
# b8c6209 Initial commit
# README.md
git show 01f9ddee130b4b99a754418c32a5ea28c63f570f # display all informatiosn of a specific commit.
git log --graph --oneline --decorate # Display ASCII graph or git history.
git log --after="yesterday" # Display until a date
git log --after="2018-5-14" --before="2018-05-17" # Display in a date range
git log --no-merges # do not display merge commits.
```
