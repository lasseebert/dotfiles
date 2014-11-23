call pathogen#infect()
call pathogen#helptags()

let mapleader = ","

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Tabularize
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Application commands
nnoremap <Leader>oc :silent !google-chrome %<CR>:redraw!<CR>

" Tab shortcuts
nnoremap <C-S-k> :tabp<CR>
nnoremap <C-S-j> :tabn<CR>
inoremap <C-S-k> <Esc>:tabp<CR>i
inoremap <C-S-j> <Esc>:tabn<CR>i

" Line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Black guibg=#589A5D

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
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Use incremental search
set incsearch

" Use system clipboard
set clipboard=unnamedplus

" Use Google Calendar for calendar plugin
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
command Cal Calendar -first_day=monday
command Clock Calendar -view=clock

" Ignore these paths when searching in project
set wildignore+=*/node_modules/*
