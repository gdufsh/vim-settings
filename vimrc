if has("win32") || has("win16")
    language messages en
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add your plugin
Plugin 'scrooloose/nerdtree'           " directory preview
Plugin 'godlygeek/tabular'             " alignment by selected label
"Plugin 'ctrlpvim/ctrlp.vim'            " find label
Plugin 'Auto-Pairs'                    " auto pairs
Plugin 'Vimjas/vim-python-pep8-indent' " python pep8 indent
Plugin 'junegunn/seoul256.vim'         " color scheme
Plugin 'vim-airline/vim-airline'       " status/tabline
Plugin 'mhinz/vim-signify'             " show differences
Plugin 'SirVer/ultisnips'              " snippets engine
Plugin 'honza/vim-snippets'            " snippets instances
Plugin 'Yggdroot/LeaderF'              " locating files
Plugin 'w0rp/ale'                      " asynchronous lint engine
Plugin 'Valloric/YouCompleteMe'        " code-completion engine

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" leader key
let mapleader=","

" toggle paste mode
set pastetoggle=<F9>

" enable syntax
syntax on

" file encoding and decoding order
set encoding=utf-8
set fileencodings=utf-8,chinese,gbk,gb2312,cp936,cp950,gb18030,ucs-bom,utf-16,latin1

" indent
set smartindent
set autoindent

" indent with 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" show lineno
set number

" highlight serach
set hlsearch
set incsearch

" auto save when switch buffer
set autowrite

" expand keyword definition
set iskeyword+=_,$,@,%

" fold setting
set foldmethod=indent
set nofoldenable

" tags setting
"set autochdir
"set tags=./tags;$HOME

" set tab visible.
autocmd WinEnter,BufEnter,BufNewFile,BufRead * 2match TabLineFill /\t/

" 0 same as “:set backspace=” (Vi compatible)
" 1 same as “:set backspace=indent,eol”
" 2 same as “:set backspace=indent,eol,start”
set backspace=2

" Python settings
autocmd filetype python set colorcolumn=80
autocmd filetype python set foldmethod=indent
autocmd filetype python nnoremap <space> za
autocmd filetype python set foldnestmax=2
autocmd WinEnter,BufEnter,BufNewFile,BufRead *.py match Error /[\t ]\+$/
autocmd filetype python let g:syntastic_quiet_messages = { "type": "style" }
autocmd filetype python set et
fu! _SetUtf8()
    call append(0, "# -*- coding: utf-8 -*-")
    set fileencoding=utf-8
endfunction
autocmd filetype python nmap <leader>u :call _SetUtf8()<CR>

" NERD tree
" Disable directory arrows so nerdtree works on (almost) every terminal.
let g:NERDTreeDirArrows=0
" Automatically Change Current Working Directory
let NERDTreeChDirMode=2
" Ingore Files or Directories
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree
nmap <F3> :NERDTreeToggle<CR>

" ctrlp
"let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll|pyc)$',
"  \ }
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"  " Use ag in CtrlP for listing files.
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"  " Ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif

" tabular
nnoremap <leader>t :Tab/
vnoremap <leader>t :Tab/

" Unified color scheme
colorscheme seoul256

" UitlSnips
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
\ 'c,cpp,python': ['re!\w{2}'],
\ }
let g:ycm_filetype_blacklist = {
\ 'tagbar' : 1,
\ 'nerdtree' : 1,
\}

