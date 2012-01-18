set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Snippets
" garbas/vim-snipmate dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
" vim-snipmate itself
Bundle "garbas/vim-snipmate"
" snippets pack
Bundle 'honza/snipmate-snippets'
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['python'] = 'django,python'
let g:snipMate.scope_aliases['html'] = 'html,htmldjango,css,javascript'

" Git support
Bundle 'tpope/vim-fugitive'

" Python specific
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'nvie/vim-pep8'
autocmd FileType python map <buffer> <F8> :call Pep8()<CR>
Bundle 'nvie/vim-pyflakes'
"Bundle 'vimscripts/pylint.vim'
"autocmd FileType python compiler pylint
"let g:pylint_onwrite = 0
"autocmd FileType python map <buffer> <F6> :Pylint<CR>

" Buffers handling
"Bundle 'fholgado/minibufexpl.vim'

" File exploration
Bundle 'wincent/Command-T'

" Other
Bundle 'tpope/vim-surround'
" Django templates tags surround support
let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
let g:surround_{char2nr("v")} = "{{ \1 \r..*\r &\1\r }}"

Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
" some undo
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

Bundle 'vim-scripts/YankRing.vim'
nnoremap <silent> <F11> :YRShow<CR>


filetype plugin indent on     " required! 

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

"remove all trailing whitespace for specified files before write
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.css :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.xml :call <SID>StripTrailingWhitespaces()

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=80        " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

set pastetoggle=<F2>    " enable paste mode switching for F2 key

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                       " show line and column number
syntax on                       " syntax highlighting
filetype plugin on
set showcmd                     " show (partial) command in status line
set number                      " show line numbers
set cursorline                  " highlight current line with underline

" Restore cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
