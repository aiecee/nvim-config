local harpoon = require("harpoon")
local telescope = require("telescope")
local hop = require("hop")

-- Harpoon
harpoon.setup()
telescope.load_extension("harpoon")
telescope.load_extension("ui-select")
telescope.load_extension("hop")
telescope.load_extension("file_browser")

-- Hop
hop.setup()
