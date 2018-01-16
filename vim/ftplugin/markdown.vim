let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

function! Markdown()
	exe "!".$HOME."/.vim/mkd -s '%'"
endfunction
command! Markdown call Markdown()

function! MkdUpdate()
	exe "!".$HOME."/.vim/mkd '%'"
endfunction
command! MkdUpdate call MkdUpdate()

nnoremap <F4> :MkdUpdate<CR>

" Highlight trailing whitespaces
highlight mkdTrailingSpace ctermbg=22 guibg=#005f00
match mkdTrailingSpace " \+$"

" ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
