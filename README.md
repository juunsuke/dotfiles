

git clone --bare https://github.com/juunsuke/dotfiles.git $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
