#!/bin/bash

mkdir tmpClone
cd tmpClone

echo "Clone repos"
curl -u xanjohns -s https://api.github.com/users/xanjohns/repos?per_page=200 | python ../merger_help.py 

echo "Repos cloned and ready"
for dir in ./* ; do
  if [ -d "$dir" ]; then
    dir=${dir%*/}

    echo "Adding Subtree"
    cd ${dir##*/}
    git checkout -b add-common-config
    git subtree add --prefix third_party/common-config https://github.com/ryancj14/common-config.git main --squash

    mkdir -p docs
    mkdir -p .github
    cp -f third_party/docs/* ./docs   
    cp -rf third_party/.github/* ./.github
    cp -rf third_party/formatter-files/. .
    cp -f third_party/LICENSE .
    git add .
    git commit -m "Add common-config repo as subtree"
    git push
    gh pr create --title "Add common-config repo as subtree" --body "Add common-config repo as subtree under `third_party` directory. Files are also copied to their required locations in `docs`, `.github`, etc." --base ryancj14/practice-upstream
    cd ..
  fi
done
