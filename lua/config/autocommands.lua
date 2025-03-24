local vim = vim

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- signcolumn icons
vim.cmd("sign define DiagnosticSignError text=  texthl=TextError linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text=󰀨  texthl=TextInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text=  texthl=TextHint linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text= texthl=TextWarn linehl= numhl=")
--
vim.cmd("hi! fg_yellow guifg=#eed4a0 ")
vim.cmd("hi! fg_red guifg=#ed8797 ")
vim.cmd("hi! fg_green guifg=#a6da95")
vim.cmd("hi! fg_lavender guifg=#A7ADE3")

-- enable treesitter
vim.cmd("TSEnable highlight")

-- hide virtual text from diagnostics
vim.diagnostic.config({ virtual_text = false })

-- vim.cmd("intro")

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

-- vim.filetype.add({
-- 	pattern = {
-- 		[".*%.blade%.php"] = "blade",
-- 	},
-- })
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup,
	pattern = "*.blade.php",
	callback = function()
		vim.bo.filetype = "php"
	end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*.blade.php",
	callback = function(args)
		vim.schedule(function()
			-- Check if the attached client is 'intelephense'
			for _, client in ipairs(vim.lsp.get_active_clients()) do
				if client.name == "intelephense" and client.attached_buffers[args.buf] then
					vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
					-- update treesitter parser to blade
					vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
					break
				end
			end
		end)
	end,
})
-- make $ part of the keyword for php.
vim.api.nvim_exec(
	[[
autocmd FileType php set iskeyword+=$
]],
	false
)

local env_augroup = vim.api.nvim_create_augroup("envfiles", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = env_augroup,
	pattern = ".env.*",
	callback = function()
		vim.bo.filetype = "sh"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = env_augroup,
	pattern = "conf",
	callback = function()
		vim.bo.filetype = "sh"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = env_augroup,
	pattern = "*.conf",
	callback = function()
		vim.bo.filetype = "sh"
	end,
})

vim.api.nvim_create_augroup("PHPCSGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = "PHPCSGroup",
	pattern = "*.php",
	command = "lua require'phpcs'.cs()",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "PHPCSGroup",
	pattern = "*.php",
	command = "lua require'phpcs'.cbf()",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "PHPCSGroup",
	pattern = "*.php",
	callback = function()
		require("phpcs").cs()
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "PHPCSGroup",
	pattern = "*.php",
	callback = function()
		require("phpcs").cbf()
	end,
})

vim.keymap.set("n", "<leader>lp", function()
	require("phpcs").cs()
end, {
	silent = true,
	noremap = true,
	desc = "PHP Fix",
})

-- change background color for floating windows
local modes = { "normal", "insert", "visual", "replace", "terminal", "command" }
for _, mode in ipairs(modes) do
	vim.api.nvim_command("hi lualine_c_" .. mode .. "  guibg=NONE")
	vim.api.nvim_command("hi lualine_x_" .. mode .. "  guibg=NONE")
end

-- background opacity
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd.colorscheme("catppuccin-macchiato")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNCFloat guibg=NONE ctermbg=NONE")

vim.cmd("hi EcologNormal guibg=NONE ctermbg=NONE")

-- if vim.g.neovide then
-- 	vim.cmd.colorscheme("catppuccin-macchiato")
-- 	vim.o.guifont = "VictorMono Nerd Font:h13" -- text below applies for VimScript
-- end
