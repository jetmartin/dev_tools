# Git hover a proxy

```sh
# Use proxy on the current repository
git config http.proxy http://proxyUsername:proxyPassword@proxy.server.tld:port
# Use globally proxy for a specific domain
git config --global http.https://domain.tld.proxy http://proxyUsername:proxyPassword@proxy.server.tld:port

# Display all domains specifics settings on your repository (could be local or global)
git config --get-regexp http.*
```

Domain specific setting will be displayed as follov on `~/.gitconfig` file.

```sh
[http]
[http "https://domain.tld"]
    proxy = http://proxyUsername:proxyPassword@proxy.server.tld:port
    sslVerify = false
```
