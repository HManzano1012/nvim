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
		dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim", "AndreM222/copilot-lualine" },
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
		opts = {},
	},
	{
		"goolord/alpha-nvim",
		enabled = true,
		lazy = false,
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local art = [[
          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⣾⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿⣷⡀⠀⠀⠀⠀⠀⠀
				 ⢸⣿⣿⣿⡇⣿⣿⣿⣿⣿⢱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠘⣿⣿⣷⢻⣿⣿⣿⡙⣷⡀⠀⠀⠀⠀⠀
				 ⣼⣿⣿⣿⡇⣿⣿⣿⣿⡇⣿⣿⣿⣿⡿⣿⣿⡿⣹⣿⣿⣿⠇⠀⠘⣿⣿⡆⣿⣿⣿⣧⠘⢷⠀⠀⠀⠀⠀
				 ⢹⣿⣿⣿⡇⢿⣿⣿⣿⢰⣿⣿⣿⠟⢲⣿⣟⠁⣿⣿⣿⡟⢀⡠⠔⠘⣿⣧⢸⣿⣿⣿⡄⠈⣇⠀⠀⠀⠀
				 ⢸⣿⣿⣿⣷⢸⣿⣿⣿⢸⣿⣟⣁⣠⣿⣋⡈⢻⣿⣿⡟⠘⣁⣴⣒⣒⣺⣿⢸⣿⣿⣿⡇⠀⠈⠀⠀⠀⠀
				 ⠈⣿⣿⣿⣿⡆⢿⡟⣿⢸⡟⣙⣿⣿⣿⡇⢁⣿⣿⠟⠀⠀⢩⣭⣿⣿⡟⣿⢸⣿⣿⢿⡇⠀⠀⠀⠀⠀⠀
				 ⠀⠸⣿⣿⣿⣿⡜⣿⡸⣾⡇⠻⠿⠿⠟⠀⣼⡿⠋⠀⠀⠀⠀⠙⠛⠟⠃⢸⣿⣿⣿⢸⡇⠀⠀⠀⠀⠀⠀
				 ⠀⠀⢹⡿⣿⣿⣿⣞⢷⣽⡁⠀⠀⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣸⣿⡏⠀⡇⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠱⠙⢿⡿⣿⣿⣷⣑⠀⠀⠀⠈⠀⠀⣀⣀⣤⠄⠀⠀⠀⠀⠀⣀⣤⢟⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠈⠻⢌⠛⢿⣝⠿⢿⣶⣿⣿⣿⣟⣛⣛⡛⠛⢶⣶⠟⢋⣿⠏⠸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠿⠿⣿⠿⣿⣿⣿⣿⢻⠱⣄⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠀⠀⣴⣿⡏⠀⢀⡎⠁⢠⠏⠘⠲⣍⠁⣧⠉⣇⢧⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠀⣼⣿⣿⠃⠀⡼⠀⢠⣎⣀⣀⣀⣹⠀⢸⡀⠸⣌⠆⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠸⠛⠉⠀⠀⢠⣯⢷⣏⣼⣍⣽⣛⣦⣀⣸⠧⣄⣾⣴⠾⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡰⣶⣏⣵⣤⠿⣿⣷⣶⣿⠿⡿⠷⣾⣽⣿⣿⠦⠯⢐⡤⢄⠀⠀⠀⠀⠀⠀⠀⠀
				 ⠀⠀⠀⠀⠀⢀⠠⢲⠝⠊⠉⡟⢋⣞⡧⠿⠵⡶⣶⠙⡭⠭⠭⢭⡿⢿⡀⠀⠀⠉⠒⠯⡐⡤⢀⠀⠀⠀⠀
				 ⠀⠀⡀⠴⢊⠝⠊⠀⠀⠀⢰⠁⠉⢡⡿⠶⣶⣴⠃⠀⢷⣦⡤⣼⡆⠀⠱⡀⠀⠀⠀⠀⠀⠁⠂⢬⡐⠠⡀
				 ⠀⣰⠅⠊⠀⠀⠀⠀⠀⠀⠈⠦⠔⠁⣸⣓⣿⠏⠀⠀⠸⣿⣷⣾⠘⢄⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠳
				 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠉⠉⠁⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]]

			art = string.rep("\n", 8) .. art .. "\n"
			dashboard.section.header.val = vim.split(art, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
				dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
				dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}
			alpha.setup(dashboard.opts)
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"muniftanjim/nui.nvim",
		},
		config = function()
			local config = require("plugins.config.noice-config")
			require("noice").setup(config)
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			local config = require("plugins.config.inline-diagnostics-config")
			require("tiny-inline-diagnostic").setup(config)
		end,
	},
}

return ui
