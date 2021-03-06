set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32") || has("win16")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$HOME/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add your plugin
Plugin 'scrooloose/nerdtree'           " directory preview
Plugin 'godlygeek/tabular'             " alignment by selected label
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
Plugin 'jremmen/vim-ripgrep'           " use RipGrep in Vim
Plugin 'yssl/QFEnter'                  " open items from location list
Plugin 'fatih/vim-go'                  " go development plugin

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

" set tab visible.
autocmd WinEnter,BufEnter,BufNewFile,BufRead * 2match TabLineFill /\t/

" highlight redundant whitespace
highlight BadWhitespace ctermbg=1 guibg=red
autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h,*.go match BadWhitespace /\s\+$/

" search for the file named 'tags', starting with the directory of the current
" file and then going to the parent directory and then recursively to the
" directory one level above, till it either locates the 'tags' file or reaches
" the root directory
set tags=./.tags;

" 0 same as “:set backspace=” (Vi compatible)
" 1 same as “:set backspace=indent,eol”
" 2 same as “:set backspace=indent,eol,start”
set backspace=2

" tabs split
nnoremap <leader>ts :tab split<CR>

" split a window for the directory which current file is in
nnoremap <leader>hs :split %:p:h<CR>
nnoremap <leader>vs :vsplit %:p:h<CR>

" window resize
nnoremap <leader>hr :resize +5
nnoremap <leader>vr :vertical resize +5

" Python settings
autocmd filetype python set colorcolumn=80
autocmd filetype python set foldmethod=indent
autocmd filetype python nnoremap <space> za
autocmd filetype python set foldnestmax=2
autocmd filetype python let g:syntastic_quiet_messages = { "type": "style" }
autocmd WinEnter,BufEnter,BufNewFile,BufRead *.py match Error /[\t ]\+$/
autocmd BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Go settings
au BufNewFile,BufRead *.go
    \ set noexpandtab |
    \ set smartindent |
    \ set fileformat=unix

" NERD tree
" Disable directory arrows so nerdtree works on (almost) every terminal.
let g:NERDTreeDirArrows=0
" Automatically Change Current Working Directory
let NERDTreeChDirMode=2
" Ingore Files or Directories
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$']
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree
nmap <F3> :NERDTreeToggle<CR>

" tabular
nnoremap <leader>= :Tab/
vnoremap <leader>= :Tab/

" Unified color scheme
colorscheme seoul256

" LeaderF settings
let g:Lf_DefaultMode='FullPath'
let g:Lf_CommandMap = {'<C-]>': ['<C-V>'], '<C-X>': ['<C-H>']}
let g:Lf_WildIgnore = {
\ 'dir': ['.svn','.git','.hg'],
\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
\}

" ALE settings
let g:ale_linters = {
\    'python': ['flake8'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\}
let g:ale_python_black_options = "--line-length=79"
nnoremap <leader>af :ALEFix 
nnoremap <leader>as :ALEFixSuggest

" YouCompleteMe settings
let g:ycm_key_list_select_completion = ["<tab>"]
let g:ycm_confirm_extra_conf=0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python': ['re!\w{2}'],
\ }
let g:ycm_filetype_blacklist = {
\ 'tagbar' : 1,
\ 'nerdtree' : 1,
\}
set completeopt=menu,menuone
nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>

" UitlSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" vim-ripgrep settings
nnoremap <leader>rg :Rg ""<left>
nnoremap <leader>rc :Rg <CR>
let g:rg_highlight=1
let g:rg_root_types=['.git', '.svn']

" QFEnter settings
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<c-v>']
let g:qfenter_keymap.hopen = ['<c-h>']

" vim-go settings
let g:go_get_update = 0
autocmd filetype go nnoremap <leader>] :GoDef<CR>

" Windows settings
if has("win32") || has("win16")
       set guioptions-=m  "remove menu bar
       set guioptions-=T  "remove toolbar
       set guioptions-=r  "remove right-hand scroll bar
       set guioptions-=L  "remove left-hand scroll bar

       language messages en
       inoremap <C-S-V> <ESC>:setl paste<CR>gi<C-R>+<ESC>:setl nopaste<CR>gi
endif

