source ~/.vim/config/plug.vim

let mapleader = ","

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Tabularize - align lines
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Open file in Chrome
nnoremap <Leader>oc :silent !google-chrome %<CR>:redraw!<CR>

" Trying out buffers instead of tabs
nnoremap <C-S-k> :bp<CR>
nnoremap <C-S-j> :bn<CR>
inoremap <C-S-k> <Esc>:bp<CR>i
inoremap <C-S-j> <Esc>:bn<CR>i

" Line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Black guibg=#589A5D

" Show 5 lines of context around the cursor.
set scrolloff=5

" 80 column marker
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey ctermfg=white

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set cindent
set smartindent
set autoindent
set expandtab
set cinkeys=0{,0},:,0#,!^F

" Move tabs to left or right
map <C-H> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-L> :execute "tabmove" tabpagenr() <CR>

" be 'modern'
set nocompatible
syntax on
filetype plugin indent on

" Show invisible chars
set listchars=tab:▷⋅,trail:·
set list

" Skip backup
set nobackup
set nowritebackup
set noswapfile

" Don't wrap lines
set nowrap

" Folding settings
let g:vim_markdown_initial_foldlevel=99 " Don't start folded for markdown
set nofoldenable        " Dont fold from start
" Using syntax folding seems to be very slow when CtrlP'ing from ruby files
"set foldmethod=syntax   " Fold based on syntax plugin
set foldmethod=indent    " Fold based on indent
set foldlevelstart=99   " Don't fold anything when foldenable is set
set foldignore=         " Don't ignore # when folding (which is default)
set foldtext=getline(v:foldstart) " Show first line of fold as fold text

" Use incremental search
set incsearch

" Use system clipboard
set clipboard=unnamedplus

" Ignore these paths when searching in project
set wildignore+=*/node_modules/*
set wildignore+=*/deps/*

" Highlight the current line http://usevim.com/2014/12/03/conoline/
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
