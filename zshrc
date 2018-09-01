export DOTFILES=$HOME/.dotfiles
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

setopt PROMPT_SUBST
#RPROMPT+=' [py@$(pyenv_prompt_info)]'

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
    #eval "$(pyenv init -)"
    eval $(ssh-agent)
    eval `dircolors $DOTFILES/dir_colors`
  ;;
esac

if [[ -s "$DOTFILES/antigen.zsh" ]]; then
  source "$DOTFILES/antigen.zsh"

  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  case `uname` in
  Darwin)
    # commands for OS X go here
    antigen bundle osx
  ;;
  Linux)
    # commands for Linux go here
  ;;
  esac

  antigen bundle brew
  antigen bundle python
  antigen bundle pip
  antigen bundle pyenv
  antigen bundle npm
  antigen bundle git
  antigen bundle git-flow
  antigen bundle command-not-found
  antigen bundle colored-man-pages
  antigen bundle extract

  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions

  antigen bundle unixorn/autoupdate-antigen.zshplugin

#  antigen bundle mafredri/zsh-async
#  antigen bundle sindresorhus/pure

  antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

  # Tell Antigen that you're done.
  antigen apply
fi

if [ -f "$DOTFILES/colors.zsh" ]; then
    source $DOTFILES/colors.zsh
fi

if [ -f $DOTFILES/aliases.zsh ]; then
    source $DOTFILES/aliases.zsh
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
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC=''

# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
SPACESHIP_NODE_PREFIX="node:("
SPACESHIP_NODE_SUFFIX=") "
SPACESHIP_NODE_SYMBOL=""

# RUBY
SPACESHIP_RUBY_PREFIX="ruby:("
SPACESHIP_RUBY_SUFFIX=") "
SPACESHIP_RUBY_SYMBOL=""

# XCODE
SPACESHIP_XCODE_PREFIX="xcode:("
SPACESHIP_XCODE_SUFFIX=") "
SPACESHIP_XCODE_SYMBOL=""

# SWIFT
SPACESHIP_SWIFT_PREFIX="swift:("
SPACESHIP_SWIFT_SUFFIX=") "
SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
SPACESHIP_GOLANG_PREFIX="go:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL=""

# VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "
SPACESHIP_PYENV_SYMBOL=""
