# dotfiles

Dotfiles managed by [stow](https://www.gnu.org/software/stow/).

Run ./install.sh to symlink dotfiles from ~/dotfiles/ to ~/

Be aware - if you are going to use these dotfiles, make sure you change my personal settings.

eg

gitconfig is set up for my name and email.

Thanks.

# Annotated .vimrc (OUTDATED)

""
"" Vundle
""
basic settings

```vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
```
let Vundle manage Vundle, required

```vim
Bundle 'gmarik/vundle'
```
status bar

```vim
Bundle 'Lokaltog/vim-powerline'
```
navigation

```vim
Bundle 'LustyJuggler'
Bundle 'BufOnly.vim'
Bundle 'YankRing.vim'
```
syntax

```vim
Bundle 'jimenezrick/vimerl'
Bundle 'kchmck/vim-coffee-script'
```
rspec

```vim
Bundle 'skwp/vim-rspec'
```
re-enable filetype plugins (disabled for vundle)

```vim
filetype plugin indent on
```
""
"" Basic editor settings
""
colours

```vim
colorscheme gardener
```
vim mode

```vim
set nocompatible
```
use 2 spaces for tabs, turn on automatic indenting

```vim
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab
```
make tabs behave smarter, i.e. bs will delete
spaces inserted when the tab key is pressed

```vim
set smarttab
```
make backspace delete over more stuff

```vim
set backspace=indent,eol,start
```
make backspace and cursor keys wrap accordingly

```vim
set whichwrap+=<,>,h,l
```
indent automatically based upon that of the last line

```vim
set autoindent
```
smarter indenting for brackets, etc

```vim
set smartindent
```
always show this number of lines above / below the current line, scroll
accordingly

```vim
set scrolloff=5
```
jump to the matching bracket quickly when inserting a matching one

```vim
set showmatch
```
disable folding

```vim
set nofoldenable
```
""
"" Visual editor cues
""
syntax highlighting

```vim
syntax on
```
highlight tabs and trailing spaces

```vim
if has('mac')
  set listchars=tab:▸\ ,trail:·
elseif has('unix')
  set listchars=tab:>>,trail:.
endif
set list
```
highlight search terms

```vim
set hlsearch
```
""
"" Search options
""
make searches case insensitive

```vim
set ignorecase
```
find as you type searching

```vim
set incsearch
```
default to global replace (no g needed)

```vim
set gdefault
```
""
"" Status bar tweaks
""
always show status bar

```vim
set laststatus=2
```
show position in file on status bar

```vim
set ruler
```
show line numbers

```vim
set number
```
show partially typed vim commands

```vim
set showcmd
```
""
"" File options
""
disable backup file (stops .bak files being written)j

```vim
set nobackup
```
disable swap file (stops .swp files being written)

```vim
set noswapfile
```
read a externally changed file automatically rather than prompting

```vim
set autoread
```
""
"" Input options
""
enable mouse usage in terminal vim
(really useful for moving splits!)

```vim
set mouse=a
```
enable tab completion in command line, and show a list
of options if more than one match is present

```vim
set wildmode=list:longest
```
show buffer name in terminal title

```vim
set title
```
faster terminal rendering

```vim
set ttyfast
```
""
"" Keyboard mappings
""
remap : to ; (means you only need to press three keys to write a file)

```vim
noremap ; :
```
jump more naturally between wrapped lines

```vim
noremap j gj
noremap k gk
```
easy window navigation

```vim
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
```
jump to begin/end etc matches by pressing tab rather than shift-5

```vim
nnoremap <tab> %
vnoremap <tab> %
```
shift-tab inserts a tab (useful with expandtab where tab inserts spaces)

```vim
inoremap <silent> <S-tab> <ESC>:set noexpandtab<cr>a<tab><tab><ESC>:set expandtab<cr>a
```
set leader to comma

```vim
let mapleader=','
```
unhighlight search

```vim
map <CR> :nohlsearch<CR>
```
make editing .vimrc easier

```vim
map <leader>z :sp ~/.vimrc<CR>
map <leader>Z :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
```
copy and paste to system clipboard

```vim
map <leader>v "*p<CR>:exe ":echo 'pasted from clipboard'"<CR>
map <leader>c "*y<CR>:exe ":echo 'copied to clipboard'"<CR>
```
spellcheck (requires aspell to be installed)

```vim
map <leader>s :w!<CR>:!aspell -c %<CR>:e!<CR>:echo "spellcheck complete"<CR>
```
""
"" Plugins
""
"" LustyJuggler
show lusty juggler

```vim
map <leader>b :LustyJuggler<cr>
```
delete all other buffers

```vim
map <leader>B :BufOnly<CR>
```
"" VimRspec
disable default bindings, they don't work in terminal Vim

```vim
let g:RspecKeymap=0
```
run all specs with Shift-R

```vim
nmap <S-R> :RunSpec<cr>
```
run a line with Shift-L

```vim
nmap <S-L> :RunSpecLine<cr>
```
display results vertically

```vim
let g:RspecSplitHorizontal=0
```
