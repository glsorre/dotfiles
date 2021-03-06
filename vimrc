if &term=~'linux'

else
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'vim-airline/vim-airline'
    Plug 'altercation/vim-colors-solarized'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'ciaranm/detectindent'
    Plug 'jiangmiao/auto-pairs'
    call plug#end()

    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"

    let g:airline_theme='solarized'

    syntax enable
    set background=light
    colorscheme solarized

    set ttymouse=xterm2
    set mouse=a
endif
