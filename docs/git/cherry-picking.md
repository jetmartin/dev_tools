# Cherry-picking

If for some reasons you need to get a modification made on a branch in another branch withour merging the two.
(From one release to another, you don't have time to manage major merge, ...)
By default, you have to create a patch from a specific commit and apply it to the new branch.
But that's boring to do and, if the two branches hawe change a lot, may your patch will not be that simple to apply.
That's why Git allow you to *cherry-pick* one commit to apply just that commit to another branch.

```sh
# Checkout branch and get commit ID from log
git checkout somebranch
# Display : "d926579 #JIRA-34: Fix an issue"
git log --grep="#JIRA-34:" --pretty=oneline --abbrev-commit -1
# Checkout working branch
git checkout mybranch
# Apply d926579 commit.
git cherry-pick d926579
```
