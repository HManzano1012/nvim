-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd("hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK")
vim.cmd("set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC")

-- conceallevel = 2
vim.cmd("set conceallevel=2")

-- signcolumn icons colors
vim.cmd("hi TextError  guifg='#f28ba8'")
vim.cmd("hi TextWarning  guifg='#f9e2af'")
vim.cmd("hi TextInfo  guifg='#89dceb'")
vim.cmd("hi TextHint  guifg='#89cfc5'")

-- signcolumn icons
vim.cmd("sign define DiagnosticSignError text= texthl=TextError linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text= texthl=TextWarning linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text= texthl=TextInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text= texthl=TextHint linehl= numhl=")

-- background opacity
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNCFloat guibg=NONE ctermbg=NONE")

-- enable treesitter
vim.cmd("TSEnable highlight")
