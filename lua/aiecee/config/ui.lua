local feline = require("feline")
local telescope = require("telescope")
local telescope_themes = require("telescope.themes")
local hop = require("hop")
local harpoon = require("harpoon")
local neo_tree = require("neo-tree")

-- neo-tree
neo_tree.setup({
  popup_border_style = "rounded",
  filesystem = {
    follow_current_file = true,
  },
  window = {
    mappings = {
      ["T"] = "toggle_node",
      ["<space>"] = "",
    },
    position = "float",
  },
})

-- Harpoon
harpoon.setup()

-- Hop
hop.setup()

-- Telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = require("telescope").extensions.hop.hop,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    lsp_definitions = {
      theme = "dropdown",
    },
    lsp_implementations = {
      theme = "dropdown",
    },
    lsp_references = {
      theme = "dropdown",
    },
    diagnostics = {
      theme = "dropdown",
    },
  },
  extensions = {
    ["ui-select"] = {
      telescope_themes.get_dropdown(),
    },
  },
})

telescope.load_extension("harpoon")
telescope.load_extension("ui-select")
telescope.load_extension("hop")
telescope.load_extension("file_browser")
telescope.load_extension("todo-comments")
telescope.load_extension("git_worktree")

-- Notify
vim.notify = require("notify")

-- Feline
feline.setup({
  preset = "icon",
  components = require("catppuccin.core.integrations.feline"),
})
