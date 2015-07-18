setlocal autochdir
setlocal shiftwidth=4
setlocal spell
setlocal foldcolumn=3

let g:tex_flavor = "latex"

set foldcolumn=4

if $DISPLAY != ""
	command! ViewOutput :! (file="%"; pdflatex "$file" $>/dev/null && okular "${file/.tex/.pdf}" &>/dev/null) &
	command! MakeLatex :! (pdflatex % &>/dev/null) &
	command! MakeLatexV :! pdflatex %
endif

":Snippet bin \binom{<{}>}{<{}>}<{}>
":Snippet sec \<{section}>*{<{name}>}<cr>\addcontentsline{toc}{<{section}>}{<{name}>}<cr><cr><{}>
":Snippet W Wahrscheinlichkeit <{}>
":Snippet TM Turingmaschine <{}>
":Snippet beg \begin{<{tag}>}<CR><{}><CR>\end{<{tag}>}
":Snippet latex_head \documentclass[11pt]{scrartcl}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[ngerman]{babel}<CR>%\usepackage{amsmath}<CR>%\usepackage{amssymb}<CR>%\usepackage{multicol}<CR>%\usepackage{booktabs}<CR>%\usepackage{pstricks}<CR>%\usepackage{pst-node}<CR>\usepackage[paper=a4paper,left=30mm,right=20mm,top=20mm,bottom =25mm]{geometry}<CR>\usepackage[<CR>    pdftitle={<{title}>},<CR>    pdfsubject={<{subject}>},<CR>    pdfauthor={<{author}>},<CR>    pdfkeywords={<{title}>},<CR>    pdfborder={0 0 0}<CR>]{hyperref}<CR>\usepackage{tabularx}<CR>%\usepackage{graphicx}<CR>\usepackage[usenames,dvipsnames]{color}<CR>\usepackage{lastpage}<CR>\usepackage{fancyhdr}<CR>\setlength{\parindent}{0ex}<CR>\setlength{\parskip}{2ex}<CR>\setcounter{secnumdepth}{4}<CR>\setcounter{tocdepth}{4}<CR>\definecolor{darkgreen}{rgb}{0,0.5,0}<CR>\definecolor{darkblue}{rgb}{0,0,0.5}<CR><CR>\pagestyle{fancy} %eigener Seitenstil<CR>\fancyhf{} %alle Kopf- und Fußzeilenfelder bereinigen<CR>\fancyhead[L]{<{title}>} %Kopfzeile links<CR>\fancyhead[C]{<{headermitte}>} %zentrierte Kopfzeile<CR>\fancyhead[R]{<{date}>} %Kopfzeile rechts<CR>\renewcommand{\headrulewidth}{0.4pt} %obere Trennlinie<CR>\fancyfoot[C]{Seite \thepage\ von \pageref{LastPage}}<CR>\renewcommand{\footrulewidth}{0.4pt} %untere Trennlinie<CR><CR>\newcommand{\spa}{\hspace*{4mm}}<CR>\newcommand{\defin}{\textcolor{darkgreen}{\textbf{Def.: }}}<CR>\newcommand{\rrfloor}{\right\rfloor}<CR>\newcommand{\llfloor}{\left\lfloor}<CR><CR><CR>\title{<{title}>}<CR>\author{<{author}>}<CR>\date{<{date}>}<CR><CR>\begin{document}<CR>    \pagestyle{empty}<CR><CR>    \maketitle\thispagestyle{empty}<CR>    \tableofcontents\thispagestyle{empty}<CR>    \newpage<CR>    \pagestyle{fancy}<CR>    \setcounter{page}{1}<CR><CR><{}><CR><CR>\end{document}
":Snippet ra \Rightarrow <{}>
":Snippet sum \sum\limits_{<{}>}^{<{}>} <{}>

function! Tex2Char()
	" remember cursor position:
	let s:line = line(".")
	let s:column = col(".")
	" if more than 'report' substitutions have been done, vim
	" displays it.
    let s:save_report = &report
    set report=99999
	" really nice Umlauts like Emacs iso-cvt writes
    %s/{\\"a}/ä/eIg
    %s/{\\"o}/ö/eIg
    %s/{\\"u}/ü/eIg
    %s/{\\"A}/Ä/eIg
    %s/{\\"O}/Ö/eIg
    %s/{\\"U}/Ü/eIg
    %s/{\\ss}/ß/eIg
	" normal styled Umlauts
    %s/\\"a/ä/eIg
    %s/\\"o/ö/eIg
    %s/\\"u/ü/eIg
    %s/\\"A/Ä/eIg
    %s/\\"O/Ö/eIg
    %s/\\"U/Ü/eIg
    %s/\\ss{}/ß/eIg
    %s/\\ss/ß/eIg
	" more rather normal styled Umlauts
    %s/\\"{a}/ä/eIg
    %s/\\"{o}/ö/eIg
    %s/\\"{u}/ü/eIg
    %s/\\"{A}/Ä/eIg
    %s/\\"{O}/Ö/eIg
    %s/\\"{U}/Ü/eIg
    %s/\\{ss}/ß/eIg
	" if you use package german or ngerman you can encode Umlauts like this
    %s/"a/ä/eIg
    %s/"o/ö/eIg
    %s/"u/ü/eIg
    %s/"A/Ä/eIg
    %s/"O/Ö/eIg
    %s/"U/Ü/eIg
    %s/"s/ß/eIg
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction
command! Tex2Char call Tex2Char()

au BufWritePost *.tex silent MakeLatex
