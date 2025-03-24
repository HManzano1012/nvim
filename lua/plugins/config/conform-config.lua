local conform_config = {
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettierd" },
		python = {  "black","isort" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		go = { "gofmt", "goimports-reviser", "golines" },
		-- php = { "php" },
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
	-- formatters = {
	-- 	["php"] = {
	-- 		command = "php-cs-fixer",
	-- 		args = {
	-- 			"fix",
	-- 			"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
	-- 			"$FILENAME",
	-- 		},
	-- 		stdin = false,
	-- 	},
	-- },
	format_on_save = function(bufnr)
		local ignore_filetypes = { "php" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end
		return { timeout_ms = 700, quiet = true, lsp_fallback = false }
	end,

	notify_on_error = true,
}

return conform_config
