" ~/.vimrc
" Cullen Rhodes [rhodes.cullen@gmail.com]

" vim-plug configuration (package manager)
" https://github.com/junegunn/vim-plug

" :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'  " Syntax checking
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dylon/vim-antlr'
Plug 'sukima/xmledit'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'dkprice/vim-easygrep'

" Initialize plugin system
call plug#end()

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

set omnifunc=syntaxcomplete#Complete
set nu

syntax enable
colorscheme default 
set background=light
set backspace=2

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set colorcolumn=120
:hi ColorColumn guibg=#2d2d2d ctermbg=246

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_include_dirs = ['/home/cullenrhodes/workspace/llvm/llvm/include/']
let g:syntastic_cpp_include_dirs = ['/home/cullenrhodes/workspace/llvm/install/include']

" LLVM Ctags index
:set tags+=$HOME/workspace/llvm/llvm/tags

" CTAGS
" -----
" Ctrl + [ - Open definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
