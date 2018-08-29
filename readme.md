To install:

- `export DOTFILES=$HOME/.dotfiles && $DOTFILES/bin/dotfiles --setup`

- `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

- `sudo chmod -R 755 .antigen`


- for **wsl** add to .bashrc the following code
    ```
    if [ -f $HOME/.dotfiles/bash_wsl ]; then
        source $HOME/.dotfiles/bash_wsl
    fi` 
    ```

To do:

- [X] dotfiles setup script: avoid symlink for launchd plist
- [ ] dotfiles setup script: link `ssh/config` in `$HOME/.ssh/config`
- [X] dotfiles setup script: for linux and wsl

