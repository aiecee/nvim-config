local rose_pine_moon = {
	base00 = "#232136",
	base01 = "#2a273f",
	base02 = "#393552",
	base03 = "#6e6a86",
	base04 = "#908caa",
	base05 = "#e0def4",
	base06 = "#e0def4",
	base07 = "#56526e",
	base08 = "#eb6f92",
	base09 = "#f6c177",
	base0A = "#ea9a97",
	base0B = "#3e8fb0",
	base0C = "#9ccfd8",
	base0D = "#c4a7e7",
	base0E = "#f6c177",
	base0F = "#56526e",
}

local base16_config = {
	palette = rose_pine_moon,
	use_cterm = true,
}

require("mini.base16").setup(base16_config)
