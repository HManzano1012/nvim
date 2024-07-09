local vim = vim
local colors = {
	bg = "#181825",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
	mint = "#6bbfbd",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 2
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			statusline = {
				"alpha",
				"NvimTree",
				"oil",
				"TelescopePrompt",
				"mason",
				"lazy",
				"lazygit",
			},
			winbar = {
				"alpha",
				"NvimTree",
				"oil",
				"TelescopePrompt",
				"mason",
				"lazy",
				"lazygit",
			},
		},
		theme = "catppuccin",
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		-- return "▊"
		return " "
	end,
	color = function()
		-- auto change color according to neovim's mode
		local mode_color = {
			n = colors.green,
			i = colors.red,
			v = colors.blue,
			["␖"] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			["␓"] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { bg = "none", fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({

	-- mode component
	function()
		return "󰯙  "
	end,
	color = function()
		-- auto change color according to neovim's mode
		local mode_color = {
			n = colors.green,
			i = colors.red,
			v = colors.blue,
			["␖"] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			["␓"] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()], bg = "none" }
	end,
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_left({
	"fancy_branch",
	color = { bg = "none", gui = "bold" },
})

ins_left({
	"filename",
	path = 1,
	cond = conditions.buffer_not_empty,
	color = { fg = colors.mint, bg = "none", gui = "bold" },
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},

	color = { bg = "none", gui = "bold" },
})

ins_left({
	function()
		return "%="
	end,
})

ins_right({
	"copilot",
	-- Default values
	symbols = {
		status = {
			icons = {
				enabled = " ",
				sleep = " ", -- auto-trigger disabled
				disabled = " ",
				warning = " ",
				unknown = " ",
			},
			hl = {
				enabled = "#50FA7B",
				sleep = "#AEB7D0",
				disabled = "#6272A4",
				warning = "#FFB86C",
				unknown = "#FF5555",
			},
		},
		spinners = require("copilot-lualine.spinners").dots,
		spinner_color = "#6272A4",
	},
	show_colors = false,
	show_loading = true,

	color = { fg = "#ffffff", bg = "NONE", gui = "bold" },
})

ins_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = "#ffffff", bg = "NONE", gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
	color = { fg = "#ffffff", bg = "NONE", gui = "bold" },
})

ins_right({
	"fancy_filetype",
	ts_icon = "",
	color = { fg = colors.mint, bg = "none", gui = "bold" },
})
ins_right({
	"tabs",
	tab_max_length = 40, -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
	max_length = vim.o.columns / 3, -- Maximum width of tabs component.
	mode = 1,
	cond = function()
		return #vim.fn.gettabinfo() > 1
	end,
})

ins_right({
	function()
		local linters = require("lint").get_running()
		if #linters == 0 then
			return "󰦕 " .. table.concat(linters, ", ")
		end
		return "󱉶  " .. table.concat(linters, ", ")
	end,
})

return config
