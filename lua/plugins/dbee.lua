return {
	{
		"kndndrj/nvim-dbee",
		cmd = "Dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({})
		end,
	},
	{
		"MattiasMTS/cmp-dbee",
		cmd = "Dbee",
		commit = "0feabc1", --completion works using this commit
		dependencies = {
			{ "kndndrj/nvim-dbee" },
		},
		config = function()
			require("cmp-dbee").setup()
		end,
	},
}
