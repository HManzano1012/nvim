local vim = vim
local colors = {
	bg = "#24273A",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#a6da95",
	orange = "#f5a97f",
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

-- Transparent lualine
local custom_gruvbox = require("lualine.themes.gruvbox")
custom_gruvbox.normal.c.bg = "NONE"

local custom_catpuccin = function()
	local flavour = "latte"
	local C = require("catppuccin.palettes").get_palette(flavour)
	local O = require("catppuccin").options
	local catppuccin = {}

	local transparent_bg = colors.bg

	catppuccin.normal = {
		a = { bg = C.blue, fg = C.mantle, gui = "bold" },
		b = { bg = transparent_bg, fg = C.blue },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.insert = {
		a = { bg = C.green, fg = C.base, gui = "bold" },
		b = { bg = transparent_bg, fg = C.green },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.terminal = {
		a = { bg = C.green, fg = C.base, gui = "bold" },
		b = { bg = transparent_bg, fg = C.green },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.command = {
		a = { bg = C.peach, fg = C.base, gui = "bold" },
		b = { bg = transparent_bg, fg = C.peach },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.visual = {
		a = { bg = C.mauve, fg = C.base, gui = "bold" },
		b = { bg = transparent_bg, fg = C.mauve },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.replace = {
		a = { bg = C.red, fg = C.base, gui = "bold" },
		b = { bg = transparent_bg, fg = C.red },
		c = { bg = transparent_bg, fg = C.text },
		x = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.inactive = {
		a = { bg = transparent_bg, fg = C.blue },
		b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
		c = { bg = transparent_bg, fg = C.overlay0 },
		x = { bg = transparent_bg, fg = C.text },
	}

	return catppuccin
end

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
		theme = custom_catpuccin(),
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
		return ""
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
		return { bg = "", fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({

	-- mode component
	function()
		local mode_label = {
			n = "NORMAL",
			i = "INSERT",
			v = "VISUAL",
			["␖"] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = "NORMAL",
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
		-- return "󰯙  "
		-- return "   "
		return "네오빔 "
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
		return { fg = mode_color[vim.fn.mode()], bg = "" }
	end,
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_left({
	"branch",
	icon = { "󰘬", color = { fg = colors["fg"] } },
	color = { fg = colors["fg"], bg = "NONE" },
})

ins_left({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = "󰐗 ", modified = "󰀚 ", removed = "󰍶 " },
	diff_color = {
		added = { fg = colors.fg },
		modified = { fg = colors.fg },
		removed = { fg = colors.fg },
	},
	cond = conditions.hide_in_width,
	color = { fg = "#ffffff", bg = "NONE" },
})

ins_left({
	function()
		return "%="
	end,
	color = { bg = "NONE" },
})

ins_left({
	function()
		return "%="
	end,

	color = { bg = "NONE" },
})

ins_right({
	function()
		return "%="
	end,

	color = { bg = "NONE" },
})

ins_right({
	function()
		return "%="
	end,

	color = { bg = "NONE" },
})

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.fg },
		color_warn = { fg = colors.fg },
		color_info = { fg = colors.fg },
	},
	color = { bg = "none", fg = colors.fg },
})

ins_right({
	function()
		local linters = require("lint").linters_by_ft[vim.bo.filetype] or {}
		if #linters == 0 then
			return ""
		end
		return "󰨮 " .. table.concat(linters, ", ")
	end,

	color = { fg = colors["fg"], bg = "NONE" },
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
	icon = " ",
	color = { fg = colors["fg"], bg = "NONE" },
})

ins_right({
	function()
		local ok, conform = pcall(require, "conform")
		local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], " ")
		local current_formatter = ""
		if ok then
			for formatter in formatters:gmatch("%w+") do
				if formatter then
					if current_formatter == "" then
						current_formatter = formatter
					end
					-- table.insert(buf_client_names, formatter)
				end
			end
		end

		return "󰅩 " .. current_formatter
	end,

	color = { fg = colors["fg"], bg = "NONE" },
})

ins_right({
	"filetype",
	ts_icon = "",
	color = { fg = colors.fg, bg = "" },
})

return config
