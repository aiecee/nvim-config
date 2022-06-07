local fterm = require("FTerm")

local lazygit_term = fterm:new({
  ft = "fterm_lazygit",
  cmd = "lazygit",
  dimensions = {
    width = 0.9,
    height = 0.9,
  },
})

local M = {}

function M.open_git()
  lazygit_term:open()
end

function M.close_git()
  lazygit_term:close()
end

function M.toggle_git()
  lazygit_term:toggle()
end

return M
