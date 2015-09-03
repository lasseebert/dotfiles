call plug#begin('~/.vim/plugged')

" Fuzzy search
Plug 'kien/ctrlp.vim'

" File navigation
Plug 'scrooloose/nerdtree'

" Rename file in current buffer
Plug 'danro/rename.vim'

" Languages, mostly syntax
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'elixir-lang/vim-elixir'
Plug 'ekalinin/dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'

" Global find and replace
Plug 'vim-scripts/greplace.vim'

" Change surrounding chars
Plug 'tpope/vim-surround'

" Align lines
Plug 'godlygeek/tabular'

" Dummy word generaion
Plug 'vim-scripts/loremipsum'

" Enable repeating plugin map with "."
Plug 'tpope/vim-repeat'

" Git tools
Plug 'tpope/vim-fugitive'

" Buffer tools
Plug 'jeetsukumaran/vim-buffergator'

Plug 'tpope/vim-rails'
Plug 'skwp/vim-rspec'

" Trying out
Plug 'benekastah/neomake'

" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'ajh17/Spacegray.vim'
Plug 'zanloy/vim-colors-sunburst'
Plug 'christophermca/meta5'

call plug#end()
