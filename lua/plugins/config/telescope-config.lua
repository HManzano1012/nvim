require("telescope").setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		file_ignore_patterns = {
			-- "*.png",
			-- "*.jpg",
			-- "*.svg",
			"node_modules/*",
			"build",
			"dist",
			"yarn.lock",
			".mypy_cache/*",
			"env/*",
			"vendor/*",
			"*/__pycache__/*",
			"__pycache__",
		},
		prompt_prefix = "󰼛 ",
		selection_caret = "󱞩 ",
		layout_config = {
			vertical = { width = 0.5 },
			width = function(_, cols, _)
				local min = 90
				local max = 125
				return math.min(math.max(min, cols), max)
			end,
			height = function(_, _, max_lines)
				local percentage = 0.5
				local min = 20
				return math.max(math.floor(percentage * max_lines), min)
			end,
			preview_cutoff = 120,
		},
	},
})
