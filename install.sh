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

# Install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installation complete. Enter vim and type :PluginInstall"
