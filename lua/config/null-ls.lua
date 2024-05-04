local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
	sources = {
		-- formatters
		null_ls.builtins.formatting.prettierd, -- javascript, typescript, json, css, markdown
		null_ls.builtins.formatting.gofumpt, -- go
		null_ls.builtins.formatting.goimports_reviser, -- go
		null_ls.builtins.formatting.golines, -- go
		null_ls.builtins.formatting.black, -- python
		null_ls.builtins.formatting.phpcbf.with({
			filetypes = { "php" },
			args = { "--standard=PSR12" },
		}), -- php
		null_ls.builtins.formatting.stylua, -- lua

		-- linters
		null_ls.builtins.diagnostics.mypy, -- python
		require("none-ls.diagnostics.eslint_d"), -- javascript, typescript
		null_ls.builtins.diagnostics.golangci_lint, -- go
		null_ls.builtins.diagnostics.phpcs, -- php
		null_ls.builtins.diagnostics.luacheck, -- lua
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}

return opts
