local devdocs = {
  {
    "luckasRanarison/nvim-devdocs",
    cmd = "DevdocsOpenFloat",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      previewer_cmd = "glow",
      cmd_args = { "-s", "dark", "-w", "80" },
      float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        height = 25,
        width = 150,
        border = "rounded",
      },
    },
  },
}

return devdocs
