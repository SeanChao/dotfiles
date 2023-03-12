sudo ()
{
    [[ $EUID = 0 ]] || set -- command sudo "$@"
    "$@"
}

sudo apt-get update >/dev/null && \
    sudo apt-get install -y curl python3 python3-pip tmux zsh
