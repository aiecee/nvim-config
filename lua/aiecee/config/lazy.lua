local M = {}

function M.setup()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
	end
	vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		import = "aiecee.plugins",
		defaults = {
			lazy = true,
		},
		install = { missing = true },
		ui = {
			border = "single",
		},
	})
end

return M
