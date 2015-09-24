set nocompatible              " be iMproved, required
filetype off                  " required

if !filereadable(expand("~/.vim/autoload/plug.vim"))
	if has("win32")
		!curl -fLo \%USERPROFILE\%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	else
		!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	endif
endif

call plug#begin('~/.vim/plugged')

" color
Plug 'thomasba/wombat256.vim'


" filetype
Plug 'vim-scripts/mcabberlog.vim', {'for': 'mcabberlog'}
Plug 'vim-scripts/apachelogs.vim', {'for': 'apachelogs'}
Plug 'vim-scripts/syslog-syntax-file', {'for': 'messages'}
Plug 'othree/html5.vim', {'for': ['html','php']}
Plug 'vim-scripts/bbcode', {'for': 'bbcode'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'mkd.markdown'] }


Plug 'vim-scripts/JSON.vim', {'for': 'json'}
Plug 'PProvost/vim-ps1', {'for': 'ps1'}
Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'markdown', 'mkd.markdown']}

" Files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'kien/ctrlp.vim'
if executable('ag')
	Plug 'rking/ag.vim'
elseif executable('ack')
	Plug 'mileszs/ack.vim'
endif

" Utility
Plug 'tpope/vim-speeddating'
Plug 'Lokaltog/vim-powerline'
Plug 'vim-scripts/Tagbar'
Plug 'vim-scripts/loremipsum', { 'on': 'Loremipsum' }
Plug 'vim-scripts/LanguageTool', {'on': 'LanguageToolCheck'}
Plug 'thinca/vim-localrc'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/matchit'
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'jamessan/vim-gnupg', { 'for': 'gpg' }
Plug 'docunext/closetag.vim', { 'for': ['html','php']  }
Plug 'lilydjwg/colorizer', { 'for': ['html','php','css','sass','scss'] }
Plug 'Townk/vim-autoclose'
" Interact with tmux from vim
Plug 'benmills/vimux'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

" test:
"Plugin 'Yggdroot/indentLine'
"Plugin 'honza/vim-snippets'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'lervag/vimtex'
"Plugin 'reedes/vim-pencil'
"Plugin 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'

call plug#end()
