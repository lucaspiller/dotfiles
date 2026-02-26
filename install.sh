#!/bin/sh

set -eu

if ! command -v stow >/dev/null 2>&1; then
	echo "You need to install the 'stow' command first."
	exit 1
fi

for dir in *; do
	if [ -d "$dir" ] && [ -x "$dir/install.sh" ]; then
		echo "===> Installing $dir"
		"./$dir/install.sh"
	fi
done
