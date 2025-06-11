return {
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current file)" },
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diff View" },
      { "<leader>gD", "<cmd>DiffviewFileHistory<CR>", desc = "Repo history" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
        disable_commit_confirmation = true,
        signs = {
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
}
