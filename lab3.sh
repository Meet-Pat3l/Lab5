#!/bin/sh

#Meetkumar Patel 216814352

# checkings if any argumnets wre provided or not
if test $# -eq 0
then
   echo "please enter path names"
   echo "Use lab3.sh path"
   echo "for example lab3.sh ~"
   exit 2
fi

#Path readability check

if test -r $1
then
  #counting read "*.rec" files
  count=`find $1 -type f -name '*.rec' | wc -l`
  if test $count -eq 0
  then
    echo "There are no readable *.rec files that exist in the specified 
path, or its subdirectories"
    exit 1
  fi
fi

#promt display to user
#some readable files at this point

while test $count -gt 0
do
  printf "command: "
  read command
  if test $command = "quit" 
  then
      exit 0
  elif test $command = "list"
  then
    echo 'Here is the list of found class files:'
    find $1 -type f -name '*.rec'
  else
      echo 'command not recognized'
  fi
done
