set nocompatible

set t_Co=256

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-fugitive'

Plugin 'xsbeats/vim-blade'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'maksimr/vim-jsbeautify'

Plugin 'mhinz/vim-signify'

Plugin 'fatih/vim-go'

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

nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup=0

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


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd FileType cpp nmap <F1> :make<CR>

"folding
set foldenable 
set foldmethod=indent
set foldlevel=1
"set foldcolumn=3
"set foldnestmax=3
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap zr zR

autocmd FileType make setlocal noexpandtab
