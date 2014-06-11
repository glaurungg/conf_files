""""""""""""""""""""" Extenstions
source ~/.vim/bundle/cscope_maps.vim
execute pathogen#infect()

""""""""""""""""""""" UI
" Cursor column only in current window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinenter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorline
augroup END
" F4 toggles highlight search
noremap <F4> :set hlsearch! hlsearch?<CR>
" Line numbers
set number

""""""""""""""""""""" Colors and fonts
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
" Get rid of ugly line number highlighting
highlight LineNr ctermbg=255
highlight TabLineSel ctermbg=255
highlight Tabline ctermbg=255

""""""""""""""""""""" Text and tabs etc
set expandtab
set shiftwidth=4
set tabstop=4
set lbr
set colorcolumn=80
set autoindent

" If there is a modeline, use that insead
set modeline

""""""""""""""""""""" Backups
set nobackup
set noswapfile

""""""""""""""""""""" Movement and search
map j gj
map k gk
set ignorecase
set incsearch
set showmatch

""""""""""""""""""""" Tab completion
set wildmode=longest,list,full
set wildmenu
