export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export ZSH_PYENV_QUIET=true
export DOTFILES=$HOME/.dotfiles
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

setopt PROMPT_SUBST

export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

case `uname` in
  Darwin)
    test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true
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

    if [ $TILIX_ID ]; then
        source /etc/profile.d/vte.sh
    fi
    
    umask 002
    
    if [ -f  $HOME/.sdkman/bin/sdkman-init.sh ]; then
	    source "$HOME/.sdkman/bin/sdkman-init.sh"
    fi

    export GPG_TTY=$(tty)
  ;;
  MINGW64*|MINGW32*|MSYS_NT*)
    test -f $DOTFILES/winconf/sshagent.sh &&  source $DOTFILES/winconf/sshagent.sh
esac

if [ -f /opt/homebrew/bin/antibody ]; then
  _antibody_path=/opt/homebrew/bin/antibody
fi

if [ -f /usr/local/bin/antibody ]; then
  _antibody_path=/usr/local/bin/antibody
fi

if [ -f $HOME/bin/antibody ]; then
  _antibody_path=$HOME/bin/antibody
fi

test -f $HOME/omni-socat/ubuntu-bash-setup.sh && source $HOME/omni-socat/ubuntu-bash-setup.sh

runonce -i 1440 ${DOTFILES}/bin/dotfiles.update $_antibody_path

if [ -n "$_antibody_path" ] && [ -x $_antibody_path ]; then
  DISABLE_AUTO_UPDATE=true
  ZSH=`$_antibody_path home`
  ZSH_THEME=""
  ZSH+="/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
  plugins=(
  brew
  python
  pip
  pyenv
  npm
  yarn
  nvm
  git
  aws
  docker
  docker-compose
  tig
  flutter
  )

  source <($_antibody_path init)

  case `uname` in
    Darwin)
      plugins+=(macos fzf)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_mac.txt")
    ;;
    Linux)
      plugins+=(sdk fzf)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_linux.txt")
    ;;
    MINGW64*|MINGW32*|MSYS_NT*)
      plugins+=()
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_msys.txt")
    ;;
  esac
fi

unset _antibody_path

if which starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

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
    source $DOTFILES/sh/bindkeys.zsh
fi

if typeset -f sdk > /dev/null; then
    compdef _sdk sdk
fi

if [ -f /home/glsorre/.local/bin/pipx ] || [ -f /usr/local/bin/pipx ]; then
    eval "$(register-python-argcomplete pipx)"
fi

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export FZF_DEFAULT_OPTS="--color light --preview 'bat {}' --inline-info"



