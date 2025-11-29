#!/bin/bash

# A script to install all the necessary packages and configurations for these dotfiles.

# --- Helper Functions ---
info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
    exit 1
}

# --- System Update ---
info "Updating system..."
sudo pacman -Syu --noconfirm || error "Failed to update system."

# --- Install Git and Base-devel ---
info "Installing Git and base-devel..."
sudo pacman -S --needed git base-devel --noconfirm || error "Failed to install git and base-devel."

# --- Install Paru (AUR Helper) ---
if ! command -v paru &> /dev/null; then
    info "Installing paru..."
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
    rm -rf /tmp/paru
else
    info "Paru is already installed."
fi

# --- Package Lists ---
OFFICIAL_PKGS=(
    sway
    swaylock
    swayidle
    swaync
    waybar
    kitty
    zsh
    neovim
    tmux
    tmuxinator
    stow
    keyd
    lolcat
    figlet
    zoxide
    lsd
    fd
    fzf
    lazygit
    swww
    network-manager-applet
    ufw
    gtk3
    gtk4
    blueman
    pavucontrol
    pipewire
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    docker
    docker-buildx
    docker-compose
    lazydocker
    thunar
    ripgrep
    tlp
    bat
    pv
    rsync
    brightnessctl
    wl-clipboard
    xorg-wayland
    wayland-utils
    nvidia-open
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
)

AUR_PKGS=(
    wofi
    autotiling
    ttf-jetbrains-mono-nerd
    swaylock-effects
    catppuccin-gtk-theme-mocha
    rofi-wayland
    swayfx
    workstyle-git
    waypaper
)

# --- Install Packages ---
info "Installing official packages..."
sudo pacman -S --needed "${OFFICIAL_PKGS[@]}" --noconfirm || error "Failed to install official packages."

info "Installing AUR packages..."
paru -S --needed "${AUR_PKGS[@]}" --noconfirm || error "Failed to install AUR packages."

# --- Setup Oh-My-Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    info "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    info "Oh-My-Zsh is already installed."
fi

# --- Setup NVM and Node.js ---
info "Installing NVM and Node.js..."
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
else
    info "NVM is already installed."
fi

# --- Setup Tmux Plugin Manager ---
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    info "Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    info "TPM is already installed."
fi

# --- Optional Flutter Installation ---
if [ ! -d "$HOME/.config/flutter/flutter" ]; then
    read -p "Do you want to install Flutter for development? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        info "Installing Flutter..."
        git clone https://github.com/flutter/flutter.git ~/.config/flutter/flutter
    fi
fi

# --- Enable System Services ---
info "Enabling system services..."
sudo systemctl enable --now keyd
sudo systemctl enable --now tlp
sudo systemctl enable ufw
sudo ufw default deny incoming
systemctl --user enable --now pipewire pipewire-pulse

# --- Stow Dotfiles ---
info "Linking dotfiles with Stow..."
stow sway kitty wofi tmux zsh nvim waybar gtk
sudo stow -t /etc ./etc/tlp/ ./etc/keyd/
info "Installation complete! Please reboot your system for all changes to take effect."
