local vim = vim
-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = { { import = "plugins" } },
	ui = {
		border = "single",
		size = {
			width = 0.8,
			height = 0.8,
		},
		title = "Lazy",
		icons = {
			config = "󰒓 ",
			debug = "● ",
			event = " ",
			favorite = "  ",
			init = "󰒓 ",
			import = " 󰋺  ",
			keys = " 󰥻  ",
			lazy = "󰒲  ",
			runtime = "  ",
			require = "󰢱  ",
			source = " ",
			start = " ",
			list = { "■", "□", "●", "○", "◆", "◊" },
		},
	},
})
