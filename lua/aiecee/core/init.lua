local M = {}

function M.setup()
  require("aiecee.core.globals").setup()
  require("aiecee.core.options").setup()
  require("aiecee.core.autocmds").setup()
end

return M
