local neorg = {
  {
    "nvim-neorg/neorg",
    enabled = true,
    lazy = false,
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/work",
                personal = "~/personal",
              },
              default_workspace = "work",
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
    -- keys = {
    --
    --   { "<leader>nj", "<cmd>Neorg journal today<cr>", noremap = true, desc = "Neorg journal Today" },
    --   { "<leader>nw", "<cmd>Neorg workspace<cr>", noremap = true, desc = "Neorg Workspace" },
    --   { "<leader>nn", "core.dirman.new.note", noremap = true, desc = "Neorg new note" },
    --   { "<leader>ni", "<cmd>Neorg index<cr>" },
    -- },
  },
}

return neorg
