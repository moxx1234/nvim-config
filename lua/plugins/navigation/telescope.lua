return {
	"nvim-telescope/telescope.nvim",
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = true,
				})
			end,
			desc = "Find Files (all)",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					additional_args = function(_)
						return {
							"--hidden",
							"--glob", "!.git/*",
							"--glob", "!node_modules/*",
							"--glob", "!__pycache__/*",
							"--glob", "!.venv/*",
							"--glob", "!venv/*",
							"--glob", "!env/*",
							"--glob", "!.next/*",
						}
					end,
				})
			end,
			desc = "Live Grep (all)",
		},
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",        desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>",      desc = "Help Tags" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "references" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				}
			},
			file_ignore_patterns = { "%.git/", "node_modules/", "__pycache__/", "%.venv/", "venv/", "env/", "%.next/" },
			preview = {
				treesitter = false
			}
		},
	}
}
