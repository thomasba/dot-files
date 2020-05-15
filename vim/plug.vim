set nocompatible              " be iMproved, required
filetype off                  " required

" on windows we have different paths …
if has("win32")
	" if plug isnt downloaded yet, grab it from the internet
	if !filereadable(expand("~/vimfiles/autoload/plug.vim"))
		" but first check if the autoload folder exists, if not: create it
		if !isdirectory(expand('~\vimfiles\autoload'))
			execute '!md ' . expand('~\vimfiles\autoload')
		endif
		" download vim-plug using bitsadmin (yeah i know, it’s deprecated)
		execute '!bitsadmin.exe /transfer "vim-plug" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ' . expand('~\vimfiles\autoload\plug.vim')
	endif
	call plug#begin('~/vimfiles/plugged')
else
	if !filereadable(expand("~/.vim/autoload/plug.vim"))
		!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	endif
	call plug#begin('~/.vim/plugged')
endif

" color
Plug 'thomasba/wombat256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'baeuml/summerfruit256.vim'


" filetype
Plug 'thomasba/mcabberlog.vim', {'for': 'mcabberlog'}
Plug 'vim-scripts/apachelogs.vim', {'for': 'apachelogs'}
Plug 'vim-scripts/syslog-syntax-file', {'for': 'messages'}
Plug 'othree/html5.vim', {'for': ['html','php']}
Plug 'vim-scripts/bbcode', {'for': 'bbcode'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'mkd.markdown'] }
" Plug 'vim-scripts/JSON.vim', {'for': 'json'}
Plug 'PProvost/vim-ps1', {'for': 'ps1'}
Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'markdown', 'mkd.markdown']}
Plug 'vim-scripts/cisco.vim'
Plug 'niklasl/vim-rdf'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/icalendar.vim'
Plug 'cespare/vim-toml'
Plug 'robertbasic/vim-hugo-helper'

" Files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
if executable('ag')
	Plug 'rking/ag.vim'
elseif executable('ack')
	Plug 'mileszs/ack.vim'
endif

" Utility
Plug 'chr4/sslsecure.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Tagbar'
Plug 'vim-scripts/loremipsum', { 'on': 'Loremipsum' }
Plug 'vim-scripts/LanguageTool', {'on': 'LanguageToolCheck'}
Plug 'thinca/vim-localrc'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'tmhedberg/matchit'
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'jamessan/vim-gnupg'
Plug 'docunext/closetag.vim', { 'for': ['html','php']  }
Plug 'lilydjwg/colorizer', { 'for': ['html','php','css','sass','scss'] }
Plug 'Townk/vim-autoclose'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'matze/vim-move'
Plug 'sk1418/Join'
Plug 'actionshrimp/vim-xpath'
" Interact with tmux from vim
Plug 'benmills/vimux'
" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'jaxbot/github-issues.vim'
Plug 'elzr/vim-json'

" test:
"Plugin 'Yggdroot/indentLine'
"Plugin 'honza/vim-snippets'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'lervag/vimtex'
"Plugin 'reedes/vim-pencil'
"Plugin 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeShow'] }

" games ...
Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }

call plug#end()
