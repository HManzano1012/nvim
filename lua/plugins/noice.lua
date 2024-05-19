local noice = {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
				},
				views = {
					mini = {
						win_options = {
							winblend = 0,
						},
					},
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						border = {
							style = "single",
							padding = { 0, 1 },
						},

						size = {
							width = 70,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 70,
							height = 10,
						},
						border = {
							style = "single",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "TelescopeBorder", FloatBorder = "TelescopeBorder" },
						},
					},
				},
			})
		end,
	},
}

return noice
