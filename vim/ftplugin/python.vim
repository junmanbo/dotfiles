" python dev settings
"  Run
nnoremap <leader>r :w <bar> exec '!python3 '.shellescape('%')<CR>
"  Debugging
nnoremap <leader>d :!python3 -m pudb.run %<CR>
let python_highlight_all = 1
" Black
let g:black_use_virtualenv = 0
augroup black_on_save
    autocmd!
    autocmd BufWritePre *.py Black
augroup end
nnoremap <leader>f :Black<CR>
