local vim = vim

---@param modes table Listeof modes (e.g., {'n', 'v'})
---@param key_combination string Key combination to map
---@param key_function string|function The command or function to execute
---@param description string Description of the mapping
---@param silent_key boolean Whether the mapping should be silent
local function create_keymap(modes, key_combination, key_function, description, silent_key)
	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, key_combination, key_function, { desc = description, silent = silent_key })
	end
end

--[[ General Mappings ]]
-- Set ; to enter command mode
create_keymap({ "n" }, ";", ":", "Enter command mode", true)
create_keymap({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlighting", true)

--[[ Search and Navigation ]]
-- Search and replace word under cursor
create_keymap(
	{ "n" },
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	"Search and replace word under cursor",
	false
)

-- [[ Movement Mappings ]]
create_keymap(
	{ "n" },
	"H",
	"_", -- Move to the beginning of the line in normal mode
	"Move to the beginning of the line (H)",
	true
)

create_keymap(
	{ "n" },
	"L",
	"$", -- Move to the end of the line in normal mode
	"Move to the end of the line (L)",
	true
)

--[[ File Management ]]
-- File explorer
create_keymap({ "n" }, "<leader>e", "<cmd>:Oil<CR>", "Open file explorer (Oil)", true)

--[[ Telescope ]]
create_keymap({ "n" }, "<leader>ff", function()
	require("telescope.builtin").find_files({ previewer = false })
end, "Find files", false)

create_keymap({ "n" }, "<leader>fs", function()
	require("telescope.builtin").spell_suggest({ previewer = false })
end, "Find files", false)

create_keymap({ "n" }, "<leader>fw", function()
	require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({}))
end, "Grep files", false)

create_keymap({ "n" }, "<leader>fo", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, "Live grep in open files", false)

--[[ Code Manipulation ]]
-- Comments
create_keymap({ "n" }, "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, "Toggle comment current line", true)

create_keymap(
	{ "v" },
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	"Toggle comment selected lines",
	true
)

--[[ Navigation ]]
-- Center screen after movements
create_keymap({ "n" }, "<C-d>", "<C-d>zz", "", true)
create_keymap({ "n" }, "<C-u>", "<C-u>zz", "", true)
create_keymap({ "n" }, "n", "nzz", "", true)
create_keymap({ "n" }, "N", "Nzz", "", true)

--[[ Buffer Management ]]
create_keymap({ "n" }, "<C-q>", "<cmd>:bdelete<CR>", "Delete current buffer", true)
create_keymap({ "n" }, "<C-s>", "<cmd>:w<CR>", "Save current buffer", true)

--[[ Window/Tmux Navigation ]]
create_keymap({ "n" }, "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", "", true)
create_keymap({ "n" }, "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", "", true)
create_keymap({ "n" }, "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", "", true)
create_keymap({ "n" }, "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", "", true)
create_keymap({ "n" }, "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>", "", true)
create_keymap({ "n" }, "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>", "", true)

--[[ Window Management ]]
-- Split management
create_keymap({ "n" }, '<leader>"', "<cmd>:split<CR>", "Split window horizontally", false)
create_keymap({ "n" }, "<leader>%", "<cmd>:vsplit<CR>", "Split window vertically", false)

--[[ Text Manipulation ]]
-- Indentation
create_keymap({ "v" }, "<Tab>", ">gv", "", false)
create_keymap({ "v" }, "<S-Tab>", "<gv", "", false)

-- and to move to the next buffer in normal mode
create_keymap({ "n" }, "<S-Tab>", "<cmd>:bprevious<cr>", "", false)
create_keymap({ "n" }, "<Tab>", "<cmd>:bnext<cr>", "", false)

-- move selected line / block of text in visual mode (V) up / down
create_keymap({ "v" }, "J", ":m '>+1<CR>gv=gv", "", true)
create_keymap({ "v" }, "K", ":m '<-2<CR>gv=gv", "", true)

--[[ LSP (Language Server Protocol) ]]
-- create_keymap({ "v", "n" }, "ca", require("actions-preview").code_actions, "Show code actions", false)
create_keymap({ "n" }, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "", false)
create_keymap({ "n" }, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "", false)
create_keymap({ "n" }, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "", false)
create_keymap({ "n" }, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "", false)
create_keymap({ "n" }, "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "", false)
create_keymap({ "n" }, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "", true)

--[[ Git Integration ]]
-- LazyGit
create_keymap({ "n" }, "<leader>gl", "<cmd>:LazyGit<CR>", "Open LazyGit", false)

-- Git Conflict Resolution
create_keymap({ "n" }, "<leader>gco", "<cmd>:GitConflictChooseOurs<CR>", "Choose current changes", false)
create_keymap({ "n" }, "<leader>gct", "<cmd>:GitConflictChooseTheirs<CR>", "Choose incoming changes", false)
create_keymap({ "n" }, "<leader>gcn", "<cmd>:GitConflictNextConflict<CR>", "Go to next conflict", false)
create_keymap({ "n" }, "<leader>gcp", "<cmd>:GitConflictPrevConflict<CR>", "Go to previous conflict", false)
create_keymap({ "n" }, "<leader>gcl", "<cmd>:GitConflictListQf<CR>", "Show conflicts on Quick List", false)

--[[ Note Taking (Obsidian) ]]
create_keymap({ "n" }, "<leader>nn", "<cmd>:ObsidianNew<CR>", "Create new note", false)
create_keymap({ "n" }, "<leader>nf", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
		cwd = "~/Obsidian",
		search_file = "*.md",
	}))
end, "Search on notes", false)
create_keymap({ "n" }, "<leader>ns", "<cmd>:ObsidianQuickSwitch<CR>", "Notes Quick switch", false)
create_keymap({ "n" }, "<leader>nb", "<cmd>:ObsidianBacklinks<CR>", "Follow backlink", false)
create_keymap({ "n" }, "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, "Go to file on notes", true)
create_keymap({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", "", true)

-- Precognition
create_keymap({ "n" }, "<leader>pt", "<cmd>:Precognition toggle<cr>", "Precognition toggle", false)

-- CodeSnap
create_keymap({ "x" }, "<leader>ci", "<cmd>'<,'>CodeSnap<cr>", "Code snap", false)

-- ECOLOG - Env files
create_keymap({ "n" }, "<leader>vg", "<cmd>EcologGoto<cr>", "Go to env file", false)
create_keymap({ "n" }, "<leader>vp", "<cmd>EcologPeek<cr>", "Ecolog peek variable", false)
create_keymap({ "n" }, "<leader>vs", "<cmd>EcologSelect<cr>", "Switch env file", false)

-- PHPCFB
create_keymap(
	{ "n" },
	"<leader>pf",
	"<cmd> !phpcbf --standard=PSR12 %<cr>",
	"Fix current file PHPCFB (standard PSR12)",
	false
)
create_keymap(
	{ "n" },
	"<leader>pc",
	"<cmd> !php-cs-fixer fix --using-cache=no --rules=@PSR12 %<cr>",
	"Format current file PHPCFB (standard PSR12)",
	false
)

--[[ PHP/Laravel Development ]]
-- Laravel commands
create_keymap({ "n" }, "<leader>la", ":Laravel artisan<cr>", "Open Laravel Artisan", false)
create_keymap({ "n" }, "<leader>lr", ":Laravel routes<cr>", "Show Laravel routes", false)
create_keymap({ "n" }, "<leader>lm", ":Laravel related<cr>", "Show related files", false)

--[[ Database Management ]]
create_keymap({ "n" }, "<leader>db", "<cmd> DBUIToggle<cr>", "DADBOD UI Toggle", false)

--[[ Code Folding ]]
create_keymap({ "n" }, "<Leader><Tab>", function()
	local get_opt = vim.api.nvim_win_get_option
	local set_opt = vim.api.nvim_win_set_option

	if get_opt(0, "foldlevel") >= 20 then
		set_opt(0, "foldlevel", 0)
	else
		set_opt(0, "foldlevel", 20)
	end
end, "Toggle all folds", true)

--[[ Quickfix Navigation ]]
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }
		vim.api.nvim_set_keymap("n", "j", "<cmd>cn<CR>zz<cmd>wincmd p<CR>", opts)
		vim.api.nvim_set_keymap("n", "k", "<cmd>cN<CR>zz<cmd>wincmd p<CR>", opts)
	end,
})

--[[ Code Formatting ]]
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format with conform.nvim" })
