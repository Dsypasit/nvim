require 'alpha'.setup(require 'alpha.themes.startify'.opts)
require("rest-nvim").setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		show_http_info = true,
		show_headers = true,
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = '.env',
	custom_dynamic_variables = {},
	yank_dry_run = true,
})
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("hlslens").setup({
	build_position_cb = function(plist, _, _, _)
		require("scrollbar.handlers.search").handler.show(plist.start_pos)
	end,
})

vim.cmd([[
    augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    augroup END
]])

require('neoscroll').setup()

require('dsy.lsp_config')
require('dsy.cmp_config')
require("dsy.tree")
require("dsy.tele")
require("dsy.snip_config")
require("bufferline").setup {
	options = {
		mode = 'buffers',
		diagnostics = "nvim_lsp",
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		numbers = "ordinal",
		separator_style = "slant"
	}
}

require("nvim-tree").setup()
