export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
export CLICOLOR=1
export CLICOLOR_FORCE=1

export MSYS_ROOT="C:\\msys64"
export ANTIBODY_HOME="$HOME/.antibody"
export ANTIBODY_BIN="/home/giuse/bin"

AGKOZAK_BLANK_LINES=1

export ZSH=`antibody.exe home`
ZSH+="/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
plugins=(
	vi-mode
	git
	extract
	docker
	docker-compose				      
	)

setopt hist_ignore_all_dups 
setopt hist_reduce_blanks 
setopt inc_append_history 
setopt share_history 

autoload -Uz promptinit; promptinit

source <(antibody.exe init)
source <(antibody.exe bundle < $HOME/.dotfiles/antibody/zsh_plugins_msys.txt)

${DOTFILES}/bin/runonce ${DOTFILES}/bin/dotfiles.update

export PATH=/c/ProgramData/DockerDesktop/version-bin:/c/Program\ Files/Docker/Docker/resources/bin:$HOME/AppData/Local/Programs/Microsoft\ VS\ Code\ Insiders/bin:$HOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin:$HOME/AppData/Roaming/Python/Python38/Scripts:$HOME/.pyenv/pyenv-win/shims:$HOME/.pyenv/pyenv-win/bin:$PATH

source $DOTFILES/winconf/sshagent.sh
