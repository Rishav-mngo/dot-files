:set nu
:set relativenumber
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set autoindent
:set mouse=a
:set autochdir
" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-clangd', 'coc-pairs']
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ThePrimeagen/vim-be-good'
Plug 'ianks/vim-tsx'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'

call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
"
let mapleader = " "
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>s :NERDTreeToggle<CR>

"nnoremap <C-f> :NERDTreeFind<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <C-p> :Files<CR>
map <leader>j :History<CR>
map <leader>p :bp<CR>
map <leader>n :bn<CR>
map gn gt
map gp gT
map gd <C-w>c 
map <C-q> :tabdo q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <leader>S :source %<CR>
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-o': 'vsplit'
      \ }
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
autocmd BufWritePost * execute 'Prettier'

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


" Toggle terminal on/off (neovim)
nnoremap <leader>t :call TermToggle(12)<CR>
inoremap <leader>t<Esc>:call TermToggle(12)<CR>
tnoremap <leader>t <C-\><C-n>:call TermToggle(12)<CR>
 
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
colorscheme gruvbox

:function Compile()
:let fileName = expand('%:e')
:if fileName == "c"
:!gcc -o  a % && ./a
:elseif fileName == "cpp"
:!g++ -o a % && ./a
:elseif fileName == "py"
:!python %
:elseif fileName == "js"
:!node %
:endif
:endfunction
noremap <leader>c :call Compile()<cr>
imap <C-BS> <C-W>
noremap  <leader>i  :tabnew $MYVIMRC<CR>
