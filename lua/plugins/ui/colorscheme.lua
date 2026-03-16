return {
	"uloco/bluloco.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
	config = function()
		-- your optional config goes here, see below.
		require("bluloco").setup({
			style = "dark",
			transparent = false,
			rainbow_headings = false,
		})

		vim.cmd("colorscheme bluloco")
	end,
}
