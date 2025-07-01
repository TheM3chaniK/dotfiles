return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup({
      type = "matrix", -- 🔥 Enable Matrix mode

      matrix = {
        head = {
          cursor = require("smoothcursor.matrix_chars"),
          texthl = { "SmoothCursor" },
          linehl = nil,
        },
        body = {
          length = 6,
          cursor = require("smoothcursor.matrix_chars"),
          texthl = { "SmoothCursorGreen" },
        },
        tail = {
          cursor = nil,
          texthl = { "SmoothCursor" },
        },
        unstop = false,
      },

      autostart = true,
      always_redraw = true,
      speed = 23,
      intervals = 35,
    })

    vim.cmd([[
  hi SmoothCursor guifg=#00FF00 guibg=NONE
  hi SmoothCursorGreen guifg=#00FF00 guibg=NONE
  ]])
  end,
}
