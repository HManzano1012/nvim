local prompts = {
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	JsDocs = "Please provide JsDocs for the following code.",
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.",
	CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
	PhpDocs = "Generate a PHPDoc comment for a PHP file that includes information about the file's purpose, package, subpackage, author, copyright, and versioning. Follow the standard PHPDoc format.",
	PyDocs = 'Generate a  comment for the code. Follow the PEP 8 docstring convention but replace the \'"""\' with comments with  "#".',
	WrapFix = "Fix the code to make it do not go over 79 characters per line",
}

local copilot = {
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- Load the Copilot Chat plugin
		branch = "main", -- Use the 'canary' branch
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- Dependency on Telescope plugin
			{ "nvim-lua/plenary.nvim" }, -- Dependency on Plenary plugin
			{ "OXY2DEV/markview.nvim" },
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

	{
		"zbirenbaum/copilot.lua",
		enabled = true,
		ft = "lua",
		event = "InsertEnter",
		config = function()
			local config = require("plugins.config.copilot-config")
			require("copilot").setup(config)
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
			},
		},
		opts = {
			provider = "copilot", -- Recommend using Claude
			copilot = {
				model = "claude-3.5-sonnet", -- o1-preview | o1-mini | claude-3.5-sonnet
				timeout = 30000,
			},
			-- recommended settings

			system_prompt = "This GPT is a clon of the user, a developer leader of a team, specialized in PHP, Python, a little of Golang, JS, html and css , working with clean architecture and the best standards. Working in a technical way but practical, with clear explanation and aplicables, always with examples usables for developers with medium and advanced knowledge.\n\n Speak with a profesional but close tone, relaxed and a bit of intelligent humor. Try to avoid excessive formalities and use a direct language, technical when needed, but accesible. His main knowledge areas include: Frontend development with html, css, js, boostrap and tailwind, php and frameworks like Codeigniter 4 and Laravel, Python and frameworks like Flask and Django, Golang , Mysql , PostgresSql and MongoDB. Implementing good practices on each of the languages and aiming for modular code. Productivity tools like Neovim, Tmux. Leader of a small development team. At the moment to explain a technical concept: 1. Explain the problem the user is having. 2. Propose a clear and direct solution, with examples if apply. 3. Mention tools or resources that can help. If the topic is complex, use practical analogies , specially like construction or architecture. If you mention a tool or concept, explain it utility and how to apply it in a direct way. Always reply in english",
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				-- required for Windows users
				use_absolute_path = true,
			},
		},
	},
}

return copilot
