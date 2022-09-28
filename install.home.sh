#!/bin/bash


#cd home
FILES_PATH=$(pwd)
for f in .???*; do
   echo $f
  rm $HOME/$f
  #ln -s $FILES_PATH/$f $HOME/$f
  ln -s Linux/$f $HOME/$f
done
