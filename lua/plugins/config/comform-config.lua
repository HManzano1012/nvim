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
		-- prettier = {
		-- 	command = function(self, bufnr)
		-- 		local cmd = util.find_executable({ ".yarn/sdks/prettier/bin-prettier.js" }, "")(self, bufnr)
		-- 		if cmd ~= "" then
		-- 			return cmd
		-- 		end
		-- 		-- return type of util.from_node_modules is fun(self: conform.FormatterConfig, ctx: conform.Context): string
		-- 		---@diagnostic disable-next-line
		-- 		return util.from_node_modules(fs.is_windows and "prettier.cmd" or "prettier")(self, bufnr)
		-- 	end,
		-- },
	},
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettierd" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		go = { "gofmt", "goimports-reviser", "golines" },
		php = { "phpcbf", "php-cs-fixer" },
		html = { "prettierd" },
		css = { "prettierd" },
		xml = { "xmlformatter" },
		vue = { "prettierd" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		-- sql = { "sqlformat" },
	},
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},
	notify_on_error = true,
}

return comform_config
