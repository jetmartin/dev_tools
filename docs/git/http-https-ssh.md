# HTTP | HTTPS | SSH

SSH config is not part of Git config, see `~/.ssh/config` file.

## SSL issue

```sh
git config http.sslVerify false
# Disallow for a specific domain.
git config --global http.https://domain.tld.sslVerify false
```
