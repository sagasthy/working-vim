""""""""""""""""""""""""""""""""""""""""
" => UI                                "
""""""""""""""""""""""""""""""""""""""""

set so=7
set number
set relativenumber
set title
set mouse=a
set wildmenu
set ruler
set cmdheight=1
set hid
set cmdheight=1 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Add a bit extra margin to the left
set foldcolumn=1
set cursorline
"set cursorcolumn

" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[5 q"


""""""""""""""""""""""""""""""""""""""""
" => Color & Fonts                     "
""""""""""""""""""""""""""""""""""""""""

" set termguicolors
" Enable syntax highlighting
syntax enable
" Set regular expression engine automatically
set regexpengine=0
set background=dark
colorscheme industry
set encoding=utf8
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
"let g:airline_theme='<theme>'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


""""""""""""""""""""""""""""""""""""""""
" => Text, Tabs & Indents              "
""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Status line             "
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" => Helper Functions        "
""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! Test()
    echo $(basename "$0")
endfunction


""""""""""""""""""""""""""""""
" => File Explorer           "
""""""""""""""""""""""""""""""

let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search


""""""""""""""""""""""""""""""
" => Programming             "
""""""""""""""""""""""""""""""

" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Enable Omnicomplete features
set omnifunc=syntaxcompleteComplete


""""""""""""""""""""""""""""""
" => Plugins                 "
""""""""""""""""""""""""""""""

call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


""""""""""""""""""""""""""""""
" => Custom Keymaps          "
""""""""""""""""""""""""""""""

" fzf shortcut ;
map ; :Files<CR>
" NerdTreeToggle shortcut Ctrl+O
map <C-o> :NERDTreeToggle<CR>
