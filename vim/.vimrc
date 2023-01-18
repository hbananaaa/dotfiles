" Adapted from Douglas Black
" Colors {{{
syntax enable           " enable syntax processing
colorscheme slate
set termguicolors
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline        " highlight current line
set wildmenu
filetype indent on      " load filetype-specific indent files
set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
" }}}
" Leader Shortcuts {{{
let mapleader=","
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
" nnoremap <leader>s :mksession<CR>
" ack
nnoremap <leader>a :Ack!<Space>
" fuzzy finder remaps
nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

" }}}
" Movement {{{
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}
" airline {{{ set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" }}}
" vim:foldmethod=marker:foldlevel=0

function! FzyCommand(choice_command, vim_command)
    try
            let output = system(a:choice_command . " | fzy ")
    catch /Vim:Interrupt/
            " Swallow errors from ^C, alow redraw! below
    endtry
    redraw!
    if v:shell_error == 0 && !empty(output)
            exec a:vim_command . ' ' . output
    endif
endfunction

let g:ackprg = 'ag --nogroup --column --ignore-case'

