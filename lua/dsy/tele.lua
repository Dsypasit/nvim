local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"

require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",
		},
	},
	pickers = {
		lsp_code_actions = {
			theme = "cursor",
		},
		code_action = {
			theme = "cursor",
		},
		lsp_workspace_diagnostics = {
			theme = "dropdown",
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
			},
			n = {
				["<C-c>"] = actions.close,
			},
		}
	},
}

require("telescope").load_extension "fzf"
--require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"
