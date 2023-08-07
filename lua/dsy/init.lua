require('mason').setup()
require('mason-lspconfig').setup()
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
		-- separator_style = "slant"
	}
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
-- require("project_nvim").setup({
-- 	exclude_dirs = {"src"},
-- })

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

require('lualine').setup {
  options = {
    theme = 'gruvbox-material',
    component_separators = '',
    section_separators = { left = '', right = ' ' },
  },
  sections = {
       lualine_c = {'%=', '%F%m',},
  },
  extensions = {'fugitive', 'nvim-tree', 'fzf', 'quickfix'}
}

-- require('leap').add_default_mappings()
require('dressing').setup()
require("which-key").setup {
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        -- winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
}
require('spectre').setup()

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

require'hop'.setup { 
    keys = 'l;uiopnmvqwertasdfghjk',
    current_line_only = false,
    jump_on_sole_occurrence = true,
}
-- place this in one of your configuration file(s)

-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<space>fk", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<space>fj", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<space>fk", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<space>fk", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- normal mode (sneak-like)
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- visual mode (sneak-like)
vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})
