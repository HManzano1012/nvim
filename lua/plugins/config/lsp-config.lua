local vim = vim
local M = {}

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
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
	"basedpyright",
	-- "eslint-ls",
	-- "phpactor",
	-- "intelephense",
	"tailwindcss",
	-- "lua_ls",
	"vuels",
	"jsonls",
	"dockerls",
	"jsonls",
	"html",
	"cssls",
	"groovyls",
	"yamlls",
	"bashls",
}
local util = require("lspconfig/util")

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
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- local function phpactor_attach(_, bufnr)
-- 	vim.api.nvim_buf_create_user_command(bufnr, "LspPhpactorReindex", function()
-- 		vim.lsp.buf_notify(bufnr, "phpactor/index/reindex", {})
-- 	end, {})
--
-- 	vim.api.nvim_buf_create_user_command(bufnr, "LspPhpactorStatus", function()
-- 		local results, _ = vim.lsp.buf_request_sync(bufnr, "phpactor/status", { ["return"] = true })
--
-- 		local content = ""
--
-- 		for _, res in pairs(results or {}) do
-- 			if res ~= nil and res["result"] ~= nil then
-- 				content = content .. res["result"]
-- 			end
-- 		end
--
-- 		local Popup = require("nui.popup")
-- 		local event = require("nui.utils.autocmd").event
--
-- 		local popup = Popup({
-- 			enter = true,
-- 			focusable = true,
-- 			border = {
-- 				style = "rounded",
-- 			},
-- 			position = "50%",
-- 			size = {
-- 				width = "80%",
-- 				height = "60%",
-- 			},
-- 		})
--
-- 		-- mount/open the component
-- 		popup:mount()
--
-- 		-- unmount component when cursor leaves buffer
-- 		popup:on(event.BufLeave, function()
-- 			popup:unmount()
-- 		end)
-- 		local out = {}
-- 		for match in string.gmatch(content, "[^\n]+") do
-- 			table.insert(out, match)
-- 		end
--
-- 		vim.api.nvim_buf_set_option(popup.bufnr, "filetype", "markdown")
-- 		vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, out)
-- 	end, {})
-- end
--
-- return function(ops)
-- 	return vim.tbl_extend("force", {
-- 		on_attach = function(client, bufnr)
-- 			on_attach(client, bufnr)
-- 			phpactor_attach(client, bufnr)
-- 		end,
-- 		filetypes = { "php", "blade" },
-- 		init_options = {
-- 			["language_server_worse_reflection.inlay_hints.enable"] = true,
-- 			["language_server_worse_reflection.inlay_hints.params"] = true,
-- 			["language_server_worse_reflection.inlay_hints.types"] = true,
-- 			["language_server_configuration.auto_config"] = false,
-- 			["code_transform.import_globals"] = true,
-- 			-- ["language_server_phpstan.enabled"] = true,
-- 			-- ["language_server_phpstan.level"] = 7,
-- 			-- ["language_server_phpstan.bin"] = "phpstan",
-- 		},
-- 		handlers = {
-- 			["textDocument/inlayHint"] = function(err, result, ...)
-- 				for _, res in ipairs(result) do
-- 					res.label = res.label .. ": "
-- 				end
-- 				vim.lsp.handlers["textDocument/inlayHint"](err, result, ...)
-- 			end,
-- 		},
-- 	}, ops)
-- end
