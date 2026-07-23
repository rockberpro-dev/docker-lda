#!/bin/bash

set -e

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALL_PATH="$HOME/.docker-lda.sh"
HELP_PATH="$HOME/.docker-lda-help.sh"

cp "$SRC_DIR/docker-lda.sh" "$INSTALL_PATH"

BASHRC="${BASHRC:-$HOME/.bashrc}"

if ! grep -qF "source $INSTALL_PATH" "$BASHRC" 2>/dev/null; then
    echo "" >> "$BASHRC"
    echo "source $INSTALL_PATH" >> "$BASHRC"
fi

cp "$SRC_DIR/docker-lda-help.sh" "$HELP_PATH"
chmod +x "$HELP_PATH"

echo "docker-lda installed: $INSTALL_PATH"
echo "docker-lda help installed: $HELP_PATH"
echo "Run 'source ~/.bashrc' or open a new terminal to activate."
