#!/bin/bash

set -ex

# git-db newroot oldroot b1 b2 b3 ...
# b3 depends on b2, b2 depends on b1, b1 previously depended on oldroot

if [[ $# -lt 3 ]]
then
    echo "USAGE: git-db newroot oldroot b1 ..."
    exit -1
fi

NEWROOT="$1"
OLDROOT=$(git rev-parse "$2")
shift 2

while [[ $# -gt 0 ]]
do
    CURRENT_NAME="$1"
    CURRENT_HASH=$(git rev-parse "${CURRENT_NAME}")
    git rebase --onto "${NEWROOT}" "${OLDROOT}" "${CURRENT_NAME}"
    NEWROOT="${CURRENT_NAME}"
    OLDROOT="${CURRENT_HASH}"
    shift
done
