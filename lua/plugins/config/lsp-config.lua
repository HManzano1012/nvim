local vim = vim
local M = {}

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
	client.server_capabilities.semanticTokensProvider = true
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = true,
	lineFoldingOnly = true,
}
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local on_attach = M.on_attach
local capabilities = M.capabilities

local lspconfig = require("lspconfig")

local servers = {
	"ts_ls",
	-- "basedpyright",
	-- "eslint-ls",
	-- "phpactor",
	-- "intelephense",
	"tailwindcss",
	-- "lua_ls",
	"vuels",
	"jsonls",
	"dockerls",
	"jsonls",
	-- "html",
	"cssls",
	"groovyls",
	"yamlls",
	"bashls",
	-- "pylsp",
	"jedi_language_server",
	"marksman",
	"copilotlsp",
}
local util = require("lspconfig/util")

lspconfig.harper_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "toml" },
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "htmldjango" },
	root_dir = util.root_pattern("index.html", "index.htm", ".git"),
})

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "php", "blade", "php_only" },
	settings = {
		intelephense = {
			filetypes = { "php", "blade", "php_only" },
			files = {
				associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
				maxSize = 5000000,
			},
		},
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			hints = {
				rangeVariableTypes = true,
				parameterNames = true,
				constantValues = true,
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
		},
	},
})

-- lspconfig.basedpyright.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		basedpyright = {
-- 			inlayHints = {
-- 				callArgumentNames = false,
-- 			},
-- 			disableOrganizeImports = false,
-- 			disableTaggedHints = false,
-- 			analysis = {
-- 				typeCheckingMode = "off",
-- 			},
-- 		},
-- 	},
-- })

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
