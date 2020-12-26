#!/bin/bash

CUR_PATH=$(pwd)
for f in .???*; do
  rm $HOME/$f
  ln -s $CUR_PATH/$f $HOME/$f
done
