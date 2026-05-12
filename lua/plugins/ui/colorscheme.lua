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
			rainbow_headings = true,
		})

		vim.cmd("colorscheme bluloco")

		-- Transparent background
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#9ccfd8" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#9ccfd8" }) -- fg задает цвет линии
	end,
}
