#!/bin/bash

# paramns post-commit

# param-1 repository
REPOS="$1"
# param-2 version
REV="$2"

# get log repositorio svn
CHANGELOG=`svnlook log  $REPOS`

echo CHANGELOG
