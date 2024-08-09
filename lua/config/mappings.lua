local vim = vim
-- set ; to enter on command mode like :
vim.keymap.set("n", ";", ":", { noremap = true })

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>:Oil<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { silent = true })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { silent = true })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { silent = true })
vim.keymap.set("n", "<leader>fo", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { silent = true })

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

-- TODO Comments
vim.keymap.set("n", "<leader>cc", "<cmd>:TodoTelescope<cr>", { silent = true })

-- Center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

-- Buffers
vim.keymap.set("n", "<C-q>", "<cmd>:bdelete<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { silent = true })

-- tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>")
vim.keymap.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>")

-- Split buffers
vim.keymap.set("n", "<leader>-", "<cmd>:split<CR>", { silent = true })
vim.keymap.set("n", "<leader>|", "<cmd>:vsplit<CR>", { silent = true })

vim.keymap.set("n", "<S-Tab>", function()
	vim.api.nvim_command("bprevious")
end, { silent = true })
vim.keymap.set("n", "<Tab>", function()
	vim.api.nvim_command("bnext")
end, { silent = true })

-- move selected line / block of text in visual mode (V) up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- LSP
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
-- vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })

-- LazyGit
vim.keymap.set("n", "<leader>gl", "<cmd>:LazyGit<CR>", { silent = true })

-- Obsidian
vim.keymap.set("n", "<leader>nn", "<cmd>:ObsidianNew<CR>", { silent = true })
vim.keymap.set("n", "<leader>ns", "<cmd>:ObsidianQuickSwitch<CR>", { silent = true })
vim.keymap.set("n", "<leader>nb", "<cmd>:ObsidianBacklinks<CR>", { silent = true })

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { silent = true })
vim.keymap.set("n", "<leader>dpr", "<cmd>:lua require('dap-python').test_method() <CR>", { silent = true })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>:Trouble diagnostics toggle win.position=right<CR>", { silent = true })
vim.keymap.set("n", "<leader>tl", "<cmd>:Trouble loclist toggle win.position=right<CR>", { silent = true })
vim.keymap.set("n", "<leader>td", "<cmd>:Trouble todo toggle win.position=right<CR>", { silent = true })
