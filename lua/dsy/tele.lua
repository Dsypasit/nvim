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
        repo = {
            list = {
                fd_opts = {
                    "--no-ignore-vcs",
                },
                search_dirs = {
                    "~/code",
                },
            },
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
        preview = {
            hide_on_startup = true, -- hide previewer when picker starts
        },
        file_ignore_patterns = {"node_modules"},
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
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
require'telescope'.load_extension'repo'
