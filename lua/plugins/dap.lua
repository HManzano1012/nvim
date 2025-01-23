local dap = {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			local path = "/home/haroldm/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},

	-- {
	-- 	"leoluz/nvim-dap-go",
	-- 	ft = "go",
	-- 	dependencies = "mfussenegger/nvim-dap",
	-- 	config = function(_, opts)
	-- 		require("dap-go").setup(opts)
	-- 	end,
	-- },
}

return dap
