local vim = vim

-- set ; to enter on command mode like :
vim.keymap.set("n", ";", ":", { noremap = true })

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>:Oil<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { silent = true })
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ previewer = false })
end, { silent = true })
vim.keymap.set("n", "<leader>fw", function()
	builtin.live_grep(require("telescope.themes").get_ivy({}))
end, { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
	builtin.buffers({ previewer = false })
end, { silent = true })
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
vim.keymap.set("n", '<leader>"', "<cmd>:split<CR>", { silent = true })
vim.keymap.set("n", "<leader>%", "<cmd>:vsplit<CR>", { silent = true })

-- Use tab to indent a line / block of text in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- and to move to the next buffer in normal mode
vim.keymap.set("n", "<S-Tab>", function()
	vim.api.nvim_command("bprevious")
end, { silent = true })
vim.keymap.set("n", "<Tab>", function()
	vim.api.nvim_command("bnext")
end, { silent = true })

-- move selected line / block of text in visual mode (V) up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- move cursor to the beginning/end of line  on visual mode (V) or normal mode
-- vim.keymap.set("n", "H", "^", { silent = true })
-- vim.keymap.set("n", "L", "$", { silent = true })
-- vim.keymap.set("v", "H", "^", { silent = true })
-- vim.keymap.set("v", "L", "$", { silent = true })

-- LSP

vim.keymap.set({ "v", "n" }, "ca", require("actions-preview").code_actions)
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
vim.keymap.set("n", "<leader>nf", function()
	builtin.find_files(require("telescope.themes").get_ivy({
		cwd = "~/Obsidian",
		search_file = "*.md",
	}))
end, { silent = true })
vim.keymap.set("n", "<leader>ns", "<cmd>:ObsidianQuickSwitch<CR>", { silent = true })
vim.keymap.set("n", "<leader>nb", "<cmd>:ObsidianBacklinks<CR>", { silent = true })
vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { silent = true })
vim.keymap.set("n", "<leader>dpr", "<cmd>:lua require('dap-python').test_method() <CR>", { silent = true })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>:Trouble diagnostics toggle win.position=right<CR>", { silent = true })
vim.keymap.set("n", "<leader>tl", "<cmd>:Trouble loclist toggle win.position=right<CR>", { silent = true })
vim.keymap.set("n", "<leader>td", "<cmd>:Trouble todo toggle win.position=right<CR>", { silent = true })
-- Remove hightlight from last search
vim.keymap.set("n", "<leader>n", "<cmd>:noh<CR>", { silent = true })

-- Quickfix
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }
		vim.keymap.set("n", "j", "<cmd>cn<CR>zz<cmd>wincmd p<CR>", opts)
		vim.keymap.set("n", "k", "<cmd>cN<CR>zz<cmd>wincmd p<CR>", opts)
	end,
})
-- Precognition
vim.keymap.set("n", "<leader>pt", "<cmd>:Precognition toggle<cr>")
