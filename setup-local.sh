#!/bin/bash

set -e

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/docker-lda"

INSTALL_PATH="$CONFIG_DIR/docker-lda.sh"
HELP_PATH="$CONFIG_DIR/docker-lda-help.sh"

BASHRC="${BASHRC:-$HOME/.bashrc}"

# Remove files from older versions, which installed directly into ~
rm -f "$HOME/.docker-lda.sh" "$HOME/.docker-lda-help.sh"
if [ -f "$BASHRC" ] && grep -qF '/.docker-lda.sh' "$BASHRC"; then
    grep -vF '/.docker-lda.sh' "$BASHRC" > "$BASHRC.docker-lda.tmp" || true
    cat "$BASHRC.docker-lda.tmp" > "$BASHRC"
    rm -f "$BASHRC.docker-lda.tmp"
fi

mkdir -p "$CONFIG_DIR"

cp "$SRC_DIR/docker-lda.sh" "$INSTALL_PATH"

if ! grep -qF "source \"$INSTALL_PATH\"" "$BASHRC" 2>/dev/null; then
    echo "" >> "$BASHRC"
    echo "source \"$INSTALL_PATH\"" >> "$BASHRC"
fi

cp "$SRC_DIR/docker-lda-help.sh" "$HELP_PATH"
chmod +x "$HELP_PATH"

echo "docker-lda installed: $INSTALL_PATH"
echo "docker-lda help installed: $HELP_PATH"
echo "Run 'source ~/.bashrc' or open a new terminal to activate."
