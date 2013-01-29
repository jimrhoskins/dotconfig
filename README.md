Config for my zsh, tmux, and powerline

    git clone git@github.com:jimrhoskins/dotconfig.git $HOME/.config
    mv $HOME/.tmux.conf $HOME/.tmux.conf.old
    mv $HOME/.zshrc $HOME/.zshrc.old
    ln -s $HOME/.config/tmux.conf $HOME/.tmux.conf
    ln -s $HOME/.config/zshrc $HOME/.zshrc
