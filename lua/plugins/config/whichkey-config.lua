local whichkey = {
	win = {
		no_overlap = true,
		border = "single",
	},
	spec = {
		{ "<leader>a", group = "AI" }, -- Define a group for AI-related commands
		{ "<leader>l", group = "Laravel" }, -- Define a group for AI-related commands
		{ "<leader>f", group = "Telescope" }, -- Define a group for AI-related commands
		{ "<leader>g", group = "Git" }, -- Define a group for AI-related commands
		{ "<leader>gc", group = "Git Conflicts" }, -- Define a group for AI-related commands
		{ "<leader>n", group = "Notes" }, -- Define a group for AI-related commands
		{ "<leader>p", group = "PHP" }, -- Define a group for AI-related commands
		{ "<leader>d", group = "DADBOD" }, -- Define a group for AI-related commands
		{ "<leader>v", group = "Ecolog" }, -- Define a group for AI-related commands
	},
}

return whichkey
