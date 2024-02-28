local git = {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
  },
  {
    "akinsho/git-conflict.nvim",
    event = "BufRead",
    version = "*",
    config = true,
  },
}

return git
