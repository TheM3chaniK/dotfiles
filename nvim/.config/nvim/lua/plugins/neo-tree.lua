return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",    -- Icons for files/folders
    "MunifTanjim/nui.nvim",            -- UI components
  },
  lazy = false,                       -- Load immediately on startup
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<CR>",
      desc = "Toggle Neo-tree File Explorer",
    },
  },
  opts = {
    window = {
      position = "float",             -- Floating window for sleek look
      width = 35,                    -- Slightly wider for better visibility
      popup = {
        border = "rounded",          -- Rounded border for style
        winblend = 10,               -- Slight transparency for modern feel
      },
      mappings = {
      ["l"] = "set_root",             -- Use `l` to open as well
    }
    },
    filesystem = {
      follow_current_file = { enabled = true },  -- Auto jump to current file
      hijack_netrw_behavior = "open_default",   -- Replace netrw behavior
      use_libuv_file_watcher = true,             -- Efficient file watching
      filtered_items = {
        visible = true,            -- Hide dotfiles by default
        hide_dotfiles = false,
        hide_gitignored = false,    -- Hide gitignored files
      },
    },
    git = {
      enable = true,               -- Show git status icons
      ignore = false,
    },
    default_component_configs = {
      indent = {
        padding = 1,              -- Padding for indent guides
        with_markers = true,
        indent_marker = "│",      -- Stylish vertical line
        last_indent_marker = "└", -- End marker
      },
      icon = {
        folder_closed = "",      -- Folder icons (nerd font)
        folder_open = "",
        folder_empty = "",
        default = "",            -- Default file icon
      },
      git_status = {
        symbols = {
          added = "",
          modified = "柳",
          removed = "",
          renamed = "➜",
          untracked = "★",
          ignored = "◌",
          unstaged = "✗",
          staged = "✓",
          conflict = "",
        },
      },
    },
  },
}

