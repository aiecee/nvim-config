---@diagnostic disable: unused-local
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

local uwunicorn = {
	base00 = "#241b26",
	base01 = "#2f2a3f",
	base02 = "#46354a",
	base03 = "#6c3cb2",
	base04 = "#7e5f83",
	base05 = "#eed5d9",
	base06 = "#d9c2c6",
	base07 = "#e4ccd0",
	base08 = "#877bb6",
	base09 = "#de5b44",
	base0A = "#a84a73",
	base0B = "#c965bf",
	base0C = "#9c5fce",
	base0D = "#6a9eb5",
	base0E = "#78a38f",
	base0F = "#a3a079",
}

local stella = {
	base00 = "#2B213C",
	base01 = "#362B48",
	base02 = "#4D4160",
	base03 = "#655978",
	base04 = "#7F7192",
	base05 = "#998BAD",
	base06 = "#B4A5C8",
	base07 = "#EBDCFF",
	base08 = "#C79987",
	base09 = "#8865C6",
	base0A = "#C7C691",
	base0B = "#ACC79B",
	base0C = "#9BC7BF",
	base0D = "#A5AAD4",
	base0E = "#C594FF",
	base0F = "#C7AB87",
}

local base16_config = {
	palette = stella,
	use_cterm = true,
}

require("mini.base16").setup(base16_config)
vim.cmd([[highlight link FloatBorder FloatTitle]])
