# ~/.profile
# Sourced by multiple shell clients including bash on login
# Should set env variables here you want inherited by all programs

# Environment variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/$UID

export EDITOR=nvim
export NVIM_APPNAME=nvim

# .profile default from /etc/skel/.profile
# Need to source .bashrc

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# $PATH Additions
export PATH="$PATH:/opt/mssql-tools18/bin"


. "$HOME/.local/share/../bin/env"
