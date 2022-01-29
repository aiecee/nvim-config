
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
			vim.fn['vsnip#anonymous'](args.body)
		end
	},
	mapping = {
		['<cr>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		['<tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		elseif vim.fn['vsnip#available'](1) == 1 then
        		feedkey('<Plug>(vsnip-expand-or-jump)', '')
      		elseif has_words_before() then
        		cmp.complete()
      		else
        		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      		end
    	end, { 'i', 's' }),

    	['<S-tab>'] = cmp.mapping(function()
      		if cmp.visible() then
        		cmp.select_prev_item()
      		elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        		feedkey('<Plug>(vsnip-jump-prev)', '')
      		end
    	end, { 'i', 's' }),
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
