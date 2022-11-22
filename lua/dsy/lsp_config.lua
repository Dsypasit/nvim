local nvim_lsp = require('lspconfig')
require("dsy.Completion")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require "lsp_signature".setup()

local on_attach = function(client, bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
	require "lsp_signature".on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<space>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('i', '<C-s>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>df', '<cmd>lua vim..diagnostic.goto_next()<CR>',
		opts)
	buf_set_keymap('n', '<space>ds', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
		opts)
	buf_set_keymap('n', '<space>dj', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false, border = "rounded"})<CR>', opts)
	buf_set_keymap('n', '<space>dd', ':Telescope diagnostics<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.server_capabilities.document_formatting then
		-- auto save
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
		buf_set_keymap("n", "<Leader>fF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.server_capabilities.document_range_formatting then
		buf_set_keymap("n", "<Leader>fF", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end


	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		if client.server_capabilities.document_highlight then
			vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=239 guibg=#503935
      hi! LspReferenceText cterm=bold ctermbg=239 guibg=#503935
      hi! LspReferenceWrite cterm=bold ctermbg=239 guibg=#503935
    ]]
			vim.api.nvim_create_augroup('lsp_document_highlight', {})
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				group = 'lsp_document_highlight',
				buffer = 0,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd('CursorMoved', {
				group = 'lsp_document_highlight',
				buffer = 0,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end
end

vim.cmd("autocmd ColorScheme * highlight NormalFloat guibg=none ctermbg=none")
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=white guibg=none ctermbg=none")

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local util = require "lspconfig/util"

nvim_lsp.gopls.setup {
	handlers = handlers,
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

function OrgImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

--lua

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
	cmd = { "lua-language-server" },
	single_file_support = true,
	handlers = handlers,
	-- for postfix snippets and analyzers
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			format = {
				enable = true,
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

--clang
require 'lspconfig'.clangd.setup {
	handlers = handlers,
	-- for postfix snippets and analyzers
	cmd = { "clangd" },
	capabilities = capabilities,
	on_attach = on_attach,
}


--require 'lspconfig'.pyright.setup {
--handlers = handlers,
---- for postfix snippets and analyzers
--capabilities = capabilities,
--on_attach = on_attach,
--}

require 'lspconfig'.jedi_language_server.setup {
	handlers = handlers,
	-- for postfix snippets and analyzers
	capabilities = capabilities,
	on_attach = on_attach,
}

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require 'lspconfig'.html.setup {
	handlers = handlers,
	capabilities = capabilities,
	on_attach = on_attach,
}

require 'lspconfig'.rust_analyzer.setup {
	handlers = handlers,
	capabilities = capabilities,
	on_attach = on_attach,
}


require('rust-tools').setup {
	tools = { -- rust-tools options
		autoSetHints = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy"
				},
			}
		}
	},
}

require 'lspconfig'.solargraph.setup {
	handlers = handlers,
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		solargraph = {
			diagnostics = false
		}
	}
}

require('lspconfig').yamlls.setup {
	handlers = handlers,
	capabilities = capabilities,
	on_attach = on_attach,
	-- other configuration for setup {}
	settings = {
		yaml = {
			-- other settings. note this overrides the lspconfig defaults.
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["../path/relative/to/file.yml"] = "/.github/workflows/*",
				["/path/from/root/of/project"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
	}
}
