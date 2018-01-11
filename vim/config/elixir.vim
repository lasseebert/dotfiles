" Format
map <leader>f :Neoformat<CR>

" Autorun Neomake on read and write
call neomake#configure#automake('rw', 1000)

" Enable credo in Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
