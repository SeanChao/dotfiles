sudo ()
{
    [[ $EUID = 0 ]] || set -- command sudo "$@"
    "$@"
}

sudo pip install wakatime
sudo apt install -y tmux
