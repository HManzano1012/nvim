local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 1000

-- set ; to enter on command mode like :
vim.keymap.set("n", ";", ":", { noremap = true })

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>:Oil --float<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { silent = true })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { silent = true })
--vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing bufferss" })
vim.keymap.set("n", "<leader>fo", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { silent = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { silent = true })

-- Comments
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { silent = true })
vim.keymap.set(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ silent = true }
)

-- Center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>hh", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>hs", function()
	harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>hd", function()
	harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>hf", function()
	harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader>hg", function()
	harpoon:list():select(5)
end)

-- barbar
vim.keymap.set("n", "<S-Tab>", "<cmd>:bprevious<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<cmd>:bnext<CR>", { silent = true })

-- Buffers
vim.keymap.set("n", "<leader>x", "<cmd>:bdelete<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { silent = true })

-- tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>")
vim.keymap.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>")

-- vim.keymap.set("n", '<leader>"', "<cmd>:split<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>%", "<cmd>:vsplit<CR>", { silent = true })
-- vim.keymap.set("n", "<S-h>", "<cmd>:wincmd h<CR>", { silent = true })
-- vim.keymap.set("n", "<S-j>", "<cmd>:wincmd j<CR>", { silent = true })
-- vim.keymap.set("n", "<S-k>", "<cmd>:wincmd k<CR>", { silent = true })
-- vim.keymap.set("n", "<S-l>", "<cmd>:wincmd l<CR>", { silent = true })

-- move selected line / block of text in visual mode d
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- LSP
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })

-- LazyGit
vim.keymap.set("n", "<leader>gl", "<cmd>:LazyGit<CR>", { silent = true })

-- Fugi2
vim.keymap.set("n", "<leader>gf", "<cmd>:Fugit2<CR>", { silent = true })

-- global note
vim.keymap.set("n", "<leader>nn", "<cmd>:GlobalNote<cr>", { silent = true })

-- Obsidian
vim.keymap.set("n", "<leader>no", "<cmd>:ObsidianNew<CR>", { silent = true })
vim.keymap.set("n", "<leader>ns", "<cmd>:ObsidianQuickSwitch<CR>", { silent = true })
vim.keymap.set("n", "<leader>nb", "<cmd>:ObsidianBacklinks<CR>", { silent = true })
