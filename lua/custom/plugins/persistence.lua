local persistence = {
  {
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup {
        dir = vim.fn.stdpath "data" .. "/sessions/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
}

return persistence
