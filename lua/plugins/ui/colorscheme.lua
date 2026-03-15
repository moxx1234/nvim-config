return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm", -- или "moon" / "night"
			transparent = false, -- установи true, если хочешь прозрачный фон терминала
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
