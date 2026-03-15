return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			highlight = { enable = true },
			--install_dir = vim.fn.stdpath("data") .. "/site"
		})

		local languages = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"html",
			"css",
			"scss",
			"yaml",
			"jsx",
			"json",
			"jsdoc",
			"prisma",
			"markdown",
			"sql",
			"bash",
			"dockerfile",
			"python",
			"diff",
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = languages,
			callback = function()
				vim.treesitter.start()
			end,
		})

		ts.install(languages)
	end,
}
