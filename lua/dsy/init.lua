require('mason').setup()
--require 'alpha'.setup(require 'alpha.themes.startify'.opts)
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
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end
		},
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

require('dsy.lsp_config')
require('dsy.cmp_config')
require("dsy.tree")
require("dsy.tele")
require("dsy.snip_config")
require("bufferline").setup {
	options = {
		mode = 'tabs',
		diagnostics = "nvim_lsp",
		--indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		numbers = function(opts)
			return string.format('%s|%s.)', opts.ordinal, opts.raise(opts.id))
		end,
		separator_style = "slant"
	}
}

require("nvim-tree").setup({
	  sync_root_with_cwd = true,
	  respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
})

require("symbols-outline").setup()

-- init.lua
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = 'right',
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = 'none',
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSMethod" },
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "𝓐", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" }
	}
}

require('nvim_comment').setup()
require("project_nvim").setup({
	exclude_dirs = {"src"},
})

local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
  autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

-- vim.api.nvim_create_autocmd({ 'User' }, {
--   pattern = "SessionLoadPost",
--   group = config_group,
--   callback = function()
--     require('nvim-tree').toggle(false, true)
--   end,
-- })
--
require('gitsigns').setup()
-- default config
-- require('reach').setup({
--   notifications = true
-- })
require("harpoon").setup()

require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = ' ' },
  },
  sections = {
       lualine_c = {'%=', '%F%m',} 
  },
  extensions = {'fugitive', 'nvim-tree', 'fzf'}
}
