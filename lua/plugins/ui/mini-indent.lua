return {
	'echasnovski/mini.indentscope',
	version = '*',
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Lazy', 'mason' },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
