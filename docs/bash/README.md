# Bash

> Some usefull bash scripts.

## Goto

A simple script to get shortcuts to your comon folders (using "cd").
Usefull when you frequently switch from one workspace to another.

```sh
# Move to one workspace
goto projecta
# Move to another workspace
goto projectb
```

### Install

Clone the script files `bash/goto/` on your local machine such as `/usr/local/lib/goto/`.
Make it executable and available as command.

Add the following line to your .bash_profile, .bashrc or .bash_aliases file.
(Where pathToFile is the location of your goto.sh file.)

```sh
# alias goto='. /pathToFile/goto.sh'
alias goto='. /usr/local/lib/goto/goto.sh'
```

Do not forget to refresh the config or restart your terminal

```sh
source ~/.bash_profile
```

### Config

Add your folders into the array on `path_aliases.sh`file.

```sh
# PATH_ALIAS[arrayKey]=Path
PATH_ALIAS[apache]=/etc/apache2
```

### Use it

Run the following line of code to use it.

```sh
# goto arrayKey
goto apache
```

### Troubleshooting

If you are facing issue to run the comand, exure the file has proper rights.

```sh
chmod +x /usr/local/lib/goto/goto.sh
```
