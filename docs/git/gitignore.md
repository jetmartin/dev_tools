# Gitignore

The `.gitignore` file allow you to explicitely ignore some files and folders from your local workspace on your local repository.

As an exemple, you will not save compiled files or external libraries on your Git.

The `.gitignore` files as ather git configuration files has to be on the rooot dir of your repository.
All the files matching ignore patterns will never be displays by the `git status` command.

```sh
# Files to ignore
.DS_Store
# Files ot ignore using a wilcard
*.tmp
# Folder to ignore
logs/
tmp/
# Folder to not ignore in a ignored folder patern
!docs/**/tmp/
```
