""""""""""""""""""""" Extenstions
" execute pathogen#infect()
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

""""""""""""""""""""" UI


" Cursor column is makes vim slow on os x
if has("unix")
  let s:uname = system("uname")
  " Cursor column only in current window
  augroup CursorLine
      au!
      au VimEnter,WinEnter,BufWinenter * setlocal cursorcolumn
      au WinLeave * setlocal nocursorline
  augroup END
endif
" F4 toggles highlight search
noremap <F4> :set hlsearch! hlsearch?<CR>
" Line numbers
set number

"""""""""""""""""""" Pasting (os x)
set pastetoggle=<F2> " Toggle into paste mode to stop autoindent from fudging
                     " stuff up
" Copy visual selection to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

""""""""""""""""""""" Colors and fonts
syntax enable
let g:solarized_termtrans=1
colorscheme monokai
" Get rid of ugly line number highlighting
highlight LineNr ctermbg=0
highlight TabLineSel ctermbg=255
highlight Tabline ctermbg=0

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
au BufReadPost Jenkinsfile* set syntax=groovy


""""""""""""""""""""" Text and tabs etc
set lbr
set colorcolumn=80
set backspace=indent,eol,start

" Tabs
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set nosmarttab

""""""'''''''''''''' Git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72
hi clear SpellBad
hi SpellBad cterm=underline

""""""""""""""""""""" Backups
set nobackup
set noswapfile

""""""""""""""""""""" Movement and search
map j gj
map k gk
set ignorecase
set smartcase "Ignore case if all lower case, else make case-sensitive
set incsearch
set showmatch
map ; :

""""""""""""""""""""" Tab completion
set wildmode=longest,list,full
set wildmenu

"""""""""""""""""""" File type detection
" NOTE: Currently c only
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

augroup notes
    autocmd!
    autocmd BufRead,BufNewFile *.txt set wrap
    autocmd BufRead,BufNewFile *.txt set textwidth=80
    autocmd BufRead,BufNewFile *.md set wrap
    autocmd BufRead,BufNewFile *.md set textwidth=80
augroup END

"""""""""""""""""""" Syntastic specific config options
" Make syntastic passive, i.e. it won't check on every write.
let g:syntastic_mode_map = {"mode": "passive"}

" Provide a function to toggle syntastic.. 
let g:syntastic_on = 0
function! ToggleSyntastic()
    if( g:syntastic_on == 0 )
        exec "SyntasticCheck"
        let g:syntastic_on = 1
    else
        exec "SyntasticReset"
        let g:syntastic_on = 0
    endif
endfunction
"...and map it to <F9>
map <F9> :call ToggleSyntastic()<CR>

" If there is a .vimrc in the cwd, use that instead. Secure mode restricts
" execution of some commands in non-default vimrc files.
set exrc
set secure

" Machine specific stuff
source ~/.vimrc_local

" If there is a modeline, use that insead of al lthis junk
set modeline
