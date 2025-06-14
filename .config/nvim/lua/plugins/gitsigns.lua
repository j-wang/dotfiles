-- Git signs
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
     },
     current_line_blame = false,
     current_line_blame_opts = {
        delay = 300,
        virt_text_pos = "eol",  -- show at end of line
     },
     signcolumn = true,  -- Show git signs in the gutter
     numhl      = false,
     linehl     = false,
     watch_gitdir = {
       interval = 1000,
       follow_files = true,
      },
    })
  end,
}
