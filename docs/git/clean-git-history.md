# Clean Git history

```sh
checkout --orphan -b 1.0.1
git reset $(git commit-tree HEAD^{tree} -m "A new start")
git commit --all -m "Initial commit"
git tag v1.0.1
git push remote v1.0.1
```
