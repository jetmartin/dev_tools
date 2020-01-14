# Fetch

Fetch branches and/or tags (collectively, "refs") from one or more other (remote) repositories.
When no remote is specified, by default the origin remote will be used.

```sh
git fetch origin
git fetch my-custom-remote
```

Main options :

- `--prune` : Before fetching, remove any remote-tracking references that no longer exist on the remote.
- `--prune-tags` : Before fetching, remove any local tags that no longer exist on the remote if `--prune` is enabled.
This option should be used more carefully, unlike `--prune` it will remove any local references (local tags) that have been created.
