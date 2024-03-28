local oil = {
	{
		"stevearc/oil.nvim",
		enabled = true,
		lazy = false,
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				use_default_keymaps = false,
				float = {
					border = "single",
					winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:BorderBG",
					padding = 2,
				},
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-\\>"] = "actions.select_split",
					["<C-enter>"] = "actions.select_vsplit", -- this is used to navigate left
					["<C-t>"] = "actions.select_tab",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-r>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
}

return oil
