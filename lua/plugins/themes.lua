return {
  { "loctvl842/monokai-pro.nvim", opts = {
    filter = "machine",
    transparent_background = true,
  } },

  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {
    transparent_mode = false,
  } },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
