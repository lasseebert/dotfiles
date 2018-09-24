" Format
map <leader>f :Neoformat<CR>
map <leader>t :!mix test && mix credo && mix dialyzer --halt-exit-status && mix format --check-formatted<CR>
