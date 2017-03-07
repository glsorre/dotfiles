alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias which='type'                          # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias cleanbrew="brew cleanup -s"
alias npmls="npm ls --depth 0 -g"
alias npmout="npm outdated --depth 0 -g"
alias arduino="/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub"
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias cask="brew cask"
alias gl="gl"

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

useconda () {
    if [ -f $HOME/anaconda3/bin/conda ]; then
        export OLD_PATH=$PATH
        export PATH=~/anaconda3/bin:$PATH;
        export RPROMPT='[CONDA]';
    fi;
}
usepy() {
    export PATH=$OLD_PATH; 
    export RPROMPT='';
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
