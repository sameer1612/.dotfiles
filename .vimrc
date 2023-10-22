" Options
set autoindent
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set expandtab
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set ignorecase
set mouse=a
set number
set relativenumber
set scrolloff=4
set shiftwidth=2
set showmode
set signcolumn=yes
set smartcase
set smartindent
set spelllang=en
set splitbelow
set splitright
set noswapfile
set tabstop=2
set termguicolors
set undodir=$HOME/.undodir
set undofile
set undolevels=100
set nowrap


" Keymaps
let mapleader = " "

inoremap jk <ESC> " Exit insert mode with jk

nnoremap 0 ^ " Goto first non-empty character in line
nnoremap <C-h> <C-w>h " Select left split
nnoremap <C-j> <C-w>j " Select lower split
nnoremap <C-k> <C-w>k " Select upper split
nnoremap <C-l> <C-w>l " Select right split
nnoremap <M-down> :m .+1<CR>== " Move line up
nnoremap <M-o> o<ESC> " Insert a new line down in normal mode
nnoremap <M-up> :m .-2<CR>== " Move line down
nnoremap <leader>nh :nohl<CR> " Clear search highlights
nnoremap <leader>j J " Join lines
nnoremap <leader>qq :qa<CR> " Close neovim
nnoremap <leader>se <C-w>= " Make splits equal size
nnoremap <leader>sh <C-w>s " Split window horizontally
nnoremap <leader>sv <C-w>v " Split window vertically
nnoremap <leader>sx :close<CR> " Close current split
nnoremap <leader>w :w<CR> " Write buffer
nnoremap J 5j " Move 5 lines down
nnoremap K 5k " Move 5 lines up
nnoremap j v:count == 0 ? 'gj' : 'j' " Move vertically
nnoremap k v:count == 0 ? 'gk' : 'k' " Move vertically

vnoremap <M-k> :m '<-2<CR>gv=gv " Move line down in visual mode
vnoremap <M-k> :m '>+1<CR>gv=gv " Move line up in visual mode
