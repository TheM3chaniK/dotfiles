# 📂 My Dotfiles

Welcome, fellow hackers! This repository contains my personal dotfiles for a complete and customized development environment. Feel free to use them, but please note that this is a personal setup, so review the scripts before running them.

This setup is tailored for **Arch Linux** and uses `sway` as the window manager.

---

## 🚀 Installation

The easiest way to get started is to use the `install.sh` script. It will install all the necessary packages, tools, and configurations.

### Prerequisites

- An **Arch-based** Linux distribution.
- `git` installed (`sudo pacman -S git`).

### Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/dotfiles.git
    cd dotfiles
    ```

2.  **Run the installer:**
    The script will ask for `sudo` permissions to install packages and set up system configurations.
    ```bash
    ./install.sh
    ```

---

## ✨ What's Included?

The installation script sets up a complete development environment with the following main components:

-   **Window Manager:** `sway` (with `swayfx`, `swaylock-effects`, `waybar`, `wofi`, `swaync`)
-   **Terminal:** `kitty`
-   **Shell:** `zsh` with `oh-my-zsh`
-   **Editor:** `neovim` (pre-configured)
-   **Multiplexer:** `tmux` with TPM (Tmux Plugin Manager)
-   **Tools:** `git`, `lazygit`, `fzf`, `ripgrep`, `fd`, `zoxide`, and many more.
-   **System:** `keyd` for key remapping, `tlp` for power management, `pipewire` for audio.
-   **Fonts:** JetBrains Mono Nerd Font and Noto Fonts.
-   **Themes:** Catppuccin Mocha theme for GTK and other applications.

The script also takes care of:
-   Installing an AUR helper (`paru`).
-   Setting up `nvm` for Node.js management.
-   Optionally installing the Flutter SDK.
-   Enabling necessary system services.

---

## 🗂️ Manual Management with Stow

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for modular symlink management. If you prefer not to use the full installation script, you can symlink the configurations manually.

### Requirements

-   **GNU Stow:**
    ```bash
    sudo pacman -S stow
    ```

### Usage

To link a configuration, use the `stow` command from within the `dotfiles` directory:

```bash
# Symlink the nvim config to ~/.config/nvim
stow nvim

# Symlink the keyd config to /etc/keyd
sudo stow -t /etc etc/keyd
```

To remove the symlinks:

```bash
stow -D nvim
sudo stow -D -t /etc etc/keyd
```

---

### 🫧 License

If you like my config, clone it and use it. I won't mind.