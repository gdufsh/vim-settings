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
Plugin 'scrooloose/nerdtree'    " Ŀ¼���
Plugin 'godlygeek/tabular'      " ���ж���
Plugin 'Tagbar'                 " �ṹԤ��
Plugin 'ctrlpvim/ctrlp.vim'     " ȫ������
Plugin 'Auto-Pairs'             " �Զ�ƥ��

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

" ���ܶ���
set smartindent
" �Զ�����
set autoindent

"  ͳһ����Ϊ4
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

" �ű�Ŀ¼���Զ�����LPC�ļ�����
autocmd FileType c,h 
\ if getcwd() =~ "logic" 
\	| setlocal ft=lpc
\	| let lpc_syntax_for_c=1
\	| set tabstop=8
\	| set softtabstop=8
\	| set shiftwidth=8
\ | endif

" NERD tree
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
