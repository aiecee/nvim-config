local fterm = require("FTerm")

function create_lazygit_term()
  return fterm:new({
    ft = "fterm_lazygit",
    cmd = "lazygit",
    dimensions = {
      width = 0.9,
      height = 0.9,
    },
  })
end

local M = {}

function M.open_git()
  create_lazygit_term():open()
end

function M.close_git()
  create_lazygit_term():close()
end

function M.toggle_git()
  create_lazygit_term():toggle()
end

return M
