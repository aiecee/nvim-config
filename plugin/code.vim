" LSP Config

set completeopt=menu,menuone,noselect

lua << EOF

-- cmp setup
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')
cmp.setup {
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'vsnip' },
	}),
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = {
		['<cr>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		elseif vim.fn["vsnip#available"](1) == 1 then
        		feedkey("<Plug>(vsnip-expand-or-jump)", "")
      		elseif has_words_before() then
        		cmp.complete()
      		else
        		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      		end
    	end, { "i", "s" }),

    	["<S-Tab>"] = cmp.mapping(function()
      		if cmp.visible() then
        		cmp.select_prev_item()
      		elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        		feedkey("<Plug>(vsnip-jump-prev)", "")
      		end
    	end, { "i", "s" }),
  	},
}

cmp.setup.cmdline('/', {
	sources = cmp.config.sources({
	{ name = 'buffer' }
	})
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = "cmdline" },
	})
})

-- install and configure language servers
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local servers = {
	'tsserver',
	'angularls',
	'html',
	'cssls'
}
for _, server_name in pairs(servers) do
	local available, server = lsp_installer_servers.get_server(server_name)
	if available then
		server:on_ready(function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
	
			local opts = {
				capabilities = capabilities
			}
			server:setup(opts)
		end)
	end
	if not server:is_installed() then
		server:install()
	end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	}
)	

local lspsaga = require('lspsaga')
lspsaga.setup()

local nap = require('nvim-autopairs')
nap.setup()

-- local fidget = require('fidget')
-- fidget.setup()
local lsp_notify = require('nvim-lsp-notify')
lsp_notify.setup({ debug = false })
EOF
