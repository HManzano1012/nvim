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

-- Transparent lualine
local custom_gruvbox = require("lualine.themes.gruvbox")
custom_gruvbox.normal.c.bg = "NONE"

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
		theme = custom_gruvbox,
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
		-- return "󰯙  "
		return " "
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
	color = { fg = "#cdd6f5", bg = "NONE" },
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

	color = { bg = "none" },
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

	color = { fg = "#ffffff", bg = "NONE" },
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
	icon = " [lsp]:",
	color = { fg = "#cdd6f5", bg = "NONE" },
})

ins_right({
	function()
		local linters = require("lint").linters_by_ft[vim.bo.filetype] or {}
		if #linters == 0 then
			return ""
		end
		return "󰨮 " .. table.concat(linters, ", ")
	end,

	color = { fg = "#cdd6f5", bg = "NONE" },
})

ins_right({
	function()
		local ok, conform = pcall(require, "conform")
		local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], " ")
		local buf_client_names = {}
		if ok then
			for formatter in formatters:gmatch("%w+") do
				if formatter then
					table.insert(buf_client_names, formatter)
				end
			end
		end

		return "󰦕 " .. table.concat(buf_client_names, ", ")
	end,

	color = { fg = "#cdd6f5", bg = "NONE" },
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
	color = { fg = "#ffffff", bg = "NONE" },
})

ins_right({
	"fancy_filetype",
	ts_icon = "",
	color = { fg = colors.mint, bg = "none" },
})

return config
