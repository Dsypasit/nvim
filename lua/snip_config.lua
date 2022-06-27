local ls = require('luasnip')
local type = require('luasnip.util.types')
require("luasnip.session.snippet_collection").clear_snippets "go"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config {
	history = true,

	updateevents = 'TextChanged,TextChangedI',

	enable_autosnippets = true,

	ext_opts = {
		[type.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			}
		}
	}
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- go

ls.add_snippets("go", {
	s("f", fmt("func {}({}) {} {{\n\t{}\n}}", { i(1, "name"), i(2), i(3), i(0) })),
	s("ie", fmt([[
		if err != nil {{
			{}
			return err
		}}
	]], {
		i(1),
	})),
	s("pr", fmt([[
		fmt.Printf("{}"{})
	]], {
		i(1), i(2)
	})),
	s("st", fmt([[
		type {} struct {{
			{}
		}}
	]], {
		i(1, "name"), i(2)
	})),
})
