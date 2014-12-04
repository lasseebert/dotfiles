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










" Rcodetools

" plain annotations
map <silent> <F10> !xmpfilter -a<cr>
nmap <silent> <F10> V<F10>
imap <silent> <F10> <ESC><F10>a

" Test::Unit assertions; use -s to generate RSpec expectations instead
map <silent> <S-F10> !xmpfilter -u<cr>
nmap <silent> <S-F10> V<S-F10>
imap <silent> <S-F10> <ESC><S-F10>a

" Annotate the full buffer
" I actually prefer ggVG to %; it's a sort of poor man's visual bell 
nmap <silent> <F9> mzggVG!xmpfilter -a<cr>'z
imap <silent> <F9> <ESC><F11>

" assertions
nmap <silent> <S-F9> mzggVG!xmpfilter -u<cr>'z
imap <silent> <S-F9> <ESC><S-F11>a

" Add # => markers
vmap <silent> <F12> !xmpfilter -m<cr>
nmap <silent> <F12> V<F12>
imap <silent> <F12> <ESC><F12>a

" Remove # => markers
vmap <silent> <S-F12> ms:call RemoveRubyEval()<CR>
nmap <silent> <S-F12> V<S-F12>
imap <silent> <S-F12> <ESC><S-F12>a


function! RemoveRubyEval() range
  let begv = a:firstline
  let endv = a:lastline
  normal Hmt
  set lz
  execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
  normal 'tzt`s
  set nolz
  redraw
endfunction
