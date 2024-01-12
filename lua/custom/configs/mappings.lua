local wk = require "which-key"

wk.register {
  ["<leader>f"] = {
    name = "+ Files",
    f = { "<cmd> Telescope find_files <CR>", "Find files", mode = { "n", "v" } },
    a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all", mode = { "n", "v" } },
    w = { "<cmd> Telescope live_grep <CR>", "Live grep", mode = { "n", "v" } },
    b = { "<cmd> Telescope buffers <CR>", "Find buffers", mode = { "n", "v" } },
    h = { "<cmd> Telescope help_tags <CR>", "Help page", mode = { "n", "v" } },
    o = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles", mode = { "n", "v" } },
    z = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer", mode = { "n", "v" } },
  },
  ["<leader>g"] = {
    name = "+ Git",
    l = { "<cmd>LazyGit<cr>", "LazyGit", mode = { "n", "v" } },
    t = { "<cmd> Telescope git_status <CR>", "Git status", mode = { "n", "v" } },
    c = { "<cmd> Telescope git_commits <CR>", "Git commits", mode = { "n", "v" } },
    r = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
      mode = { "n" },
    },
    p = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
      mode = { "n" },
    },
    b = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
      mode = { "n" },
    },
    d = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
      mode = { "n" },
    },
  },
  ["<leader>c"] = {
    name = "+ Code",
    r = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    c = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
      mode = { "n" },
    },
    a = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
      mode = { "n", "v" },
    },
    f = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    d = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    s = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },
  },
  ["<leader>C"] = {
    name = "+ ChatGTP",
    c = { "<cmd> ChatGPT <CR>", "Open ChatGTP", mode = { "n" } },
    a = { "<cmd> ChatGPTActAs <CR>", "Open ChatGTP act as", mode = { "n" } },
  },
  ["<leader>D"] = {
    name = "+ Devdocs",
    d = { "<cmd> DevdocsOpenFloat <CR>", "Open DevDocs", mode = { "n" } },
    i = { "<cmd> DevdocsInstall <CR>", "Install DevDocs", mode = { "n" } },
  },
  ["<leader>n"] = {
    name = "+ Neorg",
    n = { "<cmd> Neorg new note <CR>", "Neorg", mode = { "n" } },
    i = { "<cmd> Neorg index <CR>", "Neorg index", mode = { "n" } },
    j = { "<cmd> Neorg journal today <CR>", "Neorg journal today", mode = { "n" } },
    w = { "<cmd> Neorg workspace <CR>", "Neorg workspace", mode = { "n" } },
  },
  ["<leader>o"] = {
    name = "+ Others",
    c = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet", mode = { "n" } },
    t = { "<cmd> Telescope themes <CR>", "Nvchad themes", mode = { "n" } },
    m = { "<cmd> Telescope marks <CR>", "telescope bookmarks", mode = { "n" } },
    h = { "<cmd> Telescope terms <CR>", "Pick hidden term", mode = { "n" } },
    n = { "<cmd> set nu! <CR>", "Toggle line number", mode = { "n" } },
    r = { "<cmd> Telescope registers <CR>", "Telescope registers", mode = { "n" } },
  },
  ["<leader>w"] = {
    name = "+ Workspace",
    a = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },
    r = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },
    l = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}
