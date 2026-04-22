#!/bin/zsh
set -e

echo "Installing fzf (fuzzy finder)"

# Install fzf using the official installation script
FZF_DIR="$HOME/.fzf"
# Skip only when both binary and shell integration files are already present
if command -v fzf >/dev/null 2>&1 \
  && [ -f "$FZF_DIR/shell/key-bindings.zsh" ] \
  && [ -f "$FZF_DIR/shell/completion.zsh" ]; then
    echo "fzf and shell integration are already installed, skipping..."
    exit 0
fi

if [ -d "$FZF_DIR" ]; then
    echo "fzf directory exists, updating..."
    cd "$FZF_DIR" && git pull && cd -
else
    git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
fi

# Run the install script (non-interactive)
"$FZF_DIR/install" --bin --no-update-rc

echo "fzf installation complete!"
echo "Note: You may need to reload your shell or run: source ~/.zshrc"

