" ~/.vimrc
" Cullen Rhodes [rhodes.cullen@gmail.com]

"                                STARTVUNDLE
" https://github.com/VundleVim/Vundle.vim/issues/414
" ____________________________________________________________________________

function s:StartVundle()

  filetype off
  call vundle#rc()

  Plugin 'gmarik/vundle'

  " __ GITHUB _________________________________

  Plugin 'altercation/vim-colors-solarized'
  Plugin 'itchyny/lightline.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'majutsushi/tagbar'
  Plugin 'fs111/pydoc.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-fugitive'
  Plugin 'gregsexton/gitv'
  Plugin 'Lokaltog/powerline'
  Plugin 'tpope/vim-pathogen'
  Plugin 'ctrlpvim/ctrlp.vim'

  " Syntastic checker-ek:
  " c:      gcc, splint
  " python: flake8, pylint

  " __ VIM-SCRIPTS ____________________________

  Plugin 'Align',
  Plugin 'EasyGrep',
  Plugin 'NumUtils',
  Plugin 'vis'

  " __ OTHER REPOS ____________________________

  " Plugin 'git://git.wincent.com/command-t.git'

  " __ LOCAL REPOS ____________________________

  Plugin 'file://~/.vim/bundle/vegyes'

  filetype plugin indent on

endfunction

"                               INSTALLVUNDLE
" ____________________________________________________________________________
"
" Cloning vundle to ~/.vim/bundle/vundle

function s:InstallVundle()

  let vundle_repo = 'https://github.com/gmarik/vundle.git'
  let path = substitute( $HOME . '/.vim/bundle/vundle', '/', has( 'win32' ) ? '\\' : '/', 'g' )

  if system( 'git --version' ) !~ '^git'
    echohl WarningMsg | echomsg 'Git is not available.' | echohl None
    return
  endif

  let install = confirm( 'Install vundle?', "&Yes\n&No", 2, 'Qusetion' )
  if install == 2
    return
  endif

  if ! isdirectory( path )
    silent! if ! mkdir( path, 'p' )
      echohl ErrorMsg | echomsg 'Cannot create directory (may be a regular file): ' . path | echohl None
      return
    endif
  endif

  echo 'Cloning vundle...'
  if system( 'git clone "' . vundle_repo . '" "' . path . '"'  ) =~ 'fatal'
    echohl ErrorMsg | echomsg 'Cannot clone ' . vundle_repo . ' (' . path . ' may be not empty)' | echohl None
    return
  endif

  call s:StartVundle()
  PluginInstall

endfunction

"                           START / INSTALL VUNDLE
" ____________________________________________________________________________

set nocompatible
set runtimepath+=$HOME/.vim/bundle/vundle/
runtime autoload/vundle.vim

if ! exists( '*vundle#rc' )
  autocmd  VimEnter  *  call s:InstallVundle()
else
  call s:StartVundle()
endif

execute pathogen#infect()
syntax on
filetype indent plugin on

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
