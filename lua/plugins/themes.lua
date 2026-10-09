local cyberdream_styles = {
  ["@variable.parameter"] = { italic = true },
  ["@lsp.type.parameter"] = { italic = true },
  ["@function"] = { italic = true },
  ["@function.method"] = { italic = true, from = "@function" },
  ["@lsp.typemod.function.declaration"] = { italic = true, from = "@function" },
  ["@lsp.typemod.method.declaration"] = { italic = true, from = "@function" },
  ["@function.call"] = { from = "@function" },
  ["@function.method.call"] = { from = "@function" },
  ["@lsp.type.function"] = { from = "@function" },
  ["@lsp.type.method"] = { from = "@function" },
  ["@keyword.return"] = { bold = true },
  ["@keyword.exception"] = { bold = true, from = "@keyword" },
  ["@type.definition"] = { bold = true },
}

local function apply_cyberdream_styles()
  local resolved = {}
  for name, style in pairs(cyberdream_styles) do
    local base = vim.api.nvim_get_hl(0, { name = style.from or name, link = false })
    resolved[name] = vim.tbl_extend("force", base, { italic = style.italic, bold = style.bold })
  end
  for name, hl in pairs(resolved) do
    vim.api.nvim_set_hl(0, name, hl)
  end
end

return {
  -- { "rose-pine/neovim", name = "rose-pine" },
  -- { "loctvl842/monokai-pro.nvim", lazy = true, opts = {
  --   filter = "classic",
  --   transparent_background = false,
  -- } },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     transparent_mode = false,
  --   },
  -- },
  -- { "EdenEast/nightfox.nvim", lazy = true, name = "nightfox" },
  -- { "aktersnurra/no-clown-fiesta.nvim", lazy = true },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("CyberdreamStyles", { clear = true }),
        pattern = "cyberdream",
        callback = apply_cyberdream_styles,
      })
    end,
    opts = {
      italic_comments = true,
    },
  },
  -- {
  --   "Tsuzat/NeoSolarized.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = {
  --     enable_italics = false,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = false },
  --       string = { italic = false },
  --     },
  --     on_highlights = function(highlights, colors)
  --       highlights.TSParameter = { fg = colors.fg0, italic = true }
  --       highlights["@variable.parameter"] = { link = "TSParameter" }
  --     end,
  --   },
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "frappe",
  --     styles = {
  --       comments = { "italic" },
  --       keywords = {},
  --       conditionals = {},
  --     },
  --     custom_highlights = function(colors)
  --       return {
  --         ["@variable.parameter"] = { fg = colors.maroon, style = { "italic" } },
  --         ["@lsp.type.parameter"] = { fg = colors.maroon, style = { "italic" } },
  --       }
  --     end,
  --   },
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   name = "tokyonight",
  --   opts = {
  --     style = "night",
  --   },
  -- },
  -- { "rebelot/kanagawa.nvim", lazy = true, name = "kanagawa" },
  -- { "savq/melange-nvim", lazy = true },
  -- { "sainnhe/sonokai", lazy = true },
  -- {
  --   "ribru17/bamboo.nvim",
  --   lazy = true,
  --   priority = 1000,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
