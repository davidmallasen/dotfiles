START_DIR=$(pwd)

SYMLINK=(bash_aliases bashrc inputrc vimrc vim tmux.conf)

function linkdotfile {
    file="$1"
    ln -sibn --suffix=_backup ~/dotfiles/$file ~/.$file
}

for file in ${SYMLINK[@]}; do
    echo "Linking $file"
    linkdotfile $file
done

echo "Installation complete"
