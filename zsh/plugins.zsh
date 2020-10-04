echo "Installing ZSH plugins"
PLUGIN_PATH=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
rm -rf ${PLUGIN_PATH}/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${PLUGIN_PATH}/zsh-syntax-highlighting
rm -rf ${PLUGIN_PATH}/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${PLUGIN_PATH}/zsh-autosuggestions
