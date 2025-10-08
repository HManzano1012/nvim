local vim = vim
local obsidian_config = {

	attachments = {
		img_folder = "assets/images/", -- This is the default

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		---@return string
		img_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,
	},
	ui = {
		enable = false,
	},
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		-- vim.fn.jobstart({ "open", url }) -- Mac OS
		vim.fn.jobstart({ "xdg-open", url }) -- linux
	end,
	workspaces = {
		{
			name = "Obsidian",
			path = "~/NotesPersonal/",
		},
	},
	templates = {
		subdir = "~/NotesPersonal/Templates/",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},
	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 2 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,

	new_notes_location = "~/NotesPersonal/",
	picker = {
		name = "telescope.nvim",
		mappings = {
			new = "<C-n>",
			insert_link = "<C-l>",
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		preferred_link_style = "markdown",
	},
}

return obsidian_config
