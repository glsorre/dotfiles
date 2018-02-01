export DOTFILES=$HOME/.dotfiles
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -s "$DOTFILES/antigen.zsh" ]]; then
  source "$DOTFILES/antigen.zsh"

  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  antigen bundle osx
  antigen bundle python
  antigen bundle pip
  antigen bundle pyenv
  antigen bundle pyenv-virtualenv
  antigen bundle npm
  antigen bundle git-flow
  antigen bundle git

  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure

  # Tell Antigen that you're done.
  antigen apply
fi

setopt PROMPT_SUBST
RPROMPT+=' [py@$(pyenv_prompt_info)]'

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

fpath=(
  /usr/local/share/zsh-completions
  /usr/local/share/zsh/site-functions
  $fpath
)
