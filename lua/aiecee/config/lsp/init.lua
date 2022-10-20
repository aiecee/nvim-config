local lspsaga = require("lspsaga")

local css = require("aiecee.config.lsp.css")
local go = require("aiecee.config.lsp.go")
local html = require("aiecee.config.lsp.html")
local json = require("aiecee.config.lsp.json")
local kotlin = require("aiecee.config.lsp.kotlin")
local liquid = require("aiecee.config.lsp.liquid")
local lua = require("aiecee.config.lsp.lua")
local python = require("aiecee.config.lsp.python")
local rust = require("aiecee.config.lsp.rust")
local tailwind = require("aiecee.config.lsp.tailwind")
local typescript = require("aiecee.config.lsp.typescript")
local null = require("aiecee.config.lsp.null")

local M = {}

function M.setup()
	css.setup()
	go.setup()
	html.setup()
	json.setup()
	kotlin.setup()
	liquid.setup()
	lua.setup()
	python.setup()
	rust.setup()
	tailwind.setup()
	typescript.setup()

	null.setup()

	lspsaga.init_lsp_saga({})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})
end

return M
