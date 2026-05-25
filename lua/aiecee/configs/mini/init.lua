local M = {}

function M.setup()
	require("mini.ai").setup()
	require("mini.bracketed").setup()
	require("mini.comment").setup()
	require("mini.cursorword").setup()
	require("mini.jump").setup()
	require("mini.jump2d").setup()
	require("mini.pairs").setup()
	require("mini.snippets").setup()
	require("mini.trailspace").setup()

	require("aiecee.configs.mini.base16").setup()
	require("aiecee.configs.mini.clues").setup()
	require("aiecee.configs.mini.completion").setup()
	require("aiecee.configs.mini.hipatterns").setup()
	require("aiecee.configs.mini.icons").setup()
	require("aiecee.configs.mini.move").setup()
	require("aiecee.configs.mini.statusline").setup()
	require("aiecee.configs.mini.surround").setup()
end

return M
