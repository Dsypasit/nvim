require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local select_opts = { behavior = cmp.SelectBehavior.Select }
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
cmp.setup({
	preselect = cmp.PreselectMode.None,
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			mode = 'symbol_text',
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]"
			})
		})
	},
	completion = {
		completeopt = 'menu,menuone,noselect'
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<up>'] = cmp.mapping.select_prev_item(select_opts),
		['<down>'] = cmp.mapping.select_next_item(select_opts),

		--['<c-k>'] = cmp.mapping.select_prev_item(select_opts),
		--['<c-j>'] = cmp.mapping.select_next_item(select_opts),

		--['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(select_opts)),
		--['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(select_opts)),

		['<c-u>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),

		['<c-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm({ select = true }),

		['<c-d>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<c-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		["<tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item(select_opts)
				--elseif luasnip.expand_or_jumpable() then
				--luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<s-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
				--elseif luasnip.jumpable(-1) then
				--luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- for luasnip users.
		{ name = 'path' },
		{ name = 'buffer' },
        { name = 'nvim_lsp_signature_help'},
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

--Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		--{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
