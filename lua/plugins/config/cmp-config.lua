local cmp = require("cmp")
local cmp_config = {
	performance = {
		debounce = 0,
		throttle = 0,
	},
	-- preselect = cmp.preselectmode.none,
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
		scrollbar = true,
	},

	window = {
		completion = {
			winhighlight = "normal:cmppmenu,cursorline:cmpsel,floatborder:TelescopeBorder",
			scrollbar = true,
			border = {
				{ "󱐋", "warningmsg" },
				{ "─", "cmppmenu" },
				{ "┐", "cmppmenu" },
				{ "│", "cmppmenu" },
				{ "┘", "cmppmenu" },
				{ "─", "cmppmenu" },
				{ "└", "cmppmenu" },
				{ "│", "cmppmenu" },
			},
		},
		documentation = {
			border = {
				{ "", "diagnostichint" },
				{ "─", "cmppmenu" },
				{ "┐", "cmppmenu" },
				{ "│", "cmppmenu" },
				{ "┘", "cmppmenu" },
				{ "─", "cmppmenu" },
				{ "└", "cmppmenu" },
				{ "│", "cmppmenu" },
			},
			winhighlight = "normal:cmppmenu,cursorline:cmpsel,floatborder:TelescopeBorder",
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
		["<c-p>"] = cmp.mapping.select_prev_item(),
		["<c-n>"] = cmp.mapping.select_next_item(),
		["<c-d>"] = cmp.mapping.scroll_docs(-4),
		["<c-f>"] = cmp.mapping.scroll_docs(4),
		["<c-space>"] = cmp.mapping.complete(),
		["<c-e>"] = cmp.mapping.close(),
		["<cr>"] = cmp.mapping.confirm({
			-- behavior = cmp.confirmbehavior.insert,
			select = false,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "ecolog" },
	},
	formatting = {
		format = function(entry, item)
			local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
			item = require("lspkind").cmp_format({
				-- any lspkind format settings here
			})(entry, item)
			if color_item.abbr_hl_group then
				item.kind_hl_group = color_item.abbr_hl_group
				item.kind = color_item.abbr
			end
			return item
		end,
	},
}
return cmp_config
