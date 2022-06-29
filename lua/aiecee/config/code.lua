local autopairs = require("nvim-autopairs")
local treesitter_install = require("nvim-treesitter.install")
local treesitter_config = require("nvim-treesitter.configs")
local indent_blankline = require("indent_blankline")
local comment = require("Comment")
local todo_comments = require("todo-comments")
-- local neogit = require("neogit")

-- Autopairs
autopairs.setup()

-- Treesitter
treesitter_install.compilers = { "clang", "gcc" }
treesitter_config.setup({
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_cursor_on_move = true,
    },
  },
})

-- Indent-blankline
indent_blankline.setup({
  filetype_exclude = { "dashboard" },
  show_current_context = true,
  show_current_context_start = true,
})

-- Comment
comment.setup()

-- todo-comments
todo_comments.setup({
  highlight = {
    pattern = [[.*<(KEYWORDS)\s*]],
  },
  search = {
    pattern = [[\b(KEYWORDS)\b]],
  },
})
