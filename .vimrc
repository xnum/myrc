set nocompatible

set t_Co=256

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'avakhov/vim-yaml'

call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start
set number
set ruler
set showcmd
syntax on
set hlsearch
set incsearch
set cursorline

set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
" =======

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list
set listchars=tab:\│\ 

"folding
set foldenable
set foldmethod=syntax
set foldlevel=99
"set foldcolumn=3
"set foldnestmax=3
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap zr zR
inoremap <C-o> <C-x><C-o>

autocmd FileType make setlocal noexpandtab

let g:go_fmt_command = 'goimports'
let g:go_fmt_options = {
\ 'goimports': '-local github.com/xnum',
\ }

set colorcolumn=80
autocmd FileType gitcommit set colorcolumn=72

highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif
