" Format
map <leader>f :Neoformat<CR>
map <leader>t :!mix test && mix credo && mix dialyzer --halt-exit-status && mix format --check-formatted<CR>

" Custom syntax highlighting
" Builds on top of elixir-vim Keyword definition
fun! SetCustomHighlighting()
  syn keyword custom_assert assert_approx_now
  hi def link custom_assert Keyword
endfu

autocmd bufenter *.ex,*.exs :call SetCustomHighlighting()
autocmd filetype *.ex,*.exs :call SetCustomHighlighting()
