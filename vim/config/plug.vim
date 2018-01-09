call plug#begin('~/.vim/plugged')

" Fuzzy search
Plug 'kien/ctrlp.vim'

" File navigation
Plug 'scrooloose/nerdtree'

" Syntax for many languages
Plug 'sheerun/vim-polyglot'

" Elixir
Plug 'slashmili/alchemist.vim'
Plug 'neomake/neomake'
Plug 'mhinz/vim-mix-format'

" Global find and replace
Plug 'vim-scripts/greplace.vim'

" Change surrounding chars
Plug 'tpope/vim-surround'

" Dummy word generaion
Plug 'vim-scripts/loremipsum'

" Enable repeating plugin map with "."
Plug 'tpope/vim-repeat'

" Git tools
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-rails'

" Trying out

" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'ajh17/Spacegray.vim'
Plug 'zanloy/vim-colors-sunburst'
Plug 'christophermca/meta5'

" Diff within same file
Plug 'AndrewRadev/linediff.vim'

" Gist
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Games
Plug 'johngrib/vim-game-code-break'

call plug#end()
