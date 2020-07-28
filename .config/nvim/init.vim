" plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" basic configuration
syntax on
set number
set cursorline
set mouse=a
set tabstop=8
set softtabstop=0
set shiftwidth=8
set noexpandtab
set splitbelow

" colorscheme
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" navigation
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" tmux
set ttimeoutlen=0
