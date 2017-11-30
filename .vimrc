" allows usage of vi
set nocompatible

filetype off

" set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" code completion engine
Plugin 'valloric/youcompleteme'

" syntax check
Plugin 'scrooloose/syntastic'

" tab insert completion
Plugin 'ervandew/supertab'

call vundle#end()

filetype plugin indent on

" allow mouse
" set mouse=a

" disable error bells
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIENTER * set visualbell t_vb=
endif

" color scheme
set t_Co=16
set background=dark
colorscheme alduin
let g:alduin_Shout_Aura_Whisper = 1
" colorscheme industry

" number of visual spaces per tab
set autoindent
set shiftwidth=2
set tabstop=2
set noexpandtab

" show line numbers
set number
set foldcolumn=0
" :hi NonText guifg=bg

" highlight matching braces
set showmatch

" syntax is on
syntax enable

" display row/col
set ruler

" text wrap and text width
set wrap
set textwidth=79

" three lines below cursor when scrolling
set scrolloff=3

" assigning leader key as space
let mapleader = "\<space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>h 0
nnoremap <Leader>j G
nnoremap <Leader>k gg
nnoremap <Leader>l $
nnoremap <Leader>d 0D"_dd
nnoremap <Leader>p o<Esc>p

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"inoremap {<CR> {<CR><Tab><CR>}<Up><Right>
inoremap {<CR> {<CR>}<Esc>O

" reload .vimrc
nnoremap <leader>a :source $MYVIMRC<CR>
