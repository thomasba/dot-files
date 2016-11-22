augroup filetypedetect
    au BufRead,BufNewFile *.msg,*.mail setfiletype mail
    au BufRead,BufNewFile *.todo setfiletype todo
    au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md setf markdown
augroup END
