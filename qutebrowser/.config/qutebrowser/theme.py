# ============================
# qutebrowser modern dark theme
# ============================


def setup(c):
    # --- Dark mode for all pages ---
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.bg = "#1e1e2e"
    c.colors.webpage.preferred_color_scheme = "dark"
    c.colors.webpage.darkmode.policy.page = "smart"
    c.colors.webpage.darkmode.policy.images = "smart"

    # --- Fonts ---
    c.fonts.default_family = "JetBrainsMono Nerd Font"
    c.fonts.tabs.selected = "12pt JetBrainsMono Nerd Font"
    c.fonts.tabs.unselected = "12pt JetBrainsMono Nerd Font"
    c.fonts.statusbar = "11pt JetBrainsMono Nerd Font"

    # --- Transparent tabs bar (needs compositor) ---
    c.colors.tabs.bar.bg = "rgba(20,20,25,0.3)"
    c.colors.tabs.even.bg = "rgba(20,20,25,0.2)"
    c.colors.tabs.odd.bg = "rgba(20,20,25,0.2)"

    # --- Selected tab: subtle lift ---
    c.colors.tabs.selected.even.bg = "rgba(60,60,70,0.7)"
    c.colors.tabs.selected.odd.bg = "rgba(60,60,70,0.7)"
    c.colors.tabs.selected.even.fg = "#cdd6f4"
    c.colors.tabs.selected.odd.fg = "#cdd6f4"

    # --- Tab indicator ---
    c.colors.tabs.indicator.start = "#4c6ef5"
    c.colors.tabs.indicator.stop = "#3b5bdb"
    c.colors.tabs.indicator.system = "none"
    c.tabs.indicator.width = 2

    # --- Padding for clean look ---
    c.tabs.padding = {"top": 8, "bottom": 8, "left": 12, "right": 12}

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = "#1e1e2e"
    c.colors.statusbar.normal.fg = "#cdd6f4"

    # --- Completion menu ---
    c.colors.completion.category.bg = "#1e1e2e"
    c.colors.completion.category.fg = "#cdd6f4"
    c.colors.completion.even.bg = "#1e1e2e"
    c.colors.completion.odd.bg = "#181825"
    c.colors.completion.item.selected.bg = "#89b4fa"
    c.colors.completion.item.selected.fg = "#1e1e2e"

    # --- Scrollbar / messages ---
    c.colors.messages.info.bg = "#1e1e2e"
    c.colors.messages.info.fg = "#cdd6f4"

    # --- Hints: charcoal + dark blue mix, bigger font, more padding ---
    c.colors.hints.bg = "#1a1f2a"
    c.colors.hints.fg = "#cdd6f4"
    c.fonts.hints = "12pt JetBrainsMono Nerd Font"
    c.hints.radius = 3
    c.hints.padding = {"top": 2, "bottom": 2, "left": 8, "right": 8}

    # --- Context menu ---
    c.colors.contextmenu.menu.bg = "#1e1e2e"
    c.colors.contextmenu.menu.fg = "#cdd6f4"
    c.colors.contextmenu.selected.bg = "#89b4fa"
    c.colors.contextmenu.selected.fg = "#1e1e2e"
