return {
	'stevearc/oil.nvim',

	dependencies = {
		{ 'echasnovski/mini.icons', opts = {} }
	},

	opts = {
		columns = {
			"icon",
		},
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["gt"] = "actions.preview"
		},
		float = {
			preview_split = "right",
			max_width = 0.8,
			max_height = 0.8,
			border = "rounded",
			win_options = {
				-- Это заставит окно использовать стандартные группы подсветки
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
			},
		}
	},

	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "-", function()
				require("oil").open_float(nil)
			end,
			{ desc = "Open parent directory" })
	end,
}
