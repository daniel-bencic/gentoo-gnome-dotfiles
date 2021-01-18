""" plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'
call plug#end()


""" basic configuration
"" editor
set encoding=utf-8
set syntax=on
set number
set cursorline
set mouse=a
set softtabstop=8 shiftwidth=8 expandtab
set nohlsearch
set noshowmode
set splitbelow

"" completion
set completeopt=menuone,noinsert,noselect
set previewheight=8

"" pynvim
let g:python3_host_prog='/usr/bin/python3.8'


""" appearance
"" colorscheme
set termguicolors
let g:seoul256_background = 236
colorscheme seoul256

"" lightline
let g:lightline={'colorscheme': 'seoul256'}


""" keymaps
"" split navigation
nnoremap <M-S-Left> <C-W>h
nnoremap <M-S-Down> <C-W>j
nnoremap <M-S-Up> <C-W>k
nnoremap <M-S-Right> <C-W>l
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


""" vim-lsp
"" keymaps
nnoremap <M-d> :LspDefinition<CR>
nnoremap <M-h> :LspHover<CR>
nnoremap <M-x> :LspNextDiagnostic<CR>
nnoremap <M-z> :LspPreviousDiagnostic<CR>
nnoremap <M-r> :LspReferences<CR>

"" language servers
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


""" deoplete completion
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_sources', {
\ 'python': ['around', 'buffer', 'member', 'omni']
\})


""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'
