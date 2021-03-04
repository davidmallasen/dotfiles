" Show partial commands at the bottom of the screen.
set showcmd 

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number
"set relativenumber
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber

" Avoid unnecessary delay when pressing ESC
set ttimeout
set ttimeoutlen=50
set timeoutlen=3000

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

set scrolloff=5 " show lines above and below cursor (when possible)

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" (Shift)Tab (de)indents code
" for command mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" Copy the current indentation when starting a new line
set autoindent

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" make :Q imitate :q
command! -bang Q q<bang>

" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 0

if has('gui_running')
    colorscheme base16-gruvbox-dark-hard
elseif exists("+termguicolors")
    set termguicolors
    " The commands below are needed for tmux + termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " fixes glitch? in colors when using vim with tmux
    set background=dark
    set t_Co=256

    colorscheme vim-monokai-tasty
    " colorscheme sonokai
    " let g:sonokai_style = 'shusia'

elseif &t_Co < 256
    colorscheme molokai
    set nocursorline " looks bad in this mode
endif

syntax on           " enable syntax processing

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#SpellCap#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#Cursor#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#       " colour
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#   " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
"set statusline+=\ %3l:%-2c\         " line + column
set statusline+=\ %3c\               " column 
set statusline+=%#Cursor#       " colour
"set statusline+=\ %3p%%\                " percentage
set statusline+=\ %3l/%-4L           " line + number of lines

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

set noshowmode " Bottom -- INSERT -- not needed anymore

" =========================================================
" PLUGINS
" =========================================================

" ---------------------- NERDTree -------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument and leave the cursor in it.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
