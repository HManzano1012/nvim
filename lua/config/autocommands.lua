local vim = vim

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.cmd.colorscheme("catppuccin-mocha")

-- change background color for floating windows
local modes = { "normal", "insert", "visual", "replace", "terminal", "command" }
for _, mode in ipairs(modes) do
	vim.api.nvim_command("hi lualine_c_" .. mode .. "  guibg=NONE")
	vim.api.nvim_command("hi lualine_x_" .. mode .. "  guibg=NONE")
end

-- signcolumn icons
vim.cmd("sign define DiagnosticSignError text= texthl=TextError linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text= texthl=TextInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text= texthl=TextHint linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text= texthl=TextWarn linehl= numhl=")

-- background opacity
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNCFloat guibg=NONE ctermbg=NONE")

-- enable treesitter
vim.cmd("TSEnable highlight")

local function clear_cmdarea()
	vim.defer_fn(function()
		vim.api.nvim_echo({}, false, {})
	end, 800)
end
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(buf, "filetype")
		if ft == "sql" then
			vim.cmd("silent w")

			local time = os.date("%I:%M %p")

			-- print nice colored msg
			vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})
			clear_cmdarea()
		end
	end,
})

