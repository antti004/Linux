#!/usr/bin/env bash shebang

url_repo="https://api.github.com/repos/antti004/linux/contents"

echo "$url_repo"

curl "$url_repo/dotfiles" | jq -r '.[].name' | while  IFS= read -r name;
do
  echo $name
done

