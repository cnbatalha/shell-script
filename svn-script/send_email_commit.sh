#!/bin/bash
REPOS=$1
REV=$2
SENDTO=$3

SENDFROM="email@mail.com"
SENDFROMNAME="Name Email"

LIMITDIFF=200
CHANGELOG=`svnlook log  $REPOS`
AUTHOR=`svnlook author  $REPOS`
CHANGED=`svnlook changed  $REPOS`
DIFF=`svnlook diff -r $REV $REPOS | head --lines=$LIMITDIFF`
DATE=`date`
TMPFILE=/tmp/svn$REV-$RANDOM.txt

REPNAME=${REPOS##*/}

MENSAGEM="================== SVN Commit Notification ================== 
Repository: $REPNAME 
Revision:   $REV 
Author:     $AUTHOR \n
Date:       $DATE \n  
============================================================== 
Log Message: 
============================================================== 
$CHANGELOG \n
============================================================== 

"

SUBJECT="Equipe Sistematic: $AUTHOR realizou commit em  $REPNAME [$REV]"
echo "-------------------- SVN Commit Notification --------------------
Repository: $REPOS
Revision:   $REV
Author:     $AUTHOR
Date:       $DATE
-----------------------------------------------------------------
Log Message:
-----------------------------------------------------------------
$CHANGELOG

-----------------------------------------------------------------
Changes:
-----------------------------------------------------------------
$CHANGED

-----------------------------------------------------------------
Diff: (only first $LIMITDIFF lines shown)
-----------------------------------------------------------------
$DIFF
" > $TMPFILE

# Send email
sendEmail -f $SENDFROM -t $SENDTO  -u $SUBJECT -m "$MENSAGEM" -a $TMPFILE  -s smtp.gmail.com:587 -xu $SENDFROM -xp passwd_email -o tls=yes

# cat $TMPFILE | mail -a "From: $SENDFROM" -s "$SUBJECT" "$SENDTO"

# Cleanup
rm $TMPFILE

