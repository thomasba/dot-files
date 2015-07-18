setlocal shiftwidth=4
command! CheckPHP :! php -l %
command! OpenPHP :! php %
" run current PHP file through php 
noremap <leader>p :w!<CR>:!php %<CR>
" run current PHP file through php linter (syntax check) check
noremap <leader>l :!php -l %<CR>
