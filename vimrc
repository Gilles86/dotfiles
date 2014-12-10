"--------------
"" Load pathogen
"--------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set nobackup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set nocompatible

syntax enable
set background=dark
" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
let g:solarized_termcolors=16

set clipboard=unnamedplus

map <C-n> :NERDTreeToggle<CR>
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

"--------------
"" Buffer shortcuts
"--------------
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


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
