export DOTFILES=$HOME/.dotfiles
export ZPREZTODIR=$DOTFILES/prezto
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

if [[ -s "$DOTFILES/prezto/init.zsh" ]]; then
  source "$DOTFILES/prezto/init.zsh"
fi

if [[ -s "$DOTFILES/zsh-python-prompt/zshrc.zsh" ]]; then
  source "$DOTFILES/zsh-python-prompt/zshrc.zsh"
fi

RPROMPT+=' $ZSH_PYTHON_PROMPT'

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f "$DOTFILES/colors.zsh" ]; then
    source $DOTFILES/colors.zsh
fi

if [ -f $DOTFILES/aliases.zsh ]; then
    source $DOTFILES/aliases.zsh
fi

if [ -f $HOME/.me.zsh ]; then
    source $HOME/.me.zsh
fi

if [ -f $HOME/.iterm2_shell_integration.`basename $SHELL` ]; then
    source $HOME/.iterm2_shell_integration.`basename $SHELL`
fi

if [ -f /usr/local/anaconda3/bin/conda ]; then
    export PATH="/usr/local/anaconda3/bin:$PATH";
fi;
