local noice_config = {
	cmdline = {
		enabled = true,
		view = "cmdline",
	},
	views = {
		mini = {
			win_options = {
				winblend = 0,
			},
		},
		cmdline_popup = {
			position = {
				row = 8,
				col = "50%",
			},
			border = {
				style = "single",
				padding = { 0, 0 },
			},
			win_options = {
				winhighlight = { normal = "telescopeborder", floatborder = "telescopeborder" },
			},

			size = {
				width = 70,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 11,
				col = "50%",
			},
			size = {
				width = 70,
				height = 10,
			},
			border = {
				style = "single",
				padding = { 0, 0 },
			},
			win_options = {
				winhighlight = { normal = "telescopeborder", floatborder = "telescopeborder" },
			},
		},
		hover = {
			size = {
				width = 50,
				height = "auto",
			},
			relative = "cursor",
			position = {
				row = 2,
				col = 0,
			},
			border = {
				style = "single",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { normal = "telescopeborder", floatborder = "telescopeborder" },
			},
		},
	},
}

return noice_config
