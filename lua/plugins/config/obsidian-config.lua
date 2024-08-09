local obsidian_config = {
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		-- vim.fn.jobstart({ "open", url }) -- Mac OS
		vim.fn.jobstart({ "xdg-open", url }) -- linux
		-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
		-- vim.ui.open(url) -- need Neovim 0.10.0+
	end,
	workspaces = {
		{
			name = "Obsidian",
			path = "~/Obsidian/",
		},
	},
	templates = {
		subdir = "templates",
		date_format = "%Y-%m-%d-%a",
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

	new_notes_location = "~/Obsidian/",
	picker = {
		name = "telescope.nvim",
		mappings = {
			new = "<C-n>",
			insert_link = "<C-l>",
		},
	},
}

return obsidian_config
