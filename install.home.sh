#!/bin/bash


#cd home
FILES_PATH=$(pwd)
for f in .???*; do
  if [ "$f" = ".git" ]; then
    echo "Skipping $f"
    continue
  fi
  if test -f "$HOME/$f"; then
    echo "Remove $f"
    rm $HOME/$f
   fi
  ln -s Linux/$f $HOME/$f
done
