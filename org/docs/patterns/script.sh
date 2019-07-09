#!/bin/bash
for dir in *;
do (
  if [ -d "$dir" ]; then
    echo "$dir"
    cp ./pattern.md $dir/options/en.md
  fi
);
done


