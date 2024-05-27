local vim = vim
return {
	{
		"kndndrj/nvim-dbee",
		cmd = "Dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup()
		end,
	},
	{
		"MattiasMTS/cmp-dbee",
		commit = "0feabc1", --completion works using this commit
		dependencies = {
			{ "kndndrj/nvim-dbee" },
		},
		ft = "sql",
		config = function()
			require("cmp-dbee").setup({})
		end,
	},
	{
		"kndndrj/nvim-projector",
		cmd = "Projector",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"kndndrj/projector-dbee",
		},
		config = function()
			require("projector").setup({
				outputs = {
					-- require("projector.outputs").DadbodOutputBuilder:new(),
					require("projector_dbee").OutputBuilder:new(),
				},
			})
		end,
	},
	-- {
	-- 	"tpope/vim-dadbod",
	-- 	cmd = {
	-- 		"DBUIToggle",
	-- 		"DBUI",
	-- 	},
	-- 	lazy = true,
	-- },
	-- {
	-- 	"kristijanhusak/vim-dadbod-ui",
	-- 	dependencies = {
	-- 		{ "tpope/vim-dadbod", lazy = true },
	-- 		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	-- 	},
	-- 	cmd = {
	-- 		"DBUI",
	-- 		"DBUIToggle",
	-- 		"DBUIAddConnection",
	-- 		"DBUIFindBuffer",
	-- 	},
	-- 	init = function()
	-- 		-- Your DBUI configuration
	-- 		vim.g.db_ui_use_nerd_fonts = 1
	-- 		vim.g.db_ui_win_position = "left"
	-- 		vim.g.db_ui_winwidth = 40
	-- 		vim.cmd([[
	--        autocmd FileType dbout setlocal nofoldenable
	--      ]])
	-- 	end,
	-- },
	-- {
	-- 	"kristijanhusak/vim-dadbod-completion",
	-- 	ft = "sql",
	-- 	config = function()
	-- 		vim.g.vim_dadbod_completion_mark = " "
	-- 	end,
	-- },
}
