local oil_config = {
	use_default_keymaps = false,
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	float = {
		border = "single",
		winhighlight = "Normal:NormalFloat,FloatBorder:TelescopeBorder",
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
	win_options = {
		signcolumn = "yes:2",
	},
}
return oil_config
