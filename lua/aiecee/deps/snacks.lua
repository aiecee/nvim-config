return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				enabled = true,
				ui_select = true,
				sources = {
					explorer = {
						auto_close = true,
						layout = "dropdown",
						follow_file = true,
					},
				},
			},
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			input = {
				enabled = true,
			},
			notifier = {
				enabled = true,
			},
			image = {
				enabled = true,
			},
		},
	},
}
