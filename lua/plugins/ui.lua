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
			"meuter/lualine-so-fancy.nvim",
			"AndreM222/copilot-lualine",
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
		opts = {},
	},
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	enabled = false,
	-- 	lazy = false,
	-- 	config = function()
	-- 		local alpha = require("alpha")
	-- 		local dashboard = require("alpha.themes.dashboard")
	-- 		local art = [[
	--          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⣾⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿⣷⡀⠀⠀⠀⠀⠀⠀
	-- 			 ⢸⣿⣿⣿⡇⣿⣿⣿⣿⣿⢱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠘⣿⣿⣷⢻⣿⣿⣿⡙⣷⡀⠀⠀⠀⠀⠀
	-- 			 ⣼⣿⣿⣿⡇⣿⣿⣿⣿⡇⣿⣿⣿⣿⡿⣿⣿⡿⣹⣿⣿⣿⠇⠀⠘⣿⣿⡆⣿⣿⣿⣧⠘⢷⠀⠀⠀⠀⠀
	-- 			 ⢹⣿⣿⣿⡇⢿⣿⣿⣿⢰⣿⣿⣿⠟⢲⣿⣟⠁⣿⣿⣿⡟⢀⡠⠔⠘⣿⣧⢸⣿⣿⣿⡄⠈⣇⠀⠀⠀⠀
	-- 			 ⢸⣿⣿⣿⣷⢸⣿⣿⣿⢸⣿⣟⣁⣠⣿⣋⡈⢻⣿⣿⡟⠘⣁⣴⣒⣒⣺⣿⢸⣿⣿⣿⡇⠀⠈⠀⠀⠀⠀
	-- 			 ⠈⣿⣿⣿⣿⡆⢿⡟⣿⢸⡟⣙⣿⣿⣿⡇⢁⣿⣿⠟⠀⠀⢩⣭⣿⣿⡟⣿⢸⣿⣿⢿⡇⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠸⣿⣿⣿⣿⡜⣿⡸⣾⡇⠻⠿⠿⠟⠀⣼⡿⠋⠀⠀⠀⠀⠙⠛⠟⠃⢸⣿⣿⣿⢸⡇⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⢹⡿⣿⣿⣿⣞⢷⣽⡁⠀⠀⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣸⣿⡏⠀⡇⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠱⠙⢿⡿⣿⣿⣷⣑⠀⠀⠀⠈⠀⠀⣀⣀⣤⠄⠀⠀⠀⠀⠀⣀⣤⢟⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠈⠻⢌⠛⢿⣝⠿⢿⣶⣿⣿⣿⣟⣛⣛⡛⠛⢶⣶⠟⢋⣿⠏⠸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠿⠿⣿⠿⣿⣿⣿⣿⢻⠱⣄⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠀⠀⣴⣿⡏⠀⢀⡎⠁⢠⠏⠘⠲⣍⠁⣧⠉⣇⢧⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠀⣼⣿⣿⠃⠀⡼⠀⢠⣎⣀⣀⣀⣹⠀⢸⡀⠸⣌⠆⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠸⠛⠉⠀⠀⢠⣯⢷⣏⣼⣍⣽⣛⣦⣀⣸⠧⣄⣾⣴⠾⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡰⣶⣏⣵⣤⠿⣿⣷⣶⣿⠿⡿⠷⣾⣽⣿⣿⠦⠯⢐⡤⢄⠀⠀⠀⠀⠀⠀⠀⠀
	-- 			 ⠀⠀⠀⠀⠀⢀⠠⢲⠝⠊⠉⡟⢋⣞⡧⠿⠵⡶⣶⠙⡭⠭⠭⢭⡿⢿⡀⠀⠀⠉⠒⠯⡐⡤⢀⠀⠀⠀⠀
	-- 			 ⠀⠀⡀⠴⢊⠝⠊⠀⠀⠀⢰⠁⠉⢡⡿⠶⣶⣴⠃⠀⢷⣦⡤⣼⡆⠀⠱⡀⠀⠀⠀⠀⠀⠁⠂⢬⡐⠠⡀
	-- 			 ⠀⣰⠅⠊⠀⠀⠀⠀⠀⠀⠈⠦⠔⠁⣸⣓⣿⠏⠀⠀⠸⣿⣷⣾⠘⢄⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠳
	-- 			 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠉⠉⠁⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	--         ]]
	--
	-- 		art = string.rep("\n", 8) .. art .. "\n"
	-- 		dashboard.section.header.val = vim.split(art, "\n")
	-- 		dashboard.section.buttons.val = {
	-- 			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
	-- 			dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
	-- 			dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
	-- 			dashboard.button("q", "  Quit", ":qa<CR>"),
	-- 		}
	-- 		alpha.setup(dashboard.opts)
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		version = "4.2.1",
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
			local config = require("plugins.config.inline-diagnostics-config")
			require("tiny-inline-diagnostic").setup(config)
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = "BufRead",
	-- 	main = "ibl",
	-- 	opts = {
	-- 		indent = { char = "▏" },
	-- 		-- indent = { char = "│" },
	-- 	},
	-- },
	-- {
	-- 	"echasnovski/mini.indentscope",
	-- 	version = false, -- wait till new 0.7.0 release to put it back on semver
	-- 	opts = {
	-- 		symbol = "▏",
	-- 		-- symbol = "│",
	-- 		options = { try_as_border = true },
	-- 	},
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = {
	-- 				"alpha",
	-- 				"dashboard",
	-- 				"fzf",
	-- 				"help",
	-- 				"lazy",
	-- 				"lazyterm",
	-- 				"mason",
	-- 				"neo-tree",
	-- 				"notify",
	-- 				"toggleterm",
	-- 				"Trouble",
	-- 				"trouble",
	-- 			},
	-- 			callback = function()
	-- 				vim.b.miniindentscope_disable = true
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			local palettes = require("catppuccino.palettes")
			local theme_colors = palettes.get_palette("macchiato")
			require("tiny-devicons-auto-colors").setup({
				colors = theme_colors,
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
		"OXY2DEV/helpview.nvim",
		lazy = false, -- Recommended
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}

return ui
