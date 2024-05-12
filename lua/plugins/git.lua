local git = {
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufRead",
		version = "*",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▌", bold = true },
					change = { text = "▌", bold = true },
					delete = { text = "▌", bold = true },
					topdelete = { text = "‾", bold = true },
					changedelete = { text = "▌", bold = true },
					untracked = { text = "┆", bold = true },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})
		end,
	},
	{
		"SuperBo/fugit2.nvim",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},
	{
		-- optional: for diffview.nvim integration
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- lazy, only load diffview by these commands
		cmd = {
			"DiffviewFileHistory",
			"DiffviewOpen",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
	},
}

return git
