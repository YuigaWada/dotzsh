#!/bin/bash
# an extension of `cd` command, which enables us to cd where the given file exists.
# usage: cdf [filepath ...]
# 2022/06/01 Yuiga Wada

target=$1
head=${target:0:1}
args=$(echo $1 | tr "/" "\n")
len=$(echo $1 | tr "/" "\n" | wc | awk '{print $1}')
n=0
if test $head = "/"; then
    n=1
fi
path=""
for arg in $args; do
    arg="/${arg}"
    n=$(($n + 1))
    if [ $n -ne $len ]; then
        path="${path}${arg}"
    fi
done

cnt=$(echo "$arg" | wc | awk '{print $3-1}')
if test $head != "/"; then
    cnt=$(cat $args | wc | awk '{print $2}')
    args=${args:1:$(($cnt - 1))}
fi

echo $path
cd $path
$SHELL
