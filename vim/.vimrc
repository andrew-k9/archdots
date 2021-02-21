" Tab options
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set relativenumber
set nu

" Text
set nowrap
set scrolloff=8
" set colorcolumn=90
set mouse=a

" History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Search
set nohlsearch
set incsearch

" General
set hidden
set noerrorbells
set timeoutlen=1000 ttimeoutlen=0


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/space-vim-dark'
Plug 'tpope/vim-fugitive' 
call plug#end()

" Plugin colors
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" lightline config
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme':  'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" NERDTree
let NERDTreeShowHidden=1
