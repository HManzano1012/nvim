local prompts = {
	Explain = "Please explain how the following code works.", -- Prompt to explain code
	Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
	Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
	Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
	FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
	FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
	BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
	Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
	JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
	CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
	Summarize = "Please summarize the following text.", -- Prompt to summarize text
	Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
	Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
	Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

local copilot = {
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- Load the Copilot Chat plugin
		branch = "canary", -- Use the 'canary' branch
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- Dependency on Telescope plugin
			{ "nvim-lua/plenary.nvim" }, -- Dependency on Plenary plugin
		},
		opts = {
			mappings = {
				complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" }, -- Keybinding for completion
				close = { normal = "q", insert = "<C-c>" }, -- Keybinding to close chat
				reset = { normal = "<C-x>", insert = "<C-x>" }, -- Keybinding to reset chat
				submit_prompt = { normal = "<CR>", insert = "<C-CR>" }, -- Keybinding to submit prompt
				accept_diff = { normal = "<C-y>", insert = "<C-y>" }, -- Keybinding to accept diff
				yank_diff = { normal = "gmy" }, -- Keybinding to yank diff
				show_diff = { normal = "gmd" }, -- Keybinding to show diff
				show_system_prompt = { normal = "gmp" }, -- Keybinding to show system prompt
				show_user_selection = { normal = "gms" }, -- Keybinding to show user selection
				show_help = { normal = "gmh" }, -- Keybinding to show help
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")

			opts.auto_follow_cursor = false -- Disable auto-follow cursor
			opts.show_help = false -- Disable showing help by default

			opts.question_header = "## User " -- Header for user questions
			opts.answer_header = "## Copilot " -- Header for Copilot answers
			opts.error_header = "## Error " -- Header for errors
			opts.prompts = prompts -- Use the defined prompts
			opts.chat_autocomplete = true

			-- Set default selection method
			opts.selection = select.unnamed
			-- Define custom prompts for commit messages
			opts.prompts.Commit = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = select.gitdiff,
			}

			opts.prompts.CommitStaged = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = function(source)
					return select.gitdiff(source, true)
				end,
			}

			-- Setup Copilot Chat with the provided options
			chat.setup(opts)
			-- require("CopilotChat.integrations.cmp").setup()

			-- Create user commands for different chat modes
			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })

			-- Set buffer-specific options when entering Copilot buffers
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true

					local ft = vim.bo.filetype
					if ft == "copilot-chat" then
						vim.bo.filetype = "markdown"
					end
				end,
			})
		end,
		event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
	},

	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	enabled = false,
	-- 	cmd = "Copilot",
	--  	event = "InsertEnter",
	-- 	config = function()
	-- 		local config = require("plugins.config.copilot-config")
	-- 		require("copilot").setup(config)
	-- 	end,
	-- },
}

return copilot
