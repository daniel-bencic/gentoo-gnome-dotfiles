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
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-c> <C-o>

"" clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa

"" completion
inoremap <expr> <Esc>   pumvisible() ? '<C-e>' : '<Esc>'
inoremap <expr> <CR>    pumvisible() ? '<C-y><CR>' : '<CR>'
inoremap <expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

"" ale
nnoremap <A-e> :ALEHover<CR>
nnoremap <A-d> :ALEGoToDefinition<CR>
nnoremap <A-r> :ALEFindReferences<CR>
nmap <silent> <A-z> <Plug>(ale_previous_wrap)
nmap <silent> <A-x> <Plug>(ale_next_wrap)


""" ale
let g:ale_completion_enabled=1
let g:ale_completion_autoimport=1
let g:ale_linters_explicit=1
let g:ale_linters={'python': ['pyls']}


""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'


""" autocmds
augroup ToggleTagbar
        autocmd!
        autocmd FileType python,c,cpp TagbarToggle
augroup END
