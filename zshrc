export DOTFILES=$HOME/.dotfiles
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

setopt PROMPT_SUBST

export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:$HOME/.yarn/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

runonce -i 1440 ${DOTFILES}/bin/dotfiles.update 

case `uname` in
  Darwin)
    # commands for OS X go here    
    if [ -f $HOME/.iterm2_shell_integration.`basename $SHELL` ]; then
      source $HOME/.iterm2_shell_integration.`basename $SHELL`
    fi
  ;;
  Linux)
    test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
    test -d /opt/bin && PATH="/opt/bin:$PATH"
    eval `dircolors $DOTFILES/sh/dir_colors`

    if [ -n "$DESKTOP_SESSION" ];then
      	eval $(gnome-keyring-daemon --start)
	      export SSH_AUTH_SOCK
    fi
    test -f /usr/bin/keychain && eval $(/usr/bin/keychain --eval --quiet id_rsa)

    if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
    fi
    
    umask 002
    
    if [ -f  $HOME/.sdkman/bin/sdkman-init.sh ]; then
	source "$HOME/.sdkman/bin/sdkman-init.sh"
    fi
  ;;
esac

if which antibody &>/dev/null; then
  _antibody_path=$(which antibody 2>/dev/null)
fi

if [ -n "$_antibody_path" ] && [ -x $_antibody_path ]; then
  DISABLE_AUTO_UPDATE=true
  ZSH=`antibody home`
  ZSH_THEME=""
  ZSH+="/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
  plugins=(
  vi-mode
  brew
  pip
  pyenv
  npm
  yarn
  nvm
  git
  extract
  aws
  docker
  docker-compose
  tmux
  mvn
  fzf
  terraform
  tig
  fd
  )

  case `uname` in
    Darwin)
      plugins+=(osx jenv)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_mac.txt")
    ;;
    Linux)
      plugins+=(sdk)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_linux.txt")
    ;; 
  esac

  source <($_antibody_path init)
fi

unset _antibody_path

autoload -Uz compinit
compinit -i

if [ -f $DOTFILES/sh/colors.zsh ]; then
    source $DOTFILES/sh/colors.zsh
fi

if [ -f $DOTFILES/sh/aliases.zsh ]; then
    source $DOTFILES/sh/aliases.zsh
fi

if [ -f $HOME/.me.zsh ]; then
    source $HOME/.me.zsh
fi

if [ -f /usr/local/miniconda3/etc/profile.d/conda.sh ]; then
    source /usr/local/miniconda3/etc/profile.d/conda.sh
fi

if [ -f $DOTFILES/sh/bindkeys.zsh ]; then
    unset RPS1 # delete oh-my-zsh vi-mode visualization
    source $DOTFILES/sh/bindkeys.zsh
fi

if typeset -f sdk > /dev/null; then
    compdef _sdk sdk
fi

if [ -f /home/glsorre/.local/bin/pipx ] || [ -f /usr/local/bin/pipx ]; then
    eval "$(register-python-argcomplete pipx)"
fi

if [ -f /home/glsorre/.local/bin/pipenv ] || [ -f /usr/local/bin/pipenv ]; then
    export PIPENV_VERBOSITY=-1   
fi

export FZF_DEFAULT_OPTS="--color light --preview 'bat {}' --inline-info"
