return {
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "(Git) Open Neogit" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "(Git) File history (current file)" },
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "(Git) Open Diff View" },
      { "<leader>gD", "<cmd>DiffviewFileHistory<CR>", desc = "(Git) Repo history" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "(Git) Close Diffview" },
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
