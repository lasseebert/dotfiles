call plug#begin('~/.vim/plugged')

" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

" File navigation
Plug 'scrooloose/nerdtree'

" Syntax for many languages
Plug 'sheerun/vim-polyglot'

" Elixir
Plug 'slashmili/alchemist.vim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Global find and replace
Plug 'vim-scripts/greplace.vim'

" Change surrounding chars
Plug 'tpope/vim-surround'

" Enable repeating plugin map with "."
Plug 'tpope/vim-repeat'

" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'zanloy/vim-colors-sunburst'
Plug 'christophermca/meta5'

" Diff within same file
Plug 'AndrewRadev/linediff.vim'

" Gist
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

Plug 'github/copilot.vim', { 'branch': 'release' }

" Just (make replacement) syntax highlighting
Plug 'NoahTheDuke/vim-just'

call plug#end()
