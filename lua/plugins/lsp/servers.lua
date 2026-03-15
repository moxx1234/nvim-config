return {
	"neovim/nvim-lspconfig",
	dependencies = { "antosha417/nvim-lsp-file-operations" },

	config = function()
		local util = require("lspconfig.util")

		require("lsp-file-operations").setup()

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = { checkThirdParty = false },
						completion = { callSnippet = "Replace" },
					},
				},
			},
			eslint = {
				root_dir = function(fname)
					local patterns = {
						".eslintrc",
						".eslintrc.js",
						".eslintrc.json",
						".eslintrc.yaml",
						".eslintrc.yml",
						"eslint.config.js",
						"eslint.config.mjs",
						"eslint.config.cjs",
					}
					return util.root_pattern(unpack(patterns))(fname)
				end,
				settings = {
					workingDirectory = { mode = "location" },
				},
			},

			cssls = {},
			css_variables = {},
			cssmodules_ls = {},
			emmet_ls = {},
			html = {},
			jsonls = {},
			prismals = {},

			pyright = {
				root_dir = require("lspconfig.util").root_pattern(
					"pyproject.toml",
					"setup.py",
					"requirements.txt",
					".git"
				),
				settings = {
					python = {
						pythonPath = vim.fn.systemlist("poetry run which python")[1],
					},
				},
			},

			pylsp = {},
			tailwindcss = {},
			ts_ls = {
				settings = {
					typescript = {
						suggest = {
							autoImports = true, -- Включаем автоимпорты
							completeFunctionCalls = true,
						},
						updateImportsOnFileMove = { enabled = "always" },
					},
					javascript = {
						suggest = { autoImports = true },
						updateImportsOnFileMove = { enabled = "always" },
					},
				},
			},
			yamlls = {},
		}

		local on_attach = function(_, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end
			map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
			map("n", "K", vim.lsp.buf.hover, "Hover Docs")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
		end

		for name, opts in pairs(servers) do
			-- если явно указан enabled = false → не подключаем
			if opts.enabled == nil or opts.enabled == true then
				if opts.on_attach == nil then
					opts.on_attach = on_attach
				end
				vim.lsp.config(name, opts)
				vim.lsp.enable(name)
			end
		end
	end,
}
