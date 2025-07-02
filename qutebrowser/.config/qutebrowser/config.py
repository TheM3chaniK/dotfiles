# type: ignore[reportUndefinedVariable]

# ============================
# qutebrowser config
# ============================

config.load_autoconfig()

# --- Smooth scrolling ---
c.scrolling.smooth = True

# --- Keybinds for tab switching ---
config.unbind("J")
config.unbind("K")
config.bind("<Tab>", "tab-next")
config.bind("<Shift-Tab>", "tab-prev")

config.unbind("Sh")
config.bind("sh", "history")
config.bind("ch", "history-clear")
config.bind("<Ctrl + r>", "reload")


# --- Adblock configuration ---
c.content.blocking.enabled = True
c.content.blocking.method = "both"  # use host + ABP filtering

c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
]

c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
]


c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!yt': 'https://www.youtube.com/results?search_query={}',
    '!g': 'https://www.google.com/search?q={}',
    '!gh': 'https://github.com/search?q={}',
}


# Custom Starte Page
import os
c.url.start_pages = f"file://{os.path.expanduser('~/.config/qutebrowser/startpage/index.html')}"
c.url.default_page = f"file://{os.path.expanduser('~/.config/qutebrowser/startpage/index.html')}"


c.statusbar.show = "in-mode"

# bookmark keybinds
config.unbind("M")
config.bind("sa", "bookmark-add")
config.bind("sd", "bookmark-delete")
config.unbind("Sq")
config.bind("sq", "bookmark-list")

# To Play yt video in mpv
config.bind('M', 'spawn mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio" {url}')


# In your qutebrowser config.py:
config.bind('yf', 'spawn firefox {url}')


# --- Load external theme ---
import theme

theme.setup(c)
