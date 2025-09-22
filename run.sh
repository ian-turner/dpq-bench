#!/bin/bash

TEST_DIR="$1"

source ./setup.sh

echo -e "File\tTime"

find "$TEST_DIR" -type f -print0 \
  | sort -z -V \
  | while IFS= read -r -d '' file; do
      if [ -f "$file" ]; then
        printf "%s\t" "$file"
        { time dpq "$file"; } 2>&1 | awk '/^real/ {print $2}'
      fi
    done
