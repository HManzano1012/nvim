local whichkey = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      -- vim.cmd "hi WhichKeyFloat ctermbg=NONE ctermfg=NONE"
      require "custom.configs.mappings"
    end,
    opts = {
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      window = {
        border = "single",
        position = "bottom",
        margin = { 0, 0, 0, 0 },
        padding = { 1, 1, 1, 1 },
        winblend = 0,
        zindex = 1000,
      },
    },
  },
}

return whichkey
