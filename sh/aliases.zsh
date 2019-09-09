alias c='clear'                             # c:            Clear terminal display
alias which='type'                          # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias npmls="npm ls --depth 0 -g"
alias npmout="npm outdated --depth 0 -g"
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias la="ls -a"
alias l="ls -la"
alias cleanbrew="brew cleanup -s"
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

case `uname` in
  Darwin)
    # commands for OS X go here
    alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
    alias cask="brew cask"
  ;;
  Linux)
    alias f="nohup nautilus -w . > /dev/null &"
  ;;
esac
