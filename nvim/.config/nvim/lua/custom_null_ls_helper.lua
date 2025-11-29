local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local M = {}

function M.simple_formatter(cmd, filetypes, args)
  return {
    name = cmd,
    method = null_ls.methods.FORMATTING,
    filetypes = filetypes or {},
    generator = helpers.formatter_factory({
      command = cmd,
      args = args or { "-" },
      to_stdin = true,
    }),
  }
end

return M

