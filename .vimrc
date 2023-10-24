" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''


" Options
set autoindent
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set expandtab
set ignorecase
set number
set relativenumber
set scrolloff=4
set shiftwidth=2
set showmode
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
