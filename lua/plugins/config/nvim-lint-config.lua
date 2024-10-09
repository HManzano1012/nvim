local vim = vim

require("lint").linters_by_ft = {
	lua = { "luacheck" },
	javascript = { "eslint_d" },
	json = { "jsonlint" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	go = { "golangcilint" },
	-- php = { "phpcs" },
	python = { "ruff" },
	html = { "htmlhint" },
	css = { "stylelint" },
	vue = { "eslint_d" },
	groovy = { "npm-groovy-lint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
