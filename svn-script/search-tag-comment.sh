#!/bin/bash

# paramns post-commit

# param-1 repository
REPOS="$1"
# param-2 version
REV="$2"

# get log repositorio svn
LOG=$(svnlook log  $REPOS)

echo $LOG

# verifica se comentario possui a tag [build]
if echo $LOG | grep -q "build"
then
	echo "build project"
fi
