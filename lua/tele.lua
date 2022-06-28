local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"

require 'telescope'.load_extension('project')
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
					end
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
		}
	},
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["q"] = actions.close,
			}
		},
		--initial_mode = "normal",
	},
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"
