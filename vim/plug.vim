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
Plug 'altercation/vim-colors-solarized'
Plug 'baeuml/summerfruit256.vim'


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
Plug 'vim-scripts/cisco.vim'
Plug 'niklasl/vim-rdf'
Plug 'nathanaelkane/vim-indent-guides'

" Files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'kien/ctrlp.vim'
if executable('ag')
	Plug 'rking/ag.vim'
elseif executable('ack')
	Plug 'mileszs/ack.vim'
endif

" Utility
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

" test:
"Plugin 'Yggdroot/indentLine'
"Plugin 'honza/vim-snippets'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'lervag/vimtex'
"Plugin 'reedes/vim-pencil'
"Plugin 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeShow'] }

call plug#end()
