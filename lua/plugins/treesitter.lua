local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		lazy = false,
		opts = function()
			local opts = {
				ensure_installed = { "lua", "javascript", "typescript", "tsx", "go", "python", "php", "vue" },
				auto_install = true,

				highlight = {
					enable = true,
					-- disable = function(lang, buf)
					-- 	local max_filesize = 100 * 1024 -- 100 KB
					-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- 	if ok and stats and stats.size > max_filesize then
					-- 		return true
					-- 	end
					-- end,
				},

				indent = { enable = true },

				autotag = {
					enable = true,
				},
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
			"hbs",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

return treesitter
