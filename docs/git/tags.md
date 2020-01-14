# Tags

To make it short, a Tag is a unique reference to a specific commit (most of the time).

A tag must be unique but several tags can refer to the same object (commit).

There are several kind of tags but you will probably used in a day to day bases the **Annotated Tag**.

- *lightweight Tag* : lightweight tags are meant for private or temporary object labels (For this reason, some git commands for naming objects -like `git describe`- will ignore lightweight tags by default).
- *Annotated Tag* : Annotated tags are meant for release. Annotated tags store extra meta data such as: the tagger name, email, and date.
  - Annotated tag can also be *Signed Tag* : A GnuPG (GNU Privacy Guard) signed tag object will be created. (Adanced usage)

Tipicaly a tag is a pointer you used to refer to any kind of stable code base when you release your application.
Thy could be done manually or managed by sor CI (Continue Integration) tools.

As all other Git objects such as *branches* they have to be synchronised with the remote repository.

The tags are frequently used to *checkout* a single release without history of a codebase for building the application, for code dependencies such libraries or when using *git submodules*.

By default The HEAD commit will be taggued.

```sh
# Create an annotated tag
git tag -a v1.0.2 -m "Tag message"
# Create a tag from a specific commit
git tag -a v0.9 15027957951b64cf874c3557a0f3547bd83b3ff6 -m "Tag message"
# Replace existing tag using force option.
git tag -a -f v1.4
```

Search for a tag

```sh
# List all tags
git tag
# Search for a tag (using wildcard)
git tag -l *-rc
```

Push your tag to the remote repository

```sh
# Push a specific tag
git push origin v1.1.2
# push all tags
git push --tags
```

You can delete a tag

```sh
git tag -d v1.2.2
```

You can checkout a tag.
> Beware checkout a tag will create a [detached HEAD](#detached-HEAD).

```sh
git checkout v1.4
```
