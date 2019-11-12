source ~/.vim/config/plug.vim

let mapleader = ","

" Fast escape from insert mode
inoremap kj <Esc>

" Line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Black guibg=#589A5D

" Show 5 lines of context around the cursor.
set scrolloff=5

" 119 column marker (this is the amount of columns GitHub shows)
set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey ctermfg=white

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set cindent
set smartindent
set autoindent
set cinkeys=0{,0},:,0#,!^F

" Move tabs to left or right

map <C-H> :tabmove -1<CR>
map <C-L> :tabmove +1<CR>

" Swicth tabs
map <C-Up> :tabp<CR>
map <C-Down> :tabn<CR>
imap <C-Up> <ESC>:tabp<CR>a
imap <C-Down> <ESC>:tabn<CR>a

" be 'modern'
set nocompatible
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

" Use system clipboard
set clipboard=unnamedplus

" Ignore these paths when searching in project
set wildignore+=*/node_modules/*
set wildignore+=*/deps/*
set wildignore+=*/bower_components/*

" Linediff (https://github.com/AndrewRadev/linediff.vim)
vmap <Leader>dd :Linediff<CR>
map <Leader>dr :LinediffReset<CR>

" Disable Ex mode
:map Q <Nop>

" Show hidden files with CtrlP
let g:ctrlp_show_hidden=1

" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Color scheme
set background=dark
colorscheme sunburst
syntax on

" Highlight the current line http://usevim.com/2014/12/03/conoline/
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=black

" Highlight search
hi Search cterm=NONE ctermfg=black ctermbg=yellow

" Copy current file name to clipboard
map <leader>n :let @+ = expand("%")<cr>

" Disable arrow keys
nnoremap <Left> :echo "No Left for you!"<CR>
vnoremap <Left> :<C-u>echo "No Left for you!"<CR>
inoremap <Left> <C-o>:echo "No Left for you!"<CR>
nnoremap <Right> :echo "No Right for you!"<CR>
vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>
nnoremap <PageUp> :echo "No PageUp for you!"<CR>
vnoremap <PageUp> :<C-u>echo "No PageUp for you!"<CR>
inoremap <PageUp> <C-o>:echo "No PageUp for you!"<CR>
nnoremap <PageDown> :echo "No PageDown for you!"<CR>
vnoremap <PageDown> :<C-u>echo "No PageDown for you!"<CR>
inoremap <PageDown> <C-o>:echo "No PageDown for you!"<CR>

source ~/.vim/config/chrome.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/search.vim
source ~/.vim/config/statusline.vim
source ~/.vim/config/elixir.vim
