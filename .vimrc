set shell=/bin/bash\ --login
set shell=bash

let g:python_host_prog  = '/usr/bin/python3'
let g:python2_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vim/plugged')

" Make sure you use single quotes

Plug 'jaxbot/semantic-highlight.vim'

Plug 'rhysd/vim-clang-format'
noremap <leader>cf :ClangFormat<CR>

Plug 'rust-lang/rust.vim'

Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1

" Plug 'vim-syntastic/Syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_disabled_filetypes=['tex']
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" 
" let g:syntastic_rust_rustc_exe = 'cargo check'
" let g:syntastic_rust_rustc_fname = ''
" let g:syntastic_rust_rustc_args = '--'
" let g:syntastic_rust_checkers = ['rustc']
" 
" " let g:syntastic_debug = 1
" " let g:syntastic_debug_file = "~/syntastic.log"

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'unblevable/quick-scope'
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'
" let g:airline_theme='minimalist'

Plug 'terryma/vim-multiple-cursors'

Plug 'godlygeek/Tabular'

Plug 'majutsushi/tagbar'
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window_reversed = 0
nnoremap <leader>p :CtrlPTag<cr>

Plug 'wellle/targets.vim'

Plug 'scrooloose/nerdtree'
let NERDTreeHijackNetrw = 0
noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=

function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeUpdateOnCursorHold = 0

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
noremap <leader>gb :Gblame<CR>

Plug 'tpope/vim-endwise'

"Plug 'wincent/command-t'

" Initialize plugin system
call plug#end()

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

imap jf <Esc>
imap fj <Esc>

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
set cmdheight=2

" " Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" " Ignore case when searching
set ignorecase


" " When searching try to be smart about cases
set smartcase

set autoindent


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
set background=dark

" colorscheme tender
" colorscheme hybrid_material
" colorscheme farout
colorscheme libertine

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
set scrolloff=5


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
nmap <C-j> mz:m+<cr>`z==
nmap <C-k> mz:m-2<cr>`z==
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
