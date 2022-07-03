local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",
		},
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					["<C-r>"] = function(prompt_bufnr)
						local git_root_path =
						require("plenary.job"):new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):sync()[1]
						local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						local finder = current_picker.finder
						if finder.files then
							finder.path = git_root_path
						else
							finder.cwd = git_root_path
						end
						require("telescope._extensions.file_browser.utils").redraw_border_title(current_picker)
						current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
					end,
					["<C-t>"] = require "telescope.actions".select_tab,
					["<C-e>"] = fb_actions.create,
					["<C-m>"] = fb_actions.goto_home_dir
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		project = {
			base_dirs = {
				'~/coding',
				'~/.config/nvim',
				'~/dotfile'
			},
			hidden_files = true, -- default: false
		},
		["ui-select"] = {
			require("telescope.themes").get_cursor {

			}
		}
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

require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
require 'telescope'.load_extension('project')
