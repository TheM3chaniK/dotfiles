return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- Always include Stylua (tracked)
    local sources = {
      null_ls.builtins.formatting.stylua,
    }

    -- Try to load extra local formatters
    local ok, local_sources = pcall(require, "none_ls_sources")
    if ok then
      -- Add local ones to the main sources
      for _, source in ipairs(local_sources) do
        table.insert(sources, source)
      end
    end

    null_ls.setup({
      sources = sources,
    })

    vim.keymap.set("n", "<leader>ft", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format current buffer" })
  end,
}

