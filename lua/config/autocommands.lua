local vim = vim

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.cmd.colorscheme("catppuccin-macchiato")

-- change background color for floating windows
local modes = { "normal", "insert", "visual", "replace", "terminal", "command" }
for _, mode in ipairs(modes) do
	vim.api.nvim_command("hi lualine_c_" .. mode .. "  guibg=NONE")
	vim.api.nvim_command("hi lualine_x_" .. mode .. "  guibg=NONE")
end

-- signcolumn icons
vim.cmd("sign define DiagnosticSignError text=  texthl=TextError linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text=󰀨  texthl=TextInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text=  texthl=TextHint linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text= texthl=TextWarn linehl= numhl=")

vim.cmd("hi! @markup.heading.1.markdown guifg=#8bd5cb")
vim.cmd("hi! @markup.heading.2.markdown guifg=#88aaf1 ")
vim.cmd("hi! @markup.heading.3.markdown guifg=#f5a980 ")
vim.cmd("hi! @markup.heading.4.markdown guifg=#eed4a0 ")
vim.cmd("hi! @markup.heading.5.markdown guifg=#edb6df ")
vim.cmd("hi! @markup.heading.6.markdown guifg=#c6a0f7 ")
--
vim.cmd("hi! fg_yellow guifg=#eed4a0 ")
vim.cmd("hi! fg_red guifg=#ed8797 ")
vim.cmd("hi! fg_green guifg=#a6da95")
vim.cmd("hi! fg_lavender guifg=#A7ADE3")
--
vim.cmd("hi! @markup.bold guifg=#ed8797")
vim.cmd("hi! @markup.italic guifg=#88aaf1")

-- background opacity
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNCFloat guibg=NONE ctermbg=NONE")

-- enable treesitter
vim.cmd("TSEnable highlight")

-- hide virtual text from diagnostics
vim.diagnostic.config({ virtual_text = false })

vim.cmd("intro")

local separator = "   "

local function get_num_wraps()
	-- Calculate the actual buffer width, accounting for splits, number columns, and other padding
	local wrapped_lines = vim.api.nvim_win_call(0, function()
		local winid = vim.api.nvim_get_current_win()

		-- get the width of the buffer
		local winwidth = vim.api.nvim_win_get_width(winid)
		local numberwidth = vim.wo.number and vim.wo.numberwidth or 0
		local signwidth = vim.fn.exists("*sign_define") == 1 and vim.fn.sign_getdefined() and 2 or 0
		local foldwidth = vim.wo.foldcolumn or 0

		-- subtract the number of empty spaces in your statuscol. I have
		-- four extra spaces in mine, to enhance readability for me
		local bufferwidth = winwidth - numberwidth - signwidth - foldwidth - 4

		-- fetch the line and calculate its display width
		local line = vim.fn.getline(vim.v.lnum)
		local line_length = vim.fn.strdisplaywidth(line)

		return math.floor(line_length / bufferwidth)
	end)

	return wrapped_lines
end

function CheckSymbolOrNumber(current)
	if vim.v.virtnum < 0 then
		return "-"
	end

	if vim.v.virtnum > 0 and (vim.wo.number or vim.wo.relativenumber) then
		local num_wraps = get_num_wraps()
		if vim.v.virtnum == num_wraps then
			return "└"
		else
			return "│"
		end
	end

	return current
end

vim.opt.statuscolumn = '%s%=%#CursorLineNr#%{(v:relnum == 0)?v:lua.CheckSymbolOrNumber(v:lnum)."'
	.. separator
	.. '":""}'
	.. '%#LineNr#%{(v:relnum != 0)?v:lua.CheckSymbolOrNumber(v:relnum)."'
	.. separator
	.. '":""}'
