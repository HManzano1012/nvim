local vim = vim
-- fuzzy finder (files, lsp, etc)
local telescope = {
	{
		"nvim-telescope/telescope.nvim",
		event = "vimenter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local config = require("plugins.config.telescope-config")
			local telescope = require("telescope")
			telescope.setup({ config })
			telescope.load_extension("fzf")
		end,
	},
}

return telescope
