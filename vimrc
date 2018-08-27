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
Plugin 'scrooloose/nerdtree'     " directory preview
Plugin 'godlygeek/tabular'       " alignment by selected label
Plugin 'Tagbar'                  " variables and functions preview
Plugin 'ctrlpvim/ctrlp.vim'      " find label
Plugin 'Auto-Pairs'              " auto pairs
Plugin 'Vimjas/vim-python-pep8-indent' " python pep8 indent
Plugin 'junegunn/seoul256.vim'   " color scheme
Plugin 'vim-airline/vim-airline' " status/tabline
Plugin 'mhinz/vim-signify'       " show differences
Plugin 'SirVer/ultisnips'        " snippets engine
Plugin 'honza/vim-snippets'      " snippets instances
Plugin 'Yggdroot/LeaderF'        " locating files
Plugin 'w0rp/ale'                " asynchronous lint engine


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

" ����leader��Ϊ,
let mapleader=","

" ճ��ģʽ�л�
set pastetoggle=<F9>

" �﷨����
if !exists("g:syntax_on")
	syntax enable
endif

" ��ǳɫ������ǰ��
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" �ļ�����
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" ���ܶ���
set smartindent
" �Զ�����
set autoindent

" ͳһ����Ϊ4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" ��ʾ�к�
set number

" �������ַ�����
set hlsearch
set incsearch

" ������ʾ״̬��
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [LEN=%L][POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" ���л�bufferʱ�Զ����浱ǰ�ļ�
set autowrite

" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu

" ���ӵ����ַ�
set iskeyword+=_,$,@,%

" �۵�
set foldmethod=indent
set nofoldenable

" �Զ��л���ǰĿ¼
set autochdir

" �������ϲ���tags�ļ�
set tags=./tags;$HOME

" ��ʾTAB����ĩ�ո�
set list
set listchars=tab:>-,trail:-

" Python�ļ��Զ��ÿո����TAB
autocmd FileType python setlocal expandtab

" �ű�Ŀ¼���Զ�����LPC�ļ�����
"autocmd FileType c,h
"\ if getcwd() =~ "logic"
"\	| setlocal ft=lpc
"\	| let lpc_syntax_for_c=1
"\	| set tabstop=8
"\	| set softtabstop=8
"\	| set shiftwidth=8
"\ | endif

" �������ģʽ��delete/backspce��ʧЧ����
" 0 same as ��:set backspace=�� (Vi compatible)
" 1 same as ��:set backspace=indent,eol��
" 2 same as ��:set backspace=indent,eol,start��
set backspace=2

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
" Open a NERDTree
nmap <F5> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" tabular
nnoremap <leader>t :Tab/
vnoremap <leader>t :Tab/

" Unified color scheme
colorscheme seoul256

" UitlSnips
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Python settings
autocmd filetype python set colorcolumn=80
autocmd filetype python set foldmethod=indent
autocmd filetype python nnoremap <space> za
autocmd filetype python set foldnestmax=2
autocmd WinEnter,BufEnter,BufNewFile,BufRead *.py match Error /[\t ]\+$/

