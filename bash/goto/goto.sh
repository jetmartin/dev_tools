#!/bin/bash

##
# GOTO Aliases
#
# Add the following line to your .bashrc or .bash_aliases file. (Where pathToFile is the location of your goto.sh file.)
# alias goto='. /pathToFile/goto.sh'
#

declare -A PATH_ALIAS

##
# Add here some path using the structure bellow :
# PATH_ALIAS[arrayKey]=Path
#

# System aliases
PATH_ALIAS[apache]=/etc/apache2
# Static
PATH_ALIAS[static]=/var/www/static


##
# Execute CD
#

# if [ -n ${PATH_ALIAS[$1]} ]
if test "${PATH_ALIAS["$1"]+isset}"
then
  cd ${PATH_ALIAS[$1]}
else
  echo "\"$1\" is not a defined alias.";
fi