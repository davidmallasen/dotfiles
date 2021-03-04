START_DIR=$(pwd)

SYMLINK=(bash_aliases bashrc inputrc vimrc vim tmux.conf)

function linkdotfile {
    file="$1"
    ln -s ~/dotfiles/$file ~/.$file
}

for file in ${SYMLINK[@]}; do
    linkdotfile $file
    echo "Linking $file"
done

echo "Installation complete"
