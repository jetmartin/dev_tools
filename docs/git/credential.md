# Credential

@TODO : pub.key, askpass, caching, ...

## Credential helper

Typping your credentials on each single remote operation can be painfull and unefficient.
To make it easier, there are for main behavior for manage Credentials on git :

- The default is not to cache at all. Every connection will prompt you for your username and password.
- The “cache” mode keeps credentials in memory for a certain period of time. None of the passwords are ever stored on disk, and they are purged from the cache after 15 minutes.
- The “store” mode saves the credentials to a plain-text file on disk, and they never expire. You won’t ever have to type in your credentials again. The downside of this approach is that your passwords are stored in cleartext in a plain file in your home directory.
- Credential manager
  - If you’re using a Mac, Git comes with an “osxkeychain” mode, which caches credentials in the secure keychain.
  - If you’re using Windows, you can install a helper called “Git Credential Manager for Windows.”

> By default : **Do never use the "store" option**, wich is unsecure, your crdentials will be uncoded on your filesystem. (except if you'r doing advance scripting on a third-party config manager)

```sh
# To add cache (default time-out is 15 min).
git config --global credential.helper cache
```

> If you do not want to type your credentials, you better has to look for using git over SSH.

## SSH key

> This is from far the most recomended method.

- It is the most secure and robust method
- It's supported by most of Git platforms (github, gitlab, ...)
- You can add a pathphrase to your key

Refer to the nice [GitHub documentation](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

## acces token

Some platforms such as GitLab allow to use personal acces token.
If you can prefer the SSH key aythentification. This method can be usefull for process automation with limited permissions on each tokens.

as an exemple refer to the [GitLab documentation](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

You can concatenate the token in the url for some automation use-cases ex : `git clone https://username:token@domain.tld/repo.git`