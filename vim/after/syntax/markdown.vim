" Vim syntax file
" Add checkboxes to *.md files
" source: https://gist.github.com/huytd/668fc018b019fbc49fa1c09101363397
" source: https://gist.github.com/huytd/668fc018b019fbc49fa1c09101363397?permalink_comment_id=3632149#gistcomment-3632149

" Custom conceal
let dtd_ignore_case=0

syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[\s\]'hs=e-4 conceal cchar=☐
syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[x\]'hs=e-4 conceal cchar=☑
syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[-\]'hs=e-4 conceal cchar=☒
syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[\.\]'hs=e-4 conceal cchar=⊡
syntax match todoCheckbox '\v(\s+)?(-|\*)\s\[o\]'hs=e-4 conceal cchar=⬕

hi def link todoCheckbox Todo

highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

setlocal cole=1
