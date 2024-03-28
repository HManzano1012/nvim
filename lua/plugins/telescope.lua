local telescope = {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
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

			{ "nvim-tree/nvim-web-devicons", enabled = true },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
			})

			pcall(require("telescope").load_extension, "fzf")
		end,
	},
}

return telescope
