docker build -t dotfiles-test .
docker run --rm -it -e "TERM=xterm-256color" -u root -w "/root/dotfiles" dotfiles-test /bin/zsh './install'
