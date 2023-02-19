" python dev settings
"  Run
nnoremap <leader>r :w <bar> exec '!python3 '.shellescape('%')<CR>
"  Debugging
nnoremap <leader>d :!python3 -m pudb.run %<CR>
let python_highlight_all = 1

nnoremap <leader>f :% !black - -q<CR>
