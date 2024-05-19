local barbar = {
	{
		"romgrk/barbar.nvim",
		config = function()
			require("barbar").setup({
				show_tab_indicators = true,
				show_close_icon = false,
				show_buffer_close_icons = false,
				tab_size = 10,
				buffer_sort_by = "directory",
			})
		end,
	},
}

return {}
