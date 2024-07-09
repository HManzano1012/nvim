local comform_config = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		go = { "goimports-reviser", "gofmt", "golines" },
		php = { "phpcbf", "phpmd" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}

return comform_config
