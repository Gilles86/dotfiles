"--------------
"" Install plugins
"--------------
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'FooSoft/vim-argwrap'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'mattn/emmet-vim'
call plug#end()

"--------------
"" basic settings
"--------------
set nobackup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set nocompatible
set mouse=a

filetype plugin on
filetype plugin indent on
syntax enable
filetype indent plugin on

colorscheme solarized
set background=dark

set expandtab

"--------------
"" Clipboard settings
"--------------
set clipboard=unnamed

"--------------
"" Keyboard shortcuts
"--------------
map <C-n> :NERDTreeToggle<CR>
nmap <leader>G :Goyo<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Open tab, move around tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  ,n :tabnew<CR>

"Close tab
map ,w :tabclose<CR>

" Use jj instead of Esc (because of new MacBook Pro)
imap jj <Esc>

"--------------
"" Buffer shortcuts
"--------------
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping

" Enable the list of buffers
" ALE
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8', 'prettier'], 'json': ['prettier'], 'javacript':['prettier'], 'html':['prettier']}

" Airline
let g:airline#extensions#tabline#enabled = 1
" My preference with using buffers. See `:h hidden` for more details
set hidden
nmap <leader>T :enew<cr>
"
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endi


autocmd FileType python setlocal completeopt-=preview
