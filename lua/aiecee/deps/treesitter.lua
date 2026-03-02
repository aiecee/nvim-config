return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag"
		},
    opts = {
      parsers = {
        "lua",
        "typescript",
        "javascript",
        "tsx",
        "markdown",
        "json",
        "css",
        "scss",
        "html",
        "liquid",
        "vue",
        "yaml",
        "astro",
        "python",
      }
    },
		config = function(opts)
      local ts = require("nvim-treesitter")
      ts.setup()
      ts.install(opts.parsers)
    end,
	},
  {
	  "windwp/nvim-ts-autotag",
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false
    },
    config = true
  }
}
