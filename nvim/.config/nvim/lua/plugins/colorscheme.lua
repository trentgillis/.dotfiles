return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "dragon",
        },
      })
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
