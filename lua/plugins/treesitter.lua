local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		lazy = false,
		opts = function()
			local opts = {
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"tsx",
					"go",
					"python",
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
			}

			require("nvim-treesitter.configs").setup(opts)

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
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
