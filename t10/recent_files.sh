#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "Error: directory does not exist"
    exit 1
fi

find "$1" -type f -printf '%TY-%Tm-%Td %TH:%TM:%TS %p\n' | sort -r

