return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	opts = {
		terminal = {
			provider = "none"
		}
	},
	keys = {
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer (cb = Claude Buffer)" },
		{ mode = "v",   "<leader>cv",               "<cmd>ClaudeCodeSend<cr>",                       desc = "Add selection (cv = Claude Visual)" }
	}

}
