local noice = {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function()
      require("noice").setup {
        lsp = {
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      }
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
}

return {}
