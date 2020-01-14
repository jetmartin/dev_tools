#!/usr/bin/env bash

##
# GOTO Aliases
#
# Add the following line to your .bashrc or .bash_aliases file. (Where pathToFile is the location of your goto.sh file.)
# alias goto='. /pathToFile/goto.sh'
#

##
# Function fo fix iOS compatibility (Bash 3)
#
real_path () {
  OIFS=$IFS
  IFS='/'
  for I in $1
  do
    # Resolve relative path punctuation.
    if [ "$I" = "." ] || [ -z "$I" ]
      then continue
    elif [ "$I" = ".." ]
      then FOO="${FOO%%/${FOO##*/}}"
           continue
      else FOO="${FOO}/${I}"
    fi

    ## Resolve symbolic links
    if [ -h "$FOO" ]
    then
    IFS=$OIFS
    set `ls -l "$FOO"`
    while shift ;
    do
      if [ "$1" = "->" ]
        then FOO=$2
             shift $#
             break
      fi
    done
    IFS='/'
    fi
  done
  IFS=$OIFS
  echo "$FOO"
}

##
# Get Full path of the current script
#
# THIS=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0`
THIS=`real_path ${BASH_SOURCE[0]} 2>/dev/null||echo $0`
DIR=`dirname "${THIS}"`

##
# Manage bash release to check if parameter exist.
#
if [ ${BASH_VERSION::1} -gt 3 ]; then
  declare -A PATH_ALIAS
  . "$DIR/path_aliases.sh"

  if test "${PATH_ALIAS["$1"]+isset}"
  then
    PATH=${PATH_ALIAS[$1]}
  else
    echo "\"$1\" is not a defined alias.";
  fi
else
  sed -e 's/PATH_ALIAS\[/declare PATH_ALIAS_/g' -e 's/]=/=/g' $DIR/path_aliases.sh > $DIR/~path_aliases.sh
  . "$DIR/~path_aliases.sh"

  PARAM="PATH_ALIAS_${1}"
  # echo "${!PARAM}"
  # if test -z "${PARAM}"
  if test "${!PARAM+isset}"
  then
    PATH=${!PARAM}
  else
    echo "\"$1\" is not a defined alias.";
  fi
fi

##
# Move to requested folder
#
if [ -d $PATH ]; then
  # command cd $PATH
  # echo "cd $PATH"
  cd $PATH
  # exec bash
else
  echo "The folder $PATH do not exist."
fi