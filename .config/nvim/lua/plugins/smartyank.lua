-- Copy / Paste Support
return {
  "ibhagwan/smartyank.nvim",
  event = { "TextYankPost" },
  opts = {
    highlight = { enabled = true },
    clipboard = {
      enabled = true,
      register = "+",      -- or "*" if you prefer
      tmux = false,
      osc52 = {
        enabled = true,
        ssh_only = false,
        silent = false,
      },
    },
  },
}
