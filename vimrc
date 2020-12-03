set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fisadev/vim-isort'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'uarun/vim-protobuf'
Plugin 'hashivim/vim-terraform'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mileszs/ack.vim'

Plugin 'haishanh/night-owl.vim'
Plugin 'dracula/vim'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax highlighting
syntax enable
colorscheme onedark
" colorscheme solarized
" set background=light
" show line numbers
set number
" set guifont=Source\ Code\ Pro:h14
set guifont=Ubuntu\ Mono:h16
set antialias
set linespace=4
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

" use clipboard to paste from yy
set clipboard=unnamed
" nerdtree show dotfiles
let NERDTreeShowHidden=1

" enable all Python syntax highlighting features
let python_highlight_all = 1
set foldmethod=indent
set foldlevel=99

let g:terraform_align=1
let g:terraform_fold_sections=1
" let g:terraform_fmt_on_save=1

let mapleader=","
nnoremap <Leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>G :GoDef<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>

" folding
nnoremap <space> za

if executable('rg')
  " Use rg over Grep
  set grepprg=rg

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --glob ""'
  let g:ctrlp_use_caching = 0
endif

" ack.vim --- {{{
" 
" I used this link as a guide to this ack setup: 
" https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
"
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" vim-airline --- {{{
" let g:airline_powerline_fonts = 1                                 " Enable powerline fonts
let g:airline#extensions#tabline#enabled = 1                      " Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                   " Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'               " Right separator for tabline
let g:airline#extensions#tabline#fnamemod = ':t'                  " Show just the filename
" let g:airline_theme='gruvbox'

" Customize airline content
"+-----------------------------------------------------------------------------+
"| A | B |                     C                            X | Y | Z |  [...] |
"+-----------------------------------------------------------------------------+<Paste>
" remove encoding text & devicon
au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh
let g:airline_section_y = ''
" Line number/Total lines | Column Number with right padding
let g:airline_section_z='%4l/%L : %-3v'
" disable +32 ~9 -0 hunks information in airline section B
let g:airline#extensions#hunks#enabled = 0
" }}}

