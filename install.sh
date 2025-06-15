#!/bin/bash

set -e

INSTALL_DIR="$HOME/bin"
BASE_URL="https://raw.githubusercontent.com/0xkaz/claunch/main/bin"

echo "📦 Installing claunch to $INSTALL_DIR..."

mkdir -p "$INSTALL_DIR"

# Install main script
curl -fsSL "$BASE_URL/claunch" -o "$INSTALL_DIR/claunch"
chmod +x "$INSTALL_DIR/claunch"

echo "✅ Installation complete: $INSTALL_DIR/claunch"

# Configure PATH if needed
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "🔧 Configuring PATH..."
  
  # Function to add PATH to a shell config file
  add_to_path() {
    local config_file="$1"
    if [[ -f "$config_file" ]] || [[ "$config_file" == *".zshrc" ]] || [[ "$config_file" == *".bashrc" ]] || [[ "$config_file" == *".bash_profile" ]]; then
      if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$config_file" 2>/dev/null; then
        echo '' >> "$config_file"
        echo '# Added by claunch installer' >> "$config_file"
        echo 'export PATH="$HOME/bin:$PATH"' >> "$config_file"
        echo "✅ Added PATH to $config_file"
        return 0
      else
        echo "✅ PATH already configured in $config_file"
        return 1
      fi
    fi
    return 2
  }
  
  # Add to common shell config files
  added=false
  
  # Add to zsh config
  if add_to_path "$HOME/.zshrc"; then
    added=true
  fi
  
  # Add to bash config
  if [[ -f "$HOME/.bashrc" ]]; then
    if add_to_path "$HOME/.bashrc"; then
      added=true
    fi
  else
    if add_to_path "$HOME/.bash_profile"; then
      added=true
    fi
  fi
  
  if [[ "$added" == true ]]; then
    echo ""
    echo "🔄 To use claunch immediately, run one of:"
    echo "   source ~/.zshrc     (for zsh)"
    echo "   source ~/.bashrc    (for bash)"
    echo "   source ~/.bash_profile (for bash)"
    echo ""
    echo "Or start a new terminal session"
  fi
else
  echo "✅ $INSTALL_DIR is already in PATH"
fi
