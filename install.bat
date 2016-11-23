SET HP=%HOMEDRIVE%%HOMEPATH%\
SET DP=%~dp0
mklink /D %HP%vimfiles %DP%vim
mklink %HP%_vimrc %DP%vim\vimrc
mklink %HP%.gitconfig %DP%gitconfig
