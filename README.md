# dev_tools

Some dev tools.

## Github Actions test

![](https://github.com/jetmartin/dev_tools/workflows/Continuous%20Integration/badge.svg)

## Bash

Some usefull bash scripts.

### Goto

A simple script to get shortcuts to your comon folders (using "cd").

Add the following line to your .bashrc or .bash_aliases file. (Where pathToFile is the location of your goto.sh file.)
```txt
alias goto='. /pathToFile/goto.sh'
```

Add your folders into the array as below and use the following line of code to use it.

```txt
# PATH_ALIAS[arrayKey]=Path
PATH_ALIAS[apache]=/etc/apache2
```

```shell
goto arrayKey
```
