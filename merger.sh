#!/bin/bash

mkdir tmpClone
cd tmpClone

echo "Clone repos"
curl -u xanjohns -s https://api.github.com/users/xanjohns/repos?per_page=200 | python ../merger_help.py 

# echo "Repos cloned and ready"
# for dir in ./* ; do
#   if [ -d "$dir" ]; then
#     dir=${dir%*/}

#     echo "Copying LICENCE"
#     cp ~/Downloads/cloner/LICENSE ${dir##*/}

#     echo "Doing git stuff"
#     cd ${dir##*/}
#     git add .
#     git commit -m "Added MIT license file"
#     git push
#     cd ..
#   fi
# done

# echo "Here's the files I've added"
# cd ..
# ls tmpClone/**/LICENSE

