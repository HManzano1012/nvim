local mason = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
				},
			})
		end,
	},
}

return mason
