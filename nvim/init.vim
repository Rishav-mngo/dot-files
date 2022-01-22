set number
:set hidden
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nowrap
:set si
:set clipboard=unnamedplus

""""""""""""Run these command for clipboard"""""""""""""""""""""""""""""
" curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
" unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
" chmod +x /tmp/win32yank.exe
" sudo mv /tmp/win32yank.exe /usr/local/bin/
"
"
"
"
" :set macligatures
" :set guifont=Fira\ Code:h12
:set guifont=Hack\ Regular\ Nerd\ Font\ Complete.tff
source $VIMRUNTIME/mswin.vim


:set encoding=UTF-8

:set encoding=UTF-8
:set encoding=UTF-8

" let s:clip = '/mnt/c/Windows/System32/clip.exe' 
" if executable(s:clip)
"   augroup WSLYank
"     autocmd!
"     autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
"   augroup END
" end

call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/alvan/vim-closetag'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'  " We recommend updating the parsers on update
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
noremap <leader>i :e ~/.config/nvim/init.vim<CR>
noremap <leader>n :vs ~/notes<CR>
noremap <silent> <esc> :noh<cr><esc>
map gn :bn<CR>
map gp :bp<CR>
map gd :bd<CR>
" :colorscheme gruvbox
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
:autocmd BufWritePost * Prettier


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:function Compile()
:let fileName = expand('%:e')
:if fileName == "c"
:!gcc -o  a % && ./a
:elseif fileName == "cpp"
:!g++ -o a % && ./a
:elseif fileName == "py"
:!python %
:endif
:endfunction
noremap <leader>c :call Compile()<cr>
