local theme = {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					harpoon = true,
					illuminate = true,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = { enabled = true },
					notify = true,
					nvimtree = true,
					neotree = true,
					symbols_outline = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
			require("mason").setup({
				ui = {
					border = "single",
				},
			})
		end,
	},
	{
		"maxmx03/dracula.nvim",
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"rose-pine/neovim",
		as = "rose-pine",
	},
	{
		"cpea2506/one_monokai.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},
}

return theme
