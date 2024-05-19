local cmp = {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			{
				"onsails/lspkind.nvim",
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
					scrollbar = true,
				},

				window = {
					completion = {
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,FloatBorder:TelescopeBorder",
						scrollbar = true,
						border = {
							{ "󱐋", "WarningMsg" },
							{ "─", "CmpPmenu" },
							{ "┐", "CmpPmenu" },
							{ "│", "CmpPmenu" },
							{ "┘", "CmpPmenu" },
							{ "─", "CmpPmenu" },
							{ "└", "CmpPmenu" },
							{ "│", "CmpPmenu" },
						},
					},
					documentation = {
						border = {
							{ "", "DiagnosticHint" },
							{ "─", "CmpPmenu" },
							{ "┐", "CmpPmenu" },
							{ "│", "CmpPmenu" },
							{ "┘", "CmpPmenu" },
							{ "─", "CmpPmenu" },
							{ "└", "CmpPmenu" },
							{ "│", "CmpPmenu" },
						},
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,FloatBorder:TelescopeBorder",
					},
				},
				snippet = {
					scrollbar = true,
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
					maxwidth = 10,
				},

				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
					{ name = "vim-dadbod-completion" },
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, vim_item)
						local kind =
							require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })

						kind.kind = " " .. ((strings[1] .. " " .. strings[2]) or "") .. " "

						local tw_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
						if tw_item.kind == "XX" then
							return tw_item
						end

						kind.abbr = tw_item.abbr

						return kind
					end,
				},
			})
		end,
	},
}

return cmp
