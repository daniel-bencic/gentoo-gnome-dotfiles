" plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'tpope/vim-fugitive'
call plug#end()

" basic configuration
set encoding=utf-8
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
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onedark

" navigation
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" vim-startify
let g:startify_bookmarks=[{'r': '~/.bashrc'} ,{'v': '~/.config/nvim/init.vim'}]

" autocomplete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" lsp
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'

let g:python3_host_prog='/home/me/miniconda3/envs/msc/bin/python'

let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
