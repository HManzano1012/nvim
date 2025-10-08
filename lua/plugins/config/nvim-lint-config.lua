local vim = vim

require("lint").linters_by_ft = {
	lua = { "luacheck" },
	javascript = { "eslint_d" },
	json = { "jsonlint" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	go = { "golangcilint" },
	php = { "phpcs" },
	python = { "flake8" },
	html = { "htmlhint" },
	css = { "stylelint" },
	vue = { "eslint_d" },
	groovy = { "npm-groovy-lint" },
}
local linters = require("lint").linters
local phpcs = linters.phpcs
-- phpcs.cmd = "~/.composer/vendor/bin/phpcs"
phpcs.args = {
	"-q",
	-- <- Add a new parameter here
	"--standard=PSR12",
	"--report=json",
	"-",
}

local eslint_d = linters.eslint_d
eslint_d.args = {
	"--no-warn-ignored", -- <-- this is the key argument
	"--format",
	"json",
	"--stdin",
	"--stdin-filename",
	function()
		return vim.api.nvim_buf_get_name(0)
	end,
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
