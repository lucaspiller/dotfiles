#!/bin/sh
DOTDIR=`dirname $0`/..

for i in $DOTDIR/etc/*; do ln -svf $i ~/.`basename $i`; done
