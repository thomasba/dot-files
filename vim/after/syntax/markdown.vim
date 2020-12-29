" Vim syntax file
" Add checkboxes to *.md files
" source: https://gist.github.com/huytd/668fc018b019fbc49fa1c09101363397

" Custom conceal
let dtd_ignore_case=0
syntax match todoCheckbox "\[\ \]" conceal cchar=☐
syntax match todoCheckbox "\[X\]" conceal cchar=☒
syntax match todoCheckbox "\[x\]" conceal cchar=☑

syntax match todoCheckbox "- \[\ \]" conceal cchar=☐
syntax match todoCheckbox "- \[X\]" conceal cchar=☒
syntax match todoCheckbox "- \[x\]" conceal cchar=☑

hi def link todoCheckbox Todo

highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

setlocal cole=1
