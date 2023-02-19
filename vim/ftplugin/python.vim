" python dev settings
"  Run
nnoremap <leader>r :w <bar> exec '!python3 '.shellescape('%')<CR>
"  Debugging
nnoremap <leader>d :!python3 -m pudb.run %<CR>
let python_highlight_all = 1
<<<<<<< HEAD:vim/ftplugin/python.vim

nnoremap <leader>f :% !black - -q<CR>
=======
" Black
let g:black_use_virtualenv = 0
augroup black_on_save
    autocmd!
    autocmd BufWritePre *.py Black
augroup end
nnoremap <leader>f :Black<CR>

>>>>>>> 8f241c04df75c6949d8b8399eaf69aebd0a6d30a:nvim/ftplugin/python.vim
