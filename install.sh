#!/bin/bash

set -e

# link these bins
[ -n "$1" ] && INSTALL_BINS=("${*[@]}")
[ -z "$INSTALL_BINS" ] && INSTALL_BINS=(gv fgv fvim)

# into the XDG user binary directory
# there's no official spec but XDG_BINARY_DIR seems like the "right" equivalent to other xdg-user-dirs variables.
[ -z "$XDG_BINARY_DIR" ] && XDG_BINARY_DIR="$(systemd-path user-binaries)" || true
[ -z "$XDG_BINARY_DIR" ] && XDG_BINARY_DIR="$HOME/.local/bin"

for BIN in "${INSTALL_BINS[@]}"
do
	ln $([ -z "$QUIET"] && echo -v) -s "`pwd`/${BIN}" "${XDG_BINARY_DIR}"
done
