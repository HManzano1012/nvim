local copilot = require("copilot.suggestion")

local copilot_config = {
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = false,
		},
	},
}

vim.keymap.set("i", "<Tab>", function()
	if copilot.is_visible() then
		copilot.accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { desc = "Super Tab" })

return copilot_config
