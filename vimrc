set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dracula/vim'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'uarun/vim-protobuf'
Plugin 'hashivim/vim-terraform'
Plugin 'ctrlpvim/ctrlp.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax highlighting
syntax on 
" colorscheme dracula 
" show line numbers
set number
" set guifont=Source\ Code\ Pro:h14
" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch
" set nobackup
" set nowb
" set noswapfile
set backspace=indent,eol,start

" nerdtree show dotfiles
let NERDTreeShowHidden=1

" enable all Python syntax highlighting features
let python_highlight_all = 1
set foldmethod=indent
set foldlevel=99

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

let mapleader=","
nnoremap ,g :YcmCompleter GoToDeclaration<CR>
nnoremap gg :GoDef<CR>
nnoremap nt :NERDTreeToggle<CR>

nnoremap <space> za

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

