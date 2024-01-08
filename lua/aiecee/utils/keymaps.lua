local function map_table(table)
	for mode, mappings in pairs(table) do
		for _, mapping in pairs(mappings) do
			vim.keymap.set(mode, mapping[1], mapping[2], { desc = mapping[3] })
		end
	end
end

return map_table
