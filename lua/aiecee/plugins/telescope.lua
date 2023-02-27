return {

	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	priority = 1,
	config = function()
		local telescope = require("telescope")
		local telescope_themes = require("telescope.themes")

		telescope.setup({
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
		telescope.load_extension("file_browser")
		telescope.load_extension("todo-comments")
		telescope.load_extension("git_worktree")
	end,
}
