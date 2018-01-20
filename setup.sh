DOT_FILES=(.zshrc .tmux.conf .vimrc .gitconfig .gitignore .gitignore_global)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/.dotfiles/$file $HOME/$file
done
ln -s $HOME/.dotfiles/.vimrc $HOME/.config/nvim/init.vim
