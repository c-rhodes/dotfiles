" ~/.vimrc
" Cullen Rhodes [rhodes.cullen@gmail.com]

" vim-plug scripts
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'  " Syntax checking

" Initialize plugin system
call plug#end()
" End vim-plug script

" General options
set tabstop=4       " set tab width to 4
set shiftwidth=4    " shift command shifts chars (indent width)
set softtabstop=4   " the number of columns for a tab
set expandtab       " expand tab characters to spaces
set autoindent      " use autoindent
set ruler           " display a ruler
set nu              " display line numbers
set textwidth=0     " turn off wordwrap while editing
set colorcolumn=81  " display a bar at 81 columns
set history=1000    " increase command history
set incsearch       " incrementally search during / command
set backspace=indent,eol,start " make backspace delete lots of things

" Use the tab completion menu and ignore certain files
if has("wildmenu")
    set wildmenu
    set wildignore+=*~,*.pyc,*.pyd,*.pyo,*.P
endif

" Syntax highlighting
if has("syntax")
    syntax on
    syntax sync fromstart
endif

" Enable filetype detection
if has("eval")
    filetype on
    filetype plugin on    " activate file type matching & plugins
    filetype indent on    " activate file type specific indenting
endif

" Syntastic config
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_include_dirs = [
    \'/home/cullenrhodes/workspace/llvm/llvm/include/'
    \]
let g:syntastic_cpp_include_dirs = [
    \'/home/cullenrhodes/workspace/llvm/install/include'
    \]
