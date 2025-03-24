local whichkey = {
	win = {
		no_overlap = true,
		border = "single",
	},
	spec = {
		{ "<leader>a", group = "AI" }, -- Define a group for AI-related commands
		{ "<leader>l", group = "Laravel" }, -- Define a group for AI-related commands
		{ "<leader>f", group = "Telescope" }, -- Define a group for AI-related commands
		{ "<leader>g", group = "Git" }, -- Define a group for AI-related commands
		{ "<leader>gc", group = "Git Conflicts" }, -- Define a group for AI-related commands
		{ "<leader>n", group = "Notes" }, -- Define a group for AI-related commands
		{ "<leader>p", group = "PHP" }, -- Define a group for AI-related commands
		{ "<leader>d", group = "DADBOD" }, -- Define a group for AI-related commands
		{ "<leader>v", group = "Ecolog" }, -- Define a group for AI-related commands
		{
			"<leader>ah",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.help_actions())
			end,
			desc = "CopilotChat - Help actions",
		},
		{
			"<leader>ap",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
		{
			"<leader>ap",
			":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
			mode = "x",
			desc = "CopilotChat - Prompt actions",
		},
		{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
		{ "<leader>av", "<cmd>CopilotChatVisual<cr>", mode = "x", desc = "CopilotChat - Open in vertical split" },
		{ "<leader>ax", "<cmd>CopilotChatInline<cr>", mode = "x", desc = "CopilotChat - Inline chat" },
		{
			"<leader>ai",
			function()
				local input = vim.fn.input("Ask Copilot: ")
				if input ~= "" then
					vim.cmd("CopilotChat " .. input)
				end
			end,
			desc = "CopilotChat - Ask input",
		},
		{ "<leader>am", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Generate commit message for all changes" },
		{
			"<leader>aM",
			"<cmd>CopilotChatCommitStaged<cr>",
			desc = "CopilotChat - Generate commit message for staged changes",
		},
		{
			"<leader>aq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					vim.cmd("CopilotChatBuffer " .. input)
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
		{ "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
		{ "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
		{ "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
		{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		{ "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
	},
}

return whichkey
