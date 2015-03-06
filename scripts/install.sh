#!/bin/sh
DOTDIR=`dirname $0`/..

cd $DOTDIR

cd -

for file in $DOTDIR/etc/*; do
  ln -svf $file ~/.`basename $file`
done

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
