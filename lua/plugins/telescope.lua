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
					file_ignore_patterns = {
						"node_modules/*",
						"build",
						"dist",
						"yarn.lock",
						".mypy_cache/*",
						"env/*",
						"vendor/*",
						"*/__pycache__",
					},
					prompt_prefix = "󰼛 ",
					selection_caret = "󱞩 ",
				},
			})

			local telescope = require("telescope")
			telescope.load_extension("fzf")
		end,
	},
}

return telescope
