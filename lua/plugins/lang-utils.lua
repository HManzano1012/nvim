local lang_utils = {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{ "<leader>lm", ":Laravel related<cr>" },
		},
		opts = {
			lsp_server = "intelephense",
		},
		config = true,
	},
	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = { -- totally optional
			"hrsh7th/nvim-cmp", -- if using nvim-cmp
		},
		ft = { "blade", "php" }, -- optional, improves startup time
		opts = {
			close_tag_on_complete = true, -- default: true
		},
	},
	{
		"jwalton512/vim-blade",
		ft = { "blade", "php" }, -- optional, improves startup time
	},
	{
		"praem90/nvim-phpcsf",
		ft = { "blade", "php" }, -- optional, improves startup time
		config = function()
			require("phpcs").setup({
				phpcs = "phpcs",
				phpcbf = "phpcbf",
				standard = "PSR12",
			})
		end,
	},
}

return lang_utils
