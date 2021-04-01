""" plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
call plug#end()


""" basic configuration
"" editor
set updatetime=300
set signcolumn=yes
set encoding=utf-8
set syntax=on
set number
set cursorline
set mouse=a
set softtabstop=8 shiftwidth=8 expandtab
set nohlsearch
set noshowmode
set splitbelow

let g:python3_host_prog='/usr/bin/python3.8'

"" completion
set completeopt=menuone,noinsert,noselect
set previewheight=8


""" appearance
"" colorscheme
set termguicolors
colorscheme onedark

"" lightline
let g:lightline={'colorscheme': 'onedark'}


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


""" coc
"" keymaps
nmap <M-d> <Plug>(coc-definition)
nmap <M-t> <Plug>(coc-type-definition)
nmap <M-m> <Plug>(coc-implementation)
nmap <M-x> <Plug>(coc-diagnostic-next)
nmap <M-z> <Plug>(coc-diagnostic-prev)
nmap <M-r> <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <M-h> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


let g:coc_global_extensions = ['coc-clangd', 'coc-jedi']


""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'
