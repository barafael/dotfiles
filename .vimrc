set shell=/bin/bash\ --login
set shell=bash

set nocompatible              " be iMproved, required
filetype off                  " required

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
"
"
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"

Plugin 'terryma/vim-multiple-cursors'

Plugin 'Tabular'

Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
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
"
" " Be smart when using tabs ;)
set smarttab
"
" " 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"
" " Linebreak on 500 characters
" set lbr
" set tw=500
"
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"
"
" """"""""""""""""""""""""""""""
" " => Visual mode related
" """"""""""""""""""""""""""""""
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk
"
" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?
"
" " Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>
"
" " Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
"
" " Close the current buffer
" map <leader>bd :Bclose<cr>
"
" " Close all the buffers
" map <leader>ba :1,1000 bd!<cr>
"
" " Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
"
" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" " Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" " Specify the behavior when switching between buffers 
"   set switchbuf=useopen,usetab,newtab
"     set stal=2
"     catch
"     endtry
"
"     " Return to last edit position when opening files (You want this!)
     autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%
"
"
" """"""""""""""""""""""""""""""
" " => Status line
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2

" " Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \Line:\ %l
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Editing mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remap VIM 0 to first non-blank character
" map 0 ^
"
" " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"     nmap <D-k> <M-k>
"       vmap <D-j> <M-j>
"         vmap <D-k> <M-k>
"         endif
"
"         " Delete trailing white space on save, useful for Python and
"         CoffeeScript ;)
          func! DeleteTrailingWS()
            exe "normal mz"
              %s/\s\+$//ge
                exe "normal `z"
                endfunc
                autocmd BufWrite *.py :call DeleteTrailingWS()
                autocmd BufWrite *.coffee :call DeleteTrailingWS()
 
 
"               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>
"
" " Open vimgrep and put the cursor in the right position
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
"
" " Vimgreps in the current file
" map <leader><space> :vimgrep //
" <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
"
" " When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"
" " Do :help cope if you are unsure what cope is. It's super useful!
" "
" " When you search with vimgrep, display your results in cope by doing:
" "   <leader>cc
" "
" " To go to the next search result do:
" "   <leader>n
" "
" " To go to the previous search results do:
" "   <leader>p
" "
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>
"
" " Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Misc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"
" " Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>
"
" " Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>
"
" " unicode

