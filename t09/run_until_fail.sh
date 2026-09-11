#!/usr/bin/env bash

count=0

while true; do
    count=$((count + 1))

    ./random_fail.sh >> output.log 2>> error.log

    if [[ $? -ne 0 ]]; then
        echo "The command failed after $count runs."
        break
    fi
done

echo "=== Standard Output ==="
cat output.log

echo "=== Standard Error ==="
cat error.log
