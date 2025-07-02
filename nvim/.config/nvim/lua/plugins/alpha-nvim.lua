return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local user = os.getenv("BANNER_USER")
      local handle = io.popen("figlet " .. user)
      local ascii_user = handle:read("*a")
      handle:close()

      -- then split ascii_user into lines
      local lines = {}
      for line in ascii_user:gmatch("[^\r\n]+") do
        table.insert(lines, line)
      end

      dashboard.section.header.val = lines

      -- 🚀 Buttons (Custom Menu Options)
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("o", "  Open project", "<cmd>Telescope session-lens search_session<CR>"),
        dashboard.button("g", "󰈬  Live grep", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      }

      -- 💅 Footer
      dashboard.section.footer.val = {
        "Fuck Society \u{1F595}",
      }

      -- 🧼 Layout tweaks
      dashboard.opts.layout[1].val = 8 -- padding above the header
      dashboard.section.header.opts.hl = "Constant"
      dashboard.section.footer.opts.hl = "Type"

      alpha.setup(dashboard.opts)
    end,
  },
}
