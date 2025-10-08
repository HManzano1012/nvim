local vim = vim
local ui = {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local config = require("plugins.config.oil-config")
			require("oil").setup(config)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local config = require("plugins.config.lualine-config")
			require("lualine").setup(config)
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = "BufRead",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			show_dirname = false,
			show_basename = true,
		},
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"muniftanjim/nui.nvim",
		},
		config = function()
			local config = require("plugins.config.noice-config")
			local noice = require("noice")
			noice.setup(config)
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "BufRead",
		config = function()
			-- Default configuration
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				transparent_bg = true,
				options = {
					show_all_diags_on_cursorline = false,
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/virt-column.nvim",
		event = "BufRead",
		opts = {
			char = { "│" },
			vircolumn = { vim.opt.colorcolumn },
			highlight = { "IblIndent" },
		},
	},
	{
		"mcauley-penney/techbase.nvim",
	},
}

return ui
