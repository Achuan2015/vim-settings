﻿set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
""""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""

" ������vi
set nocompatible

" dos2unix
set ff=unix

" ������ļ�����
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'kabbamine/vcoolor.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
if has('python')
    Plugin 'davidhalter/jedi-vim'
    Plugin 'axiaoxin/vim-json-line-format'
    Plugin 'SirVer/ultisnips'
endif
Plugin 'axiaoxin/favorite-vim-colorscheme'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

call vundle#end()

" ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""

" ȡ������
set nobackup
set noswapfile
set noundofile

" ���consle�������
language messages zh_CN.utf-8

" ״̬������
set laststatus=2

" ���﷨����
syntax enable

" �����﷨���
syntax on

" vimrc�ļ��޸�֮���Զ�����
autocmd! bufwritepost .vimrc source %

" �ļ��޸�֮���Զ�����
set autoread

" yyֱ�Ӹ��Ƶ�ϵͳ���а壨For macvim��
"set clipboard=unnamed

" �����������е��ı�
set hlsearch

" ���ż��뼴ʱ����
set incsearch

" ����ʱ���Դ�Сд
set ignorecase

" ��һ�������ϴ�д��ĸʱ�Դ�Сд����
set smartcase

set guifont=Menlo:h14

colorscheme Tomorrow-Night-Bright
" ʹ���Դ���ɫ
"colorscheme elflord
"set background=dark

" ��״̬����ʾ�������������
set showcmd

" ��ʾ����������
set showmatch

" :next, :make ����֮ǰ�Զ�����
set autowrite

" ����ʹ�����
set mouse=a

" �����к�
set nu

" �˸������
set backspace=2

" �˸��һ��ɾ��4���ո�
set smarttab

" ����
set autoindent
set smartindent

" �����ļ�ʱ�Զ�ɾ����β�ո��Tab
autocmd BufWritePre * :%s/\s\+$//e

" �����ļ�ʱ�Զ�ɾ��ĩβ����
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" ���Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" �����۵� ����������·�ʱ��za�����۵���չ��
set fdm=indent
" Ĭ��չ��
set foldlevel=99

" ͻ����ʾ��ǰ�У���
"set cursorline
"set cursorcolumn

" ���� �˳�vim��������ʾ���ն���Ļ, �������ڲ鿴�͸���
set t_ti= t_te=

" ���ļ�ʱʼ����ת���ϴι������λ��
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif



"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" ӳ���л�buffer�ļ�λ
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" ӳ���л�tab�ļ�λ
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" normalģʽ��Ctrl+cȫѡ�����Ƶ�ϵͳ������(linux����װ��vim-gnome)
nmap <C-c> gg"+yG

" visualģʽ��Ctrl+c����ѡ�����ݵ�������
vmap <C-c> "+y

" Ctrl+vԭ��ճ�����а�����
inoremap <C-v> <ESC>"+pa

" w!!д��ֻ���ļ�
cmap w!! w !sudo tee >/dev/null %:p

" F2�л��к���ʾ
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3��Ŀ¼��
nmap <silent> <F3> :NERDTreeToggle<CR>

" F4��ʾTagList
nmap <silent> <F4> :TagbarToggle<CR>

" F5���нű�
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %:p<CR>
else
    autocmd FileType python map <buffer> <F5> :!python %:p<CR>
endif

" <F6> �½���ǩҳ
map <F6> <Esc>:tabnew<CR>

" <F7> ����ճ�����벻�ƻ�����
set pastetoggle=<F7>

if has("win64") || has("win32")
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8<CR><CR>
else
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p;isort %:p;<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8;isort %:p;<CR><CR>
endif

" ����ǰ�����������
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" ��Normal Mode��Visual/Select Mode�£�����Tab����Shift-Tab���������ı�
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" ���ҷָ��Ctrl+w +v
" ���·ָ��Ctrl+w +s
" �رմ���Ctrl+w  +q

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quicker window resize
nnoremap <C-Enter> <C-w>=
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" emoji
imap <C-e> <C-X><C-U>


""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
" NerdCommenter
let g:NERDSpaceDelims=1

" NERDTREE
" ����ʾ���ļ�
let NERDTreeIgnore=['\.pyc$', '\~$']
" show nerdtree when starts up
"autocmd vimenter * NERDTree
" �˳����һ��buffʱҲ�˳�nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'

"Ctrl-X Ctrl-U emoji��ȫ
set completefunc=emoji#complete

" instant-markdown
let g:instant_markdown_slow = 1

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
" ����tabline
let g:airline#extensions#tabline#enabled = 1
" tabline�е�ǰbuffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_sep = ' '
" tabline��δ����buffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline��buffer��ʾ���
let g:airline#extensions#tabline#buffer_nr_show = 1

" jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"

" flake8
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd! BufRead,BufWritePost *.py call Flake8()

" gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" jshint
autocmd! BufRead,BufWritePost *.js :JSHint

" vim-table-mode: markdown
let g:table_mode_corner="|"

" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-clojure-static
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }

" vim-clojure-highlight
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" vCoolor.vim
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'       " Insert rgb color.
let g:vcool_ins_hsl_map = '<leader>cph'       " Insert hsl color.
let g:vcool_ins_rgba_map = '<leader>cpra'      " Insert rgba color.
