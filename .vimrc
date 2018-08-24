set nocompatible

set t_Co=256

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

Plugin 'scrooloose/syntastic'

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_compiler_options = '-I/usr/include/openmpi -std=c++11 '
let g:syntastic_c_compiler_options = '-I/usr/include/openmpi'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '?'

augroup mySyntastic
        au!
        au FileType tex let b:syntastic_mode = "passive"
augroup END

hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
" =======

let g:neocomplete#enable_at_startup = 1

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

set colorcolumn=80
autocmd FileType gitcommit set colorcolumn=72

highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif
