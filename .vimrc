set shell=/bin/bash\ --login
set shell=bash

set nocompatible

filetype off

"""""""""""""""""""""""""""
" Vundle Plugin Manager
"""""""""""""""""""""""""""

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'jaxbot/semantic-highlight.vim'

Plugin 'rust-lang/rust.vim'

Plugin 'Syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_disabled_filetypes=['tex']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

" let g:syntastic_debug = 1
" let g:syntastic_debug_file = "~/syntastic.log"


Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'
" let g:airline_theme='minimalist'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'Tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Put your non-Plugin stuff after this line


""""""""""""""""""
" vim config
""""""""""""""""""

" " show leader
set showcmd
" " map Enter to open a new line but not enter edit mode
nmap <CR> o<Esc>



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
set history=1000
set mouse=a


set relativenumber
set number
" " Set to auto read when a file is changed from the outside
set autoread


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Roboto\ Mono\ Light\ 12
 nnoremap <Tab> <Esc>
 vnoremap <Tab> <Esc>gV
 onoremap <Tab> <Esc>
 inoremap <Tab> <Esc>`^
 inoremap <Leader><Tab> <Tab>

" " Turn on the WiLd menu
set wildmenu

" " Ignore compiled files
set wildignore=*.o,*~,*.pyc


" "Always show current position
set ruler
set cursorline
set cursorcolumn


" " Height of the command bar
set cmdheight=1


" " Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" " Ignore case when searching
set ignorecase


" " When searching try to be smart about cases
set smartcase


" " Highlight search results
set hlsearch


" " Makes search act like search in modern browsers
set incsearch


" " Don't redraw while executing macros (good performance config)
set lazyredraw


" " For regular expressions turn magic on
set magic


" " Show matching brackets when text indicator is over them
set showmatch
" " How many tenths of a second to blink when matching brackets
set mat=5


" " No annoying sound on errors
set novisualbell


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Enable syntax highlighting
syntax enable

set t_Co=256

" colorscheme tender
" colorscheme hybrid_material
" colorscheme farout
 colorscheme libertine
 set background=dark

 " Set extra options when running in GUI mode
 if has("gui_running")
   set guioptions-=T
       set guioptions+=e
           set t_Co=256
                 set guitablabel=%M\ %t
                 endif

                 " Set utf8 as standard encoding and en_US as the standard
                 " language
                 set encoding=utf8

                 " Use Unix as the standard file type
                 set ffs=unix,dos,mac


                 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " => Files, backups and undo
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Turn backup off, since most stuff is in SVN, git etc. anyway...
 set nobackup
 set nowb
 set noswapfile


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Text, tab and indent related
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Use spaces instead of tabs
set expandtab


" " Be smart when using tabs ;)
set smarttab


" " 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Editing
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=1
map <leader>d S<Esc>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /


" " Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" " Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l


" " Close the current buffer
map <leader>bd :Bclose<cr>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close


set viminfo^=%


" """"""""""""""""""""""""""""""
" " => Status line
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2

" " Move a line of text using CTRL+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Pressing \ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
