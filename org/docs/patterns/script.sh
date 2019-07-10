#!/bin/bash
for dir in *;
do (
  if [ -d "$dir" ]; then
    echo "$dir"
    cp ./need.md $dir/needs/en.md
    cp ./fabric.md $dir/fabric/en.md
    cp ./cut.md $dir/cutting/en.md
  fi
);
done


