function cecho() {
    if [ -z "$2" ] ; then
        echo "$1"
    else
        case $1 in
            red)    echo -e "\e[0;31m$2\e[0m" ;;
            green)  echo -e "\e[0;32m$2\e[0m" ;;
            yellow) echo -e "\e[0;33m$2\e[0m" ;;
            cyan)   echo -e "\e[1;36m$2\e[0m" ;;
            purple) echo -e "\e[0;35m$2\e[0m" ;;
            white)  echo -e "\e[1;37m$2\e[0m" ;;
            ask)    echo -ne "\e[1;37m$2\e[0m" ;;
            *)      echo -e "\e[0;37m$2\e[0m" ;;
        esac
    fi
}

cecho cyan "Updating git repos..."
if [ -d ".git" ] ; then
	cecho green "  + Updating dot-files"
	git pull
elif [ -d "$HOME/dot-files" ] ; then
	cecho green "  + Updating dot-files"
	git -C "$HOME/dot-files"
else
	SYMHOME="$(readlink -f "$HOME/.zsh")"
	if [ "$SYMHOME" = "$HOME" ] || [ ! -d "$SYMHOME/.git" ] ; then
		cecho red "  ! Didn't find dot-files directroy!"
	else
		cecho green "  + Updating dot-files"
		cecho yellow "  i found dot-files at: '$SYMHOME'"
	fi
fi
if [ -d "$HOME/.zsh/zsh-autosuggestions/.git" ] ; then
	cecho green "  + Updating zsh autosuggestions"
	git -C "$HOME/.zsh/zsh-autosuggestions" pull
else
	cecho red "  ! Didn't find zsh autosuggestions repo "
fi
cecho cyan "Updating vim plugins..."
cecho green "  + Upgrading Plug... "
vim -nE +"colorscheme default" +PlugUpgrade +qall
cecho green "  + Installing and updating plugins..."
vim -nE +"colorscheme default" +PluginInstall +PlugUpdate +qall
