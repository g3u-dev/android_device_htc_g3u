#!/bin/sh

PATCHBASE=$(dirname $(readlink -f "$0"))
CMBASE=$(readlink -f "$PATCHBASE/../../../../")

for i in $(find "$PATCHBASE"/* -type d); do
	SRC=$(basename "$i")
	TARGET=$SRC
	for i in $(seq 4); do
		TARGET=$(echo $TARGET | sed 's/_/\//')
		if [ -d "$CMBASE/$TARGET" ]; then break; fi
	done
	echo Patching $TARGET
	cd "$CMBASE/$TARGET" || exit 1
	for j in $PATCHBASE/$SRC/*; do
		git am -3 $j || exit 1
	done
done
