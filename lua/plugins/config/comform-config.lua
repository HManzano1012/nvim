local comform_config = {
	formatters = {
		["php-cs-fixer"] = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"--rules=@PSR2", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
				"$FILENAME",
			},
			stdin = false,
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettierd" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		go = { "gofmt", "goimports-reviser", "golines" },
		php = { "phpcbf", "php-cs-fixer" },
		html = { "prettierd" },
		css = { "prettierd" },
		xml = { "xmlformatter" },
		vue = { "prettierd" },
		-- sql = { "sqlformat" },
	},
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},
	notify_on_error = true,
}

return comform_config
