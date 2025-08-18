-- Neo-tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim",        -- UI lib
    "s1n7ax/nvim-window-picker",   -- optional, but nice
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
  end
}
