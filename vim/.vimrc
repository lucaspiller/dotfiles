"""
""" Vundle
"""

" basic settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" status bar
Plugin 'vim-airline/vim-airline'

" ide
Plugin 'Shougo/deoplete.nvim'
Plugin 'w0rp/ale'

" navigation
Plugin 'Shougo/denite.nvim'

" syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'slim-template/vim-slim'
Plugin 'yaymukund/vim-rabl'
Plugin 'fatih/vim-go'

" typescript
"Plugin 'leafgarland/typescript-vim'
"Plugin 'Quramy/tsuquyomi'
"Plugin 'mhartington/vim-typings'

Plugin 'jason0x43/vim-js-indent'
"Plugin 'HerringtonDarkholme/yats'
Plugin 'leafgarland/typescript-vim'
Plugin 'mhartington/nvim-typescript'
Plugin 'hzchirs/vim-material'

" yankring
"Plugin 'YankRing.vim'

" re-enable filetype plugins (disabled for vundle)
call vundle#end()
filetype plugin indent on

"""
""" Basic editor settings
"""

" colours
set termguicolors
colorscheme vim-material
" Temporary disabled due to performance issues - iTerm2 has this built in
"set cursorline

" vim mode
set nocompatible

" use 2 spaces for tabs, turn on automatic indenting
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" make tabs behave smarter, i.e. bs will delete
" spaces inserted when the tab key is pressed
set smarttab

" make backspace delete over more stuff
set backspace=indent,eol,start

" make backspace and cursor keys wrap accordingly
set whichwrap+=<,>,h,l

" indent automatically based upon that of the last line
set autoindent

" smarter indenting for brackets, etc
set smartindent

" always show this number of lines above / below the current line, scroll
" accordingly
set scrolloff=5

" jump to the matching bracket quickly when inserting a matching one
set showmatch

" disable folding
set nofoldenable
set foldmethod=manual

"""
""" Visual editor cues
"""

" syntax highlighting
syntax on

" highlight tabs and trailing spaces
if has('mac')
  set listchars=tab:▸\ ,trail:·
elseif has('unix')
  set listchars=tab:>>,trail:.
endif
set list

" highlight search terms
set hlsearch

"""
""" Search options
"""

" make searches case insensitive
set ignorecase

" find as you type searching
set incsearch

" default to global replace (no g needed)
set gdefault

"""
""" Status bar tweaks
"""

" always show status bar
set laststatus=2

" show position in file on status bar
set ruler

" show line numbers
set number

" show partially typed vim commands
set showcmd

"""
""" File options
"""

" disable backup file (stops .bak files being written)j
set nobackup

" disable swap file (stops .swp files being written)
set noswapfile

" read a externally changed file automatically rather than prompting
set autoread

"""
""" Input options
"""

" enable mouse usage in terminal vim
" (really useful for moving splits!)
set mouse=a

" fix mouse support inside tmux
if !has('nvim')
  set ttymouse=xterm2
end

" enable tab completion in command line, and show a list
" of options if more than one match is present
set wildmode=list:longest

" ignore certain files for wildcard completion
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.beam
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd
set wildignore+=.sass-cache,.DS_Store,.bundle
set wildignore+=*.rbc,*.scssc,*.sassc
set wildignore+=*/spec/dummy/*
set wildignore+=*/tmp/*

" show buffer name in terminal title
set title

" faster terminal rendering
set ttyfast

"""
""" Keyboard mappings
"""

" remap : to ; (means you only need to press three keys to write a file)
noremap ; :

" jump more naturally between wrapped lines
noremap j gj
noremap k gk

" easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" jump to begin/end etc matches by pressing tab rather than shift-5
nnoremap <tab> %
vnoremap <tab> %

" shift-tab inserts a tab (useful with expandtab where tab inserts spaces)
inoremap <silent> <S-tab> <ESC>:set noexpandtab<cr>a<tab><tab><ESC>:set expandtab<cr>a

" set leader to comma
let mapleader=','

" unhighlight search
map <leader>/ :nohlsearch<CR>

" make editing .vimrc easier
map <leader>z :sp ~/.vimrc<CR>
map <leader>Z :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" copy and paste to system clipboard
map <leader>v "*p<CR>
" strip newlines when pasting
map <leader>vv :let @* = substitute(@*, "\n", " ", "g")<CR>:let @* = join(["\"", @*, "\""], "")<CR>"*p
map <leader>c "*y<CR>

" remove whitespace at end of lines
map <leader>s :%s/\s\+$//e<CR>

" highlight column 80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80"

"""
""" Plugins
"""


" delete all other buffers
map <leader>B :BufOnly<CR>

" tagbar
map <leader>t :TagbarToggle<CR>

""" Vim Javascript

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

""" Ctrl-P

" map to ,t (Ctrl-P is used by YankRing)
let g:ctrlp_map = ',t'

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Denite
map <leader>b :Denite buffer<CR>
map <C-t> :Denite file_rec<CR>
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Deoplete
call deoplete#enable()
let g:deoplete#max_menu_width=80

" ALE
let g:ale_linters = {
\   'typescript': ['tsserver'],
\}
let g:ale_lint_on_text_changed = 'never'

set timeout timeoutlen=1000 ttimeoutlen=10
