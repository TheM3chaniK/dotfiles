# Qutebrowser

**Qutebrowser** is a minimal, keyboard-driven web browser for power users. If you haven’t tried it yet, I highly recommend giving it a shot — it’s fast, lightweight, and designed to be controlled entirely from the keyboard.

---

## 📦 Installing Qutebrowser

Here’s how to install **Qutebrowser** on common Linux distributions.

---

### ✅ Linux

#### ➜ Arch / Manjaro

Qutebrowser is available in the official repositories:

```bash
sudo pacman -S qutebrowser
```

---

#### ➜ Debian / Ubuntu

Use `apt` to install:

```bash
sudo apt update
sudo apt install qutebrowser
```

---

#### ➜ Other Distros

Check your package manager:

- **Fedora:**

```bash
 sudo dnf install qutebrowser
```

- **NixOS:**
  Add \`qutebrowser\` to your `environment.systemPackages`.

Or visit the official site for instructions:
👉 [https://qutebrowser.org/](https://qutebrowser.org/)

---

### ✅ Optional: Python Virtualenv

You can also install Qutebrowser in a virtual Python environment:

```bash
python3 -m venv qute-env
source qute-env/bin/activate
pip install qutebrowser
```

---

### ⚡ Run It

Launch Qutebrowser with:

```bash
qutebrowser
```

Happy hacking with your keyboard-driven web! 🧩

## 🚫 Block Ads Like Brave

Qutebrowser can block ads and trackers using the same filter lists trusted by extensions like **uBlock Origin** or **Adblock Plus** — but you need to set it up first.

---

### ✅ 1️⃣ Install the `python-adblock` package

This enables ABP-compatible filter support (e.g. EasyList).

**Arch/Manjaro:**

```bash
sudo pacman -S python-adblock
```

**Debian/Ubuntu:**

```bash
sudo apt install python3-adblock
```

Or using `pip`:

```bash
pip install adblock
```

---

### ✅ 2️⃣ Add filter lists in `config.py`

Edit your \`~/.config/qutebrowser/config.py\` and add this section:

```python
# --- Adblock configuration ---
c.content.blocking.enabled = True
c.content.blocking.method = 'both'  # Use both hosts + ABP filtering

c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
]

c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
]
```

---

### ✅ 3️⃣ Update & reload the blocker

After editing, reload your config and update the filter lists directly from within Qutebrowser:

```bash
:config-source
:adblock-update
```

---

## 🎉 That’s it!

You now have a clean, powerful browsing experience with robust ad and tracker blocking — all with Qutebrowser’s minimalist, keyboard-centric style.

---

**Happy browsing!** 🚀
