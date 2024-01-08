local statusline_config = {
	content = {
		active = nil,
		inactive = nil,
	},
	use_icons = true,
	set_vim_settings = false,
}

require("mini.statusline").setup(statusline_config)
