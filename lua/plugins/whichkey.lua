local whichkey = {
	{
		"folke/which-key.nvim",
		enabled = true,
		config = function()
			require("which-key").setup({
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
			})
		end,
	},
}

return {}
