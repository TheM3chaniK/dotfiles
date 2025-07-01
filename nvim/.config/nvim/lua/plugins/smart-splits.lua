return {
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("smart-splits").setup()

      -- movement keybindings
      vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
      vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
      vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
      vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

      -- resizing splits
      vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
      vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
      vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
      vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

      -- Horizontal split (new buffer)
      vim.keymap.set("n", "<leader>\"", ":split<CR>", { desc = "Horizontal Split" })

      -- Vertical split (new buffer)
      vim.keymap.set("n", "<leader>%", ":vsplit<CR>", { desc = "Vertical Split" })

      vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { desc = "Close current pane" })

    end,
  },
}
