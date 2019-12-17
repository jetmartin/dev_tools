# dev_tools

Some dev tools.

## Github Actions test

![CI Status](https://github.com/jetmartin/dev_tools/workflows/Continuous%20Integration/badge.svg)

## Bash

Some usefull bash scripts.

### Goto

#### Install

A simple script to get shortcuts to your comon folders (using "cd").

Add the following line to your .bashrc or .bash_aliases file.
(Where pathToFile is the location of your goto.sh file.)

```shell
alias goto='. /pathToFile/goto.sh'
```

#### Config

Add your folders into the array as below.

```shell
# PATH_ALIAS[arrayKey]=Path
PATH_ALIAS[apache]=/etc/apache2
```

#### Use it

Run the following line of code to use it.

```shell
# goto arrayKey
goto apache
```
