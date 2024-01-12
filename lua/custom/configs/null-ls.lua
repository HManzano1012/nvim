local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    -- formatters
    null_ls.builtins.formatting.prettierd, -- javascript, typescript, json, css, markdown
    null_ls.builtins.formatting.gofumpt, -- go
    null_ls.builtins.formatting.goimports_reviser, -- go
    null_ls.builtins.formatting.golines, -- go
    null_ls.builtins.formatting.black, -- python
    null_ls.builtins.formatting.phpcbf, -- php
    null_ls.builtins.formatting.stylua, -- lua
    null_ls.builtins.formatting.htmlbeautifier, -- html

    -- linters
    null_ls.builtins.diagnostics.mypy, -- python
    null_ls.builtins.diagnostics.ruff, -- ruby
    null_ls.builtins.diagnostics.eslint_d, -- javascript, typescript, vue, json
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
