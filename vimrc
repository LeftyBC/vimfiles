let mapleader = ',' " remap <LEADER>, defaults to \

filetype off
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on


set nocompatible
set autoindent
set paste

syntax on
set shiftwidth=4
set tabstop=4
set ruler
set expandtab
set hlsearch
set bs=2
set nobackup
set nowritebackup
set gfn=Andale_Mono:h14

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

set visualbell t_vb=

set background=dark

set number
set gdefault
set incsearch
set showmatch
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler

set t_Co=256
"colorscheme desert256
colorscheme solarized


if version >= 703
    set colorcolumn=81
endif

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
" One way to make sure to remove all training whitespace in a file is to set
" an autocmd in your .vimrc file. Everytime the user issue a :w command, Vim
" will automatically remove all trailing whitespace before saving.
autocmd BufWritePre *.pp :%s/\s\+$//e

augroup xml
	autocmd FileType xml set sw=2
	autocmd FileType xml set ts=2
	autocmd FileType xml set foldmethod=syntax
	autocmd FileType xml set foldlevel=1
augroup end

au BufRead,BufNewFile *.pp   setfiletype puppet

Helptags

"lign command to align fat comma's, do need to visual select first
vmap <LEADER>= :Align =><CR>

" map for syntastic errors window
nnoremap <LEADER>e :Errors<CR>

" autoclose syntastic's error windown when no errors
let g:syntastic_auto_loc_list=2

" enable puppet module detection
let g:puppet_module_detect=1

" keep current visual block selection on indent
vmap > >gv
vmap < <gv

" set up a quick record shortcut
" record with qq, stop with q, playback with Q
nnoremap Q @q

let g:Powerline_symbols = 'fancy'


