local utils = {
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
        timeout = vim.o.timeoutlen,
      }
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    enable = true,
    lazy = false,
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }

      vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
      vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>")
      vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>")
      vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>")
      vim.keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>")
      vim.keymap.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>")
    end,
  },
}

return utils
