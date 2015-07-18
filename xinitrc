#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
DESKTOP_SESSION=gnome

DEFAULT_SESSION=i3
case $1 in
  xfce) exec dbus-launch xfce4-session ;;
  i3wm) exec dbus-launch i3 ;;
  *) exec dbus-launch  $DEFAULT_SESSION ;;
esac

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export GPG_AGENT_INFO SSH_AUTH_SOCK
