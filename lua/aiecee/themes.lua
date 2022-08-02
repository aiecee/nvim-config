local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    lsp_saga = true,
    hop = true,
    which_key = true,
    neotree = {
      enable = true,
    },
  },
})

vim.cmd("colorscheme catppuccin")
