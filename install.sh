#!/bin/bash

set -e

INSTALL_DIR="$HOME/bin"
SCRIPT_URL="https://raw.githubusercontent.com/0xkaz/claunch/main/bin/claunch"

echo "📦 Installing claunch to $INSTALL_DIR..."

mkdir -p "$INSTALL_DIR"
curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/claunch"
chmod +x "$INSTALL_DIR/claunch"

echo "✅ Installation complete: $INSTALL_DIR/claunch"

# Configure PATH if needed
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "🔧 Configuring PATH..."
  
  # Detect shell and config file
  if [[ -n "$ZSH_VERSION" ]]; then
    SHELL_RC="$HOME/.zshrc"
  elif [[ -n "$BASH_VERSION" ]]; then
    if [[ -f "$HOME/.bashrc" ]]; then
      SHELL_RC="$HOME/.bashrc"
    else
      SHELL_RC="$HOME/.bash_profile"
    fi
  else
    # Try to detect from SHELL variable
    case "$SHELL" in
      */zsh)
        SHELL_RC="$HOME/.zshrc"
        ;;
      */bash)
        if [[ -f "$HOME/.bashrc" ]]; then
          SHELL_RC="$HOME/.bashrc"
        else
          SHELL_RC="$HOME/.bash_profile"
        fi
        ;;
      *)
        echo "⚠️ Could not detect shell type. Please manually add to your shell config:"
        echo 'export PATH="$HOME/bin:$PATH"'
        exit 0
        ;;
    esac
  fi
  
  # Add PATH export if not already present
  if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$SHELL_RC" 2>/dev/null; then
    echo '' >> "$SHELL_RC"
    echo '# Added by claunch installer' >> "$SHELL_RC"
    echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_RC"
    echo "✅ Added PATH to $SHELL_RC"
    echo "🔄 Please run: source $SHELL_RC"
    echo "   Or start a new terminal session"
  else
    echo "✅ PATH already configured in $SHELL_RC"
  fi
else
  echo "✅ $INSTALL_DIR is already in PATH"
fi
