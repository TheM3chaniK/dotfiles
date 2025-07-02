# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

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
print_banner

# Override `clear` to clear + show banner again
alias clear='command clear && print_banner'


# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -la'
alias la='ls -a'
alias ll='ls -l'
alias lt='ls --tree'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=0
setopt appendhistory

export __NV_PRIME_RENDER_OFFLOAD=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# ~/.zshrc

# fzf auto-completion
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# fzf key bindings (Ctrl-T, Ctrl-R, Alt-C)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# For the gio not to interfare take everything in trash
alias gio='false'


# Ctrl+E to run yazi
bindkey -s '^E' 'yazi\n'


# Eval the zoxide
eval "$(zoxide init zsh)"

[ -f /usr/bin/zoxide ] && alias cd="z"

