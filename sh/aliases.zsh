alias c='clear'                             # c:            Clear terminal display
alias ck="printf '\033[2J\033[3J\033[1;1H'"
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
    if grep -q microsoft /proc/version; then
      alias f="explorer.exe ."
    else
      alias f="nohup nautilus . > /dev/null 2>&1 &"
    fi
  ;;
  MINGW64*|MINGW32*|MSYS_NT*)
    alias f="explorer.exe ."
  ;;
esac

if (( $+commands[eza] )); then
  eza_params=('--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group')

  unalias ls
  unalias l
  unalias la
  unalias ll
  
  function ls(){
    eza "${eza_params[@]}" $@
  }
  
  function l(){
    eza -la --grid "${exa_params[@]}" $@
  }
  
  function la(){
    eza -a "${eza_params[@]}" $@
  }
  
  function ll(){
    eza -la --git-ignore --grid "${eza_params[@]}" $@
  }
fi
