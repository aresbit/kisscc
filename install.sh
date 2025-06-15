#!/bin/bash

set -e

INSTALL_DIR="$HOME/bin"
SCRIPT_URL="https://raw.githubusercontent.com/0xkaz/claunch/main/bin/claunch"

echo "📦 Installing claunch to $INSTALL_DIR..."

mkdir -p "$INSTALL_DIR"
curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/claunch"
chmod +x "$INSTALL_DIR/claunch"

echo "✅ Installation complete: $INSTALL_DIR/claunch"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "⚠️ $INSTALL_DIR is not in your PATH. Add the following to your shell config file:"
  echo 'export PATH="$HOME/bin:$PATH"'
fi
