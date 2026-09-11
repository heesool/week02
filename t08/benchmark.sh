#!/bin/bash

set -e

rm -rf testdata
mkdir -p testdata

for i in $(seq 1 1000); do
    touch "testdata/file_$i.txt"
done

for i in $(seq 1 20); do
    mkdir -p "testdata/dir_$i"
    for j in $(seq 1 50); do
        touch "testdata/dir_$i/file_${j}.txt"
    done
done

hyperfine \
    'find testdata -type f -name "*.txt"' \
    'fdfind -t f "\.txt$" testdata' \
    | tee benchmark.txt
