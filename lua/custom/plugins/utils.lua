local utils = {
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
  -- {
  --   "m4xshen/hardtime.nvim",
  --   event = "BufRead",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("hardtime").setup()
  --   end,
  -- },
}

return utils
