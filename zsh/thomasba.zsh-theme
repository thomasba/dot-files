# prompts for zsh

setopt ALL_EXPORT

autoload colors zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi

PR_NO_COLOR="$terminfo[sgr0]"

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BLACK; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	eval BG_$color='%{$terminfo[bold]$bg[${(L)color}]%}'
	eval BG_LIGHT_$color='%{$bg[${(L)color}]%}'
	(( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

PR_USER_COLOR=$PR_CYAN
if [[ "`whoami`" = "root" ]]; then
	PR_USER_COLOR=$PR_RED
else
	PR_USER_COLOR=$PR_LIGHT_GREEN
fi

function precmd {
    # let's get the current get branch that we are under
    # ripped from /etc/bash_completion.d/git from the git devs
    git_ps1 () {
        if which git > /dev/null; then
            local g="$(git rev-parse --git-dir 2>/dev/null)"
            if [ -n "$g" ]; then
                local r
                local b
				local date=$(git log --pretty=format:%cd --date=short -n1)
				local v=$(git describe --tags --always)
                if [ -d "$g/rebase-apply" ]; then
                    if test -f "$g/rebase-apply/rebasing"; then
                        r="|REBASE"
                    elif test -f "$g/rebase-apply/applying"; then
                        r="|AM"
                    else
                        r="|AM/REBASE"
                    fi
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                elif [ -f "$g/rebase-merge/interactive" ]; then
                    r="|REBASE-i"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -d "$g/rebase-merge" ]; then
                    r="|REBASE-m"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -f "$g/MERGE_HEAD" ]; then
                    r="|MERGING"
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                else
                    if [ -f "$g/BISECT_LOG" ]; then
                        r="|BISECTING"
                    fi
                    if ! b="$(git symbolic-ref HEAD 2>/dev/null)"; then
                       if ! b="$(git describe --exact-match HEAD 2>/dev/null)"; then
                          b="$(cut -c1-7 "$g/HEAD")..."
                       fi
                    fi
                fi
                if [ -n "$1" ]; then
                     printf "$1·%s·%s" "${b##refs/heads/}$r" "$date" "$v"
                else
                     printf "%s·%s·%s" "${b##refs/heads/}$r" "$date" "$v"
                fi
            fi
        else
            printf ""
        fi
    }
    
	GITBRANCH="$(git_ps1)"
	if [ -n "$GITBRANCH" ] ; then
		GITBRANCH=" g:$GITBRANCH"
	fi

    # The following 9 lines of code comes directly from Phil!'s ZSH prompt
    # http://aperiodic.net/phil/prompt/
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    #local PROMPTSIZE=${#${(%):--- %D{%R.%S %a %b %d %Y}\! }}
	local PROMPTSIZE=${#${(%):----%n-%m----%D{%Y-%m-%d %H:%M}----}}

    local PWDSIZE=${#${(%):-%~}}

    if [[ "$PROMPTSIZE + $PWDSIZE" -gt $TERMWIDTH ]]; then
	(( PR_PWDLEN = $TERMWIDTH - $PROMPTSIZE ))
    fi

    # set a simple variable to show when in screen
    if [[ -n "${WINDOW}" ]]; then
        SCREEN=" S:${WINDOW}"
    else
        SCREEN=""
    fi

    # check if jobs are executing
    if [[ $(jobs | wc -l) -gt 0 ]]; then
        JOBS=" J:%j"
    else
        JOBS=""
    fi

    # I want to know my battery percentage when running on battery power
    if which acpi &> /dev/null; then
        local BATTSTATE="$(acpi -b)"
        local BATTPRCNT="$(echo ${BATTSTATE[(w)4]}|sed -r 's/(^[0-9]+).*/\1/')"
        if [[ -z "${BATTPRCNT}" ]]; then
            PR_BATTERY=""
        elif [[ "${BATTPRCNT}" -lt 20 ]]; then
            PR_BATTERY="${PR_BOLD_RED}B:${BATTPRCNT}%%"
        elif [[ "${BATTPRCNT}" -lt 50 ]]; then
            PR_BATTERY="${PR_BOLD_YELLOW}B:${BATTPRCNT}%%"
        else
            PR_BATTERY="B:${BATTPRCNT}%%"
        fi
    fi
}

# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets
zle-keymap-select() {
    VIMODE="${${KEYMAP/vicmd/ vim:command}/(main|viins)}"
    RPROMPT2="${PR_BOLD_BLUE}${VIMODE}"
    zle reset-prompt
}

zle -N zle-keymap-select


function setprompt() {
	setopt prompt_subst
	IS_SSH_CONN=""
	if [ -n "$SSH_CONNECTION" ] ; then
		IS_SSH_CONN=" ${PR_RED}⚡$PR_NO_COLOR "
	fi
	PROMPT="$PR_LIGHT_CYAN┌─[ $PR_USER_COLOR%n$PR_WHITE@$PR_GREEN%m$PR_NO_COLOR $PR_LIGHT_CYAN]─($PR_NO_COLOR$PR_LIGHT_YELLOW%D{%Y-%m-%d %H:%M}$PR_NO_COLOR$PR_LIGHT_CYAN)─￫ \
$PR_NO_COLOR$PR_LIGHT_YELLOW%\${PR_PWDLEN}<...<%~%<<\
$PR_NO_COLOR\

$PR_LIGHT_CYAN├─(\${IS_SSH_CONN}$PR_NO_COLOR\${PR_BATTERY}\${SCREEN}\${JOBS}%(?.. ${PR_RED}E:%?${PR_NO_COLOR} )\
\${GITBRANCH}$PR_LIGHT_CYAN)$PR_NO_COLOR\

${PR_LIGHT_CYAN}└─[%(!.#.$)]${PR_NO_COLOR} "
}
setprompt
PS2="$PR_LIGHT_CYAN└─[$PR_NO_COLOR $PR_WHITE%_$PR_NO_COLOR $PR_LIGHT_CYAN]──￫$PR_NO_COLOR "

PS3="$PR_LIGHT_CYAN╶─[$PR_NO_COLOR?#$PR_LIGHT_CYAN]──￫$PR_NO_COLOR "
PS4="$fg[${cyan}]├──￫$terminfo[sgr0] "

# vim: ft=zsh :
