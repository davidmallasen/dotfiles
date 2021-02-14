START_DIR=$(pwd)

FILES=(bash_aliases bashrc gitconfig inputrc vimrc tmux.conf)

function linkdotfile {
    file="$1"
    ln -s ~/dotfiles/$file ~/.$file
}

for file in ${FILES[@]}; do
    linkdotfile $file
    echo "Linking $file"
done

# Install vim
if [ ! -d "~/.vim" ]
then
    echo "Installing vim"

    mkdir -p ~/.vim/pack/vendor/start/

    linkdotfile vim/colors

    cd ~/.vim/pack/vendor/start/
    git clone https://github.com/preservim/nerdtree.git
    git clone https://github.com/vhda/verilog_systemverilog.vim.git
    git clone https://github.com/kylelaker/riscv.vim.git
    git clone https://github.com/plasticboy/vim-markdown.git
    cd $START_DIR

    echo "Installing vim complete"
fi

echo "Installation complete"
