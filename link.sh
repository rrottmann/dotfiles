#!/bin/sh
for i in *
do
    basename "$i" | grep -q $0 && continue
    echo ln -fs "$PWD/$i" ~/.`basename "$i"`
done
