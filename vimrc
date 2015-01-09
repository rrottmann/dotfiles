"Activate Mouse Wheel
"set mouse=a
set mouse-=a " I do not want visual mode with mouse!!

"Map leadser to underscore
let mapleader = "_"

"Stop distracting co-workers
set visualbell
" don't need /g after :s or :g
set gdefault

"Set line numbering to take up 5 spaces
set numberwidth=5 "Highlight current line
set cursorline

"Turn on spell checking with English dictionary
"set spell
"set spelllang=en
"set spellsuggest=9 "show only 9 suggestions for misspelled words

"Don't use compatible mode
set nocompatible

set bs=2 "set backspace to be able to delete previous characters
"Enable line numbering, taking up 6 spaces
set number

"Turn off word wrapping
set wrap!

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent
filetype indent on "indent depends on filetype

"Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"Set color scheme
set t_Co=256
colorscheme desert256
syntax enable

"Enable indent folding
"set foldenable
"set fdm=indent

"Set space to toggle a fold
nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"Use python tags
set tags+=$HOME/.vim/tags/python.ctags

"Enable python autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Easily switch between open files with cursor left and right
map <silent><C-Left> <C-T> 
map <silent><C-Right> <C-]>

" Easily switch between tab identations with alt left and right
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR> 

" Autocomplete with ctrl and space
inoremap <Nul> <C-x><C-o>

" More python spell checking
"syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display 
"syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display 
"syn match pythonError "^\s*for\s.*[^:]$" display 
"syn match pythonError "^\s*except\s*$" display 
"syn match pythonError "^\s*finally\s*$" display 
"syn match pythonError "^\s*try\s*$" display 
"syn match pythonError "^\s*else\s*$" display 
"syn match pythonError "^\s*else\s*[^:].*" display 
"syn match pythonError "^\s*if\s.*[^\:]$" display 
"syn match pythonError "^\s*except\s.*[^\:]$" display 
"syn match pythonError "[;]$" display 
"syn keyword pythonError         do 

filetype plugin on
let g:pydiction_location = '~/.vim/after/complete-dict'
