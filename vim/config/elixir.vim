" Autoformat Elixir on save
let g:mix_format_on_save = 1

" Autorun Neomake on read and write
call neomake#configure#automake('rw', 1000)

" Enable credo in Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
