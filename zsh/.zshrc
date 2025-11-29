# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
#
# Capitalize the username properly

export BANNER_USER="The $(printf "%s%s" "$(echo "${USER:0:1}" | tr '[:lower:]' '[:upper:]')" "$(echo "${USER:1}" | tr '[:upper:]' '[:lower:]')")"


# Define a reusable banner function
print_banner() {
    figlet "$BANNER_USER" | lolcat
    echo "Welcome back, Master" | lolcat
}

# Print the banner now
if command -v lolcat figlet &>/dev/null; then
    print_banner
    # Override `clear` to clear + show banner again
    alias clear='command clear && print_banner'
fi




# Set-up icons for files/directories in terminal using lsd
if command -v lsd &>/dev/null; then
    alias ls='lsd'
    alias l='ls -lA'
    alias la='ls -A'
    alias ll='ls -l'
    alias lt='ls --tree'
fi

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=0
setopt appendhistory

export __NV_PRIME_RENDER_OFFLOAD=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# ~/.zshrc


# For the gio not to interfare take everything in trash
alias gio='false'


# Ctrl+E to run yazi
bindkey -s '^E' 'yazi\n'


# Eval the zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    [ -f /usr/bin/zoxide ] && alias cd="z"
fi



if command -v nvim &>/dev/null; then
    export EDITOR=nvim
fi
# Cargo Path
export PATH="$HOME/.cargo/bin:$PATH"


#alias for tmuxinator
alias ti="tmuxinator"
alias tis="tmuxinator start"
alias tie="tmuxinator edit"
alias tid="tmuxinator delete"
alias tin="tmuxinator new"

if command -v bat &>/dev/null; then
    alias cat='bat'
fi


# screen_cast
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Masking that other and as well as same grp user cant r/w/x file by default
umask 077
export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/go/bin
if [ -d "$HOME/.config/flutter/flutter/bin" ]; then
    export PATH="$HOME/.config/flutter/flutter/bin/:$PATH"
fi
