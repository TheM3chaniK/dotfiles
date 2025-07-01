# 📂 My Dotfiles

What's up my fellow hackers. This is my dotfile repo. Here you can find configs of my personal coding enviorments feel free to use it if you dont wanna make your own. But dont give any merge request as I wont gonna accept it. Have fun enjoy

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) for simple, modular symlink management.

---

## 📦 Structure

- **Root directory:** contains dotfiles and config folders for `$HOME` 
- **`etc/`**: contains configs that belong under `/etc` 

Each folder or config is a **stow package**.

---

## ⚡ Requirements

- **GNU Stow**

Install it:  
```bash
sudo pacman -S stow   # Arch
sudo apt install stow # Debian/Ubuntu
```
## 🗂️ How to use

### 1. Mannually
you can use stow to symlink the dotfiles

```bash
stow -t <target_dir> <config_name>
```

**Example:**
```bash
sudo stow -t /etc etc/keyd
```

```bash
stow -t ~ nvim
```
### 2. Automatic
There will be install.sh script soon to install the dotfiles automatically

---

### 📌 Tips

- Keep each config tidy — one logical config per folder.
- To **unstow** (remove symlinks):

```bash
stow -D <package>
```
```bash
sudo stow -D -t /etc etc/<package>
```
- Always check what will be linked before running with `sudo`.

---

### 🫧 License

If you like my config clone it and use I wont mind
