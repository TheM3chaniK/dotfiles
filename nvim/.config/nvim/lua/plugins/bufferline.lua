return {
  {
    "akinsho/bufferline.nvim",
    version = "*", -- latest stable
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "none",
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
          show_buffer_icons = true,
          show_close_icon = false,
          show_buffer_close_icons = true,
          separator_style = "slant",
          always_show_bufferline = true,
        },
      })

      -- Keybindings
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Buffer navigation
      map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
      map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

      -- Move buffer positions
      map("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", opts)
      map("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", opts)

      -- Pick and close buffers
      map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", opts)
      map("n", "Q", "<cmd>bd!<CR>", opts)

      -- Sort buffers
      map("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", opts)
      map("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", opts)

      -- Close others
      map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", opts)

    end,
  },
}

