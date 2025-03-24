local lang_utils = {
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
