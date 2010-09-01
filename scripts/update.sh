#!/bin/sh
DOTDIR=`dirname $0`/..

cd $DOTDIR

# update
git pull > /dev/null

# and install
$DOTDIR/scripts/install.sh > /dev/null
