return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<CR>",
        desc = "Find Files",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<CR>",
        desc = "Live Grep",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<CR>",
        desc = "Find Buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<CR>",
        desc = "Find Help Tags",
      },
      {
        "<leader>/",
        "<cmd>Telescope current_buffer_fuzzy_find<CR>",
        desc = "Fuzzy Search in Current File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom",
        },
        sorting_strategy = "ascending",
        winblend = 15,
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local themes = require("telescope.themes")

      -- Add extension config here (deferred until telescope is loaded)
      opts.extensions = {
        ["ui-select"] = themes.get_cursor({
          winblend = 15,
        }),
      }

      telescope.setup(opts)
      telescope.load_extension("ui-select")
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("session-lens")
    end,
  },
}
