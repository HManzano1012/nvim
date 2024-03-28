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
-- vim.cmd("highlight! BorderBG guibg=NONE guifg=#c7a3f2")
-- vim.cmd("highlight! CmpSel guibg=#c7a3f2 guifg=#000000")
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#cba6f6" })
--
-- -- Customization for Pmenu
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
--
-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
