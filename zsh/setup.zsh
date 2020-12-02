GIT_ZSHRC_REPO="https://gist.github.com/61fb1f7a0f62ae2c5c3407bfd725b293.git"
GIT_ZSHTHEME_REPO="https://gist.github.com/ce275f06047a51b3d9a3bac7828dfea0.git"

# install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc /tmp/.zshrc.old # remove old zshrc file

## clone chaos.zsh.theme
echo "Install my theme"
rm -r /tmp/chaos.zsh.theme >/dev/null
git clone $GIT_ZSHTHEME_REPO /tmp/chaos-theme-tmp
cp /tmp/chaos-theme-tmp/chaos.zsh-theme ~/.oh-my-zsh/custom/themes/
rm -r /tmp/chaos-theme-tmp >/dev/null

echo 'Run chsh -s $(which zsh) manually to set zsh as default shell'
