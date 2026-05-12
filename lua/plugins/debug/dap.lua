return {
	'mfussenegger/nvim-dap',
	dependencies = {
		{
			'jay-babu/mason-nvim-dap.nvim',
			opts = {
				ensure_installed = { 'codelldb' },
				handlers = {},
			},
		},

		{
			"igorlfs/nvim-dap-view",
			-- let the plugin lazy load itself
			lazy = false,
			version = "1.*",
			---@module 'dap-view'
			---@type dapview.Config
			opts = {
				windows = {
					position = 'right',
					size = 0.40,
					terminal = {
						position = "below",
						size = 0.5,
					}
				},
			},
			config = function(_, opts)
				require('dap-view').setup(opts)
			end
		},

	},

	keys = {
		{ "<leader>dt", "<cmd>DapViewToggle<cr>",       desc = "Toggle DAP view" },
		{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toogle Breakpoint" },
		{ "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue Session" },
		{ "<leader>dw", "<cmd>DapViewWatch<cr>",        desc = "Add property to watch" },
	},

	config = function()
		local dap = require('dap')

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				runInTerminal = false,
			},
		}

		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end
}
