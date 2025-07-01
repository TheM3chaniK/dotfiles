return {
  -- Project Root Detection
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "Makefile", "package.json", "pyproject.toml" },
      })
      require("telescope").load_extension("projects")
    end,
  },

  -- Workspace Management
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        hooks = {
          open = {
            "Telescope find_files", -- open file picker on workspace switch
          },
        },
      })
    end,
  },

  -- Session Management
    {
    "rmagatti/auto-session",
    config = function()
      -- Fix the missing `localoptions` warning
      vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,localoptions"

      require("auto-session").setup({
        log_level = "info",
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      })
    end,
  }
}
