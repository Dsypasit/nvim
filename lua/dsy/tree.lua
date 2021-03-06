require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "rust", "go", "bash", "css", "json", "dockerfile", "http", "javascript", "vim", "yaml",
		"markdown", "http", "json", "cpp", "gomod", "tsx", "typescript", "vue", "javascript" },
	--ensure_installed = "all",
	autotag = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = { "markdown" },
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ',', -- (Optional) keymap to select the previous selection
		disable = { "markdown" },
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
	textobjects = {
		select = {
			enable = true,
			disable = { "markdown" },

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				--["iL"] = {
				---- you can define your own textobjects directly here
				--go = "(function_definition) @function",
				--},
				-- or you use the queries from supported languages with textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["ae"] = "@block.outer",
				["ie"] = "@block.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["is"] = "@statement.inner",
				["as"] = "@statement.outer",
				["ad"] = "@comment.outer",
				["am"] = "@call.outer",
				["im"] = "@call.inner"
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<space>nn",
			node_incremental = "<space>nk",
			node_decremental = "<space>nj",
			scope_incremental = "<space>nc",
		},
	},
}
