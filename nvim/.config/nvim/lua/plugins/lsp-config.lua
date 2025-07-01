return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "bashls" }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.bashls.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.tailwindcss.setup({capabilities = capabilities})

      vim.keymap.set('n', 'H', vim.lsp.buf.hover, { desc = "LSP Hover Docs" })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP code actions" })
      vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "LSP rename symbol" })
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = "LSP go to definition" })
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
      vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, { desc = "LSP Function Signature Help" })
      vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, { desc = "LSP Type definition" })
    end,
  },
}
