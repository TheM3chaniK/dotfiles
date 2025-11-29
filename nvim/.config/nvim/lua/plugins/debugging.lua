return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim", -- ✅ Mason integration
      "williamboman/mason.nvim",      -- ensure mason itself is installed
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local mason_dap = require("mason-nvim-dap")

      dapui.setup()

      mason_dap.setup({
        ensure_installed = { "python", "cppdbg", "codelldb" }, -- ✅ optional: preinstall adapters
        automatic_installation = true, -- install DAPs automatically when configured
      })

      -- 🔹 Keymaps
      vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
      vim.keymap.set('n', '<Leader>dso', function() dap.step_over() end)
      vim.keymap.set('n', '<Leader>dsi', function() dap.step_into() end)
      vim.keymap.set('n', '<Leader>dst', function() dap.step_out() end)
      vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)

      -- 🔹 Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}

