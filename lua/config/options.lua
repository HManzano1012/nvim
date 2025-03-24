local vim = vim
local opt = vim.opt
opt.statuscolumn = [[%1*%s %{v:relnum?v:relnum:v:lnum} %= ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
opt.conceallevel = 1
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.timeoutlen = 1000

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 0
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

vim.o.timeout = true
vim.o.timeoutlen = 1000
vim.o.cmdheight = 1

vim.o.conceallevel = 1
opt.cmdheight = 0

vim.diagnostic.config({ virtual_lines = true })
-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true
opt.colorcolumn = "79"
opt.scrolloff = 8
-- disable nvim intro
opt.shortmess:append("s")
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.list = true
opt.listchars = "tab:  ,trail:-"
opt.pumheight = 10

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

opt.guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
opt.spell = true
opt.spelllang = { "en_us", "es" }
