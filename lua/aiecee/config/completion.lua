local cmp = require("cmp")
local lspkind = require("lspkind")
local under_comparator = require("cmp-under-comparator")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "rg" },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				with_text = true,
				menu = {
					nvim_lsp = "[Lsp]",
					cmp_tabnine = "[Tab]",
					buffer = "[Buf]",
					vsnip = "[Snp]",
					path = "[Pth]",
					rg = "[Rip]",
				},
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<cr>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<esc>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end),
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			under_comparator.under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
