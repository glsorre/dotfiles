To install:

- `export DOTFILES=$HOME/.dotfiles && $DOTFILES/bin/dotfiles --setup`

- `curl -sL git.io/antibody | sh -s` or `brew install getantibody/tap/antibody`

- `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

- for **wsl** add to .bashrc the following code
    ```
    if [ -t 1 ]; then
        exec zsh
    fi
    ```

