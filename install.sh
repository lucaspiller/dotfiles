#!/bin/sh

if ! which "stow" > /dev/null; then
	echo "You need to install the 'stow' command first"
	exit 1
fi

for dir in *; do
	if [ -d "$dir" ]; then
		stow -t ~ --override "$dir/*" "$dir"
	fi
done
