local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		lazy = false,
		opts = function()
			local opts = {
				ensure_installed = { "lua", "javascript", "typescript", "tsx", "go", "python", "php", "vue" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = false },
			}

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
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
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
