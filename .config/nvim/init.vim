""" plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'lervag/vimtex'
call plug#end()


""" basic configuration
"" editor
set encoding=utf-8
set syntax=on
set number
set cursorline
"set mouse=a
set softtabstop=8 shiftwidth=8 expandtab
set nohlsearch
set noshowmode
set splitbelow

"" completion
set completeopt=menuone,longest,preview
set previewheight=8

""" appearance
"" colorscheme
set termguicolors
colorscheme onedark

"" lightline
let g:lightline={'colorscheme': 'one'}


""" keymaps
"" split navigation
nnoremap <M-S-h> <C-W>h
nnoremap <M-S-j> <C-W>j
nnoremap <M-S-k> <C-W>k
nnoremap <M-S-l> <C-W>l
nnoremap <M-S-c> <C-o>

"" clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa

"" completion
inoremap <expr> <Esc>   pumvisible() ? '<C-y><Esc>' : '<Esc>'
inoremap <expr> <CR>    pumvisible() ? '<C-y><CR>' : '<CR>'
inoremap <expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
inoremap <expr> <Down>  pumvisible() ? '<C-y><Down>' : '<Down>'
inoremap <expr> <Up>    pumvisible() ? '<C-y><Up>' : '<Up>'


"" ale
nnoremap <M-e> :ALEHover<CR>
nnoremap <M-d> :ALEGoToDefinition<CR>
nnoremap <M-r> :ALEFindReferences<CR>
nmap <silent> <A-z> <Plug>(ale_previous_wrap)
nmap <silent> <A-x> <Plug>(ale_next_wrap)


""" ale
let g:ale_completion_enabled=1
let g:ale_completion_autoimport=1
let g:ale_linters_explicit=1
let g:ale_linters={'python': ['pyls'], 'c': ['clangd']}


""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'


""" autocmds
augroup ToggleTagbar
        autocmd!
        autocmd FileType python,c,cpp TagbarToggle
augroup END
