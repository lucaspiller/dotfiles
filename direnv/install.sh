#!/bin/sh

set -eu

cd "$(dirname "$0")/.."
stow -t "$HOME" --ignore='^install\.sh$' direnv
