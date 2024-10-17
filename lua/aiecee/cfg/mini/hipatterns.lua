return function()
	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'INFO'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			info = { pattern = "%f[%w]()INFO()%f[%W]", group = "MiniHipatternsNote" },
			given = { pattern = "%f[%w]()GIVEN()%f[%W]", group = "MiniHipatternsHack" },
			when = { pattern = "%f[%w]()WHEN()%f[%W]", group = "MiniHipatternsHack" },
			["then"] = { pattern = "%f[%w]()THEN()%f[%W]", group = "MiniHipatternsHack" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end
