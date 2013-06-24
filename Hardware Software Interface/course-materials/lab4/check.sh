#!/bin/sh

if make -s cache-test TEST_CACHE=$1; then
    ./cache-test | awk -f check.awk name=$1 cache_size=$2 cache_assoc=$3 block_size=$4 || exit $?
else
    echo "Can't build cache-test for $1."
fi
rm -f cache-test
