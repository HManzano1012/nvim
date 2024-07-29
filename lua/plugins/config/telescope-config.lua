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
			"*/__pycache__/*",
		},
		prompt_prefix = "󰼛 ",
		selection_caret = "󱞩 ",
	},
})
