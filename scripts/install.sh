#!/bin/sh
DOTDIR=`dirname $0`/..

cd $DOTDIR
git submodule init
git submodule update
cd -

for file in $DOTDIR/etc/*; do
  ln -svf $file ~/.`basename $file`
done
