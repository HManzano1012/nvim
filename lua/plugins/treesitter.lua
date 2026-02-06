local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		lazy = false,
		opts = {
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"python",
        "php_only",
				"php",
				"vue",
				"json",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
			},
			sync_install = true,
			auto_install = true,
      highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = false },
		},
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,

	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"tsx",
			"jsx",
			"xml",
			"php",
			"blade",
			"markdown",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
			})
		end,
	},
}

return treesitter
