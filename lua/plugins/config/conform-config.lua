local conform_config = {
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettierd" },
		python = { "autopep8", "isort" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		go = { "gofmt", "goimports-reviser", "golines" },
		php = { "php-cs-fixer" },
		blade = { "blade-formatter" },
		html = { "prettierd" },
		css = { "prettierd" },
		xml = { "xmlformatter" },
		vue = { "prettierd" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		yaml = { "yamlfmt" },
		-- sql = { "sqlformat" },
	},
	formatters = {
		["php-cs-fixer"] = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"$FILENAME",
				"--config=/home/hmanzano1012/.config/nvim/utils/config-php-formmatter.php",
				"--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
			},
			stdin = false,
		},
	},

	format_on_save = function()
		return { timeout_ms = 700, quiet = true, lsp_fallback = false }
	end,

	notify_on_error = true,
}

return conform_config
