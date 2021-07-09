#!/bin/bash

mkdir tmpClone
cd tmpClone

echo "Clone repos"
gh repo fork https://github.com/ryancj14/practice-upstream.git --clone

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
    cp -f third_party/common-config/docs/* ./docs   
    cp -rf third_party/common-config/.github/* ./.github
    cp -rf third_party/common-config/formatter-files/. .
    cp -f third_party/common-config/LICENSE .
    git add .
    git commit -m "Add common-config repo as subtree"
    git push --set-upstream origin add-common-config
    gh pr create --head xanjohns/practice-upstream:main --title "Add common-config repo as subtree" --body "Add common-config repo as subtree under third_party directory. Files are also copied to their required locations in docs, .github, etc."     
    cd ..
  fi
done
