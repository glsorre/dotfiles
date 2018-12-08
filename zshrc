export DOTFILES=$HOME/.dotfiles
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

setopt PROMPT_SUBST

export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
    
    # ssh-agent configuration
    #if [ -z "$(pgrep ssh-agent)" ]; then
    #    rm -rf /tmp/ssh-*
    #    eval $(ssh-agent -s) > /dev/null
    #else
    #    export SSH_AGENT_PID=$(pgrep ssh-agent)
    #    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name "agent.*")
    #fi
    
    #if [ "$(ssh-add -l)" = "The agent has no identities." ]; then
    #    ssh-add
    #fi

    test -f /usr/bin/keychain && /usr/bin/keychain -q id_rsa
    if [ -f $HOME/.keychain/`uname -n`-sh ]; then
      source $HOME/.keychain/`uname -n`-sh
    fi
    
    umask 002
  ;;
esac

autoload -Uz compinit

if which antibody &>/dev/null; then
  _antibody_path=$(which antibody 2>/dev/null)
fi

if [ -n "$_antibody_path" ] && [ -x $_antibody_path ]; then
  DISABLE_AUTO_UPDATE=true
  ZSH=`antibody home`
  ZSH+="/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
  plugins=(
  brew
  pip
  pyenv
  npm
  npx
  git
  git-flow
  command-not-found
  colored-man-pages
  extract
  aws
  docker
  docker-compose
  )
 
  source <($_antibody_path init)

  case `uname` in
    Darwin)
      plugins+=(osx)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_mac.txt")
    ;;
    Linux)
      plugins+=(ubuntu)
      source <(eval $_antibody_path "bundle < $DOTFILES/antibody/zsh_plugins_linux.txt")
    ;; 
  esac
fi

compinit -i

unset _antibody_path

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

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
#SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
#SPACESHIP_DIR_TRUNC=''

# GIT
# Disable git symbol
#SPACESHIP_GIT_SYMBOL="" # disable git prefix
#SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
#SPACESHIP_GIT_PREFIX='git:('
#SPACESHIP_GIT_SUFFIX=") "
#SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
#SPACESHIP_GIT_STATUS_PREFIX=""
#SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
#SPACESHIP_NODE_PREFIX="node:("
#SPACESHIP_NODE_SUFFIX=") "
#SPACESHIP_NODE_SYMBOL=""

# RUBY
#SPACESHIP_RUBY_PREFIX="ruby:("
#SPACESHIP_RUBY_SUFFIX=") "
#SPACESHIP_RUBY_SYMBOL=""

# XCODE
#SPACESHIP_XCODE_PREFIX="xcode:("
#SPACESHIP_XCODE_SUFFIX=") "
#SPACESHIP_XCODE_SYMBOL=""

# SWIFT
#SPACESHIP_SWIFT_PREFIX="swift:("
#SPACESHIP_SWIFT_SUFFIX=") "
#SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
#SPACESHIP_GOLANG_PREFIX="go:("
#SPACESHIP_GOLANG_SUFFIX=") "
#SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
#SPACESHIP_DOCKER_PREFIX="docker:("
#SPACESHIP_DOCKER_SUFFIX=") "
#SPACESHIP_DOCKER_SYMBOL=""

# VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
#SPACESHIP_PYENV_PREFIX="python:("
#SPACESHIP_PYENV_SUFFIX=") "
#SPACESHIP_PYENV_SYMBOL=""
