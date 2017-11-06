#!/bin/bash

set -ex

# git-db newroot oldroot b1 b2 b3 ...
# b3 depends on b2, b2 depends on b1, b1 previously depended on oldroot

if [[ $# -lt 4 ]]
then
    echo "USAGE: git-db verify newroot oldroot b1 ..."
    exit -1
fi

VERIFY="$1"
NEWROOT="$2"
OLDROOT=$(git rev-parse "$3")
shift 3

function continuation() {
    echo "in process " $NEWROOT $OLDROOT $CURRENT_NAME
    echo "next " $CURRENT_NAME $CURRENT_HASH $*
}

trap continuation SIGINT SIGTERM

while [[ $# -gt 0 ]]
do
    CURRENT_NAME="$1"
    shift
    CURRENT_HASH=$(git rev-parse "${CURRENT_NAME}")
    git rebase --onto "${NEWROOT}" "${OLDROOT}" "${CURRENT_NAME}"
    eval $VERIFY
    NEWROOT="${CURRENT_NAME}"
    OLDROOT="${CURRENT_HASH}"
done
trap - SIGINT SIGTERM
