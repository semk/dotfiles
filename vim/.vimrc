" pathogen
call pathogen#infect()

" use the appropriate number of spaces to insert a tab
set expandtab

" number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" set our tabs to four spaces
set tabstop=4

" turn syntax highlighting on by default
syntax on

if has('gui_running')
    set background=dark
else
    set background=dark
endif

colorscheme solarized
let g:solarized_termtrans=1

" set auto-indenting on for programming
" set autoindent

" do smart autoindenting when starting a new line.
" set smartindent

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" do not highlight words when searching for them. it's distracting.
set nohlsearch

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
"set binary noeol

" make that backspace key work the way it should
set backspace=indent,eol,start

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

