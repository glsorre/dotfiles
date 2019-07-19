export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:"
export GREP_COLOR="37;45"
export GREP_COLORS="mt=37;45"

export LESS='-iR -j4 --shift 5 -P ?n?f%f .?m(file %i of %m) ..?ltlines %lt-%lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t'
export LESS_TERMCAP_mb=$'\E[6m'          # begin blinking
export LESS_TERMCAP_md=$'\E[34m'         # begin bold
export LESS_TERMCAP_us=$'\E[4;32m'       # begin underline
export LESS_TERMCAP_so=$'\E[47m'
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode


if [ -f $HOME/.local/bin/pygmentize ]; then
	export LESSOPEN="| $HOME/.local/bin/pygmentize %s"
fi

