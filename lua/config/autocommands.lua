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

-- set cmd height = 1
vim.cmd("set cmdheight=1")
vim.cmd("set cmdwinheight=5")

-- dbee
vim.api.nvim_create_autocmd("WinNew", {
	pattern = "dbee-call-log",
	callback = function()
		-- do whatever you want in here, e.g.
		vim.wo.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("WinNew", {
	pattern = "dbee-drawer",
	callback = function()
		-- do whatever you want in here, e.g.
		vim.wo.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("WinNew", {
	pattern = "dbee-result",
	callback = function()
		-- do whatever you want in here, e.g.
		vim.wo.relativenumber = true
	end,
})
