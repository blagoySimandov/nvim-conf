local function tokyocolors(colors)
  local hsluv = require("tokyonight.hsluv")
  local multiplier = 2.0

  local function adjust_color(val)
    local hsv = hsluv.hex_qto_hsluv(val)
    hsv[2] = hsv[2] * multiplier > 100 and 100 or hsv[2] * multiplier
    return hsluv.hsluv_to_hex(hsv)
  end

  for k, v in pairs(colors) do
    if type(v) == "string" and v ~= "NONE" then
      colors[k] = adjust_color(v)
    elseif type(v) == "table" then
      if vim.islist(v) then
        for kk, vv in ipairs(v) do
          if type(vv) == "string" and vv ~= "NONE" then
            colors[k][kk] = adjust_color(vv)
          end
        end
      end
    end
  end
end

return {
  { "loctvl842/monokai-pro.nvim", lazy = true, opts = {
    filter = "classic",
    transparent_background = false,
  } },
  { "ellisonleao/gruvbox.nvim", lazy = true, priority = 1000, config = true, opts = {
    transparent_mode = false,
  } },
  { "rose-pine/neovim", name = "rose-pine" },
  { "EdenEast/nightfox.nvim", lazy = true, name = "nightfox" },
  { "aktersnurra/no-clown-fiesta.nvim", lazy = true },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    transparent = true,
    transparent_mode = "background",
    transparent_background = true,
    priority = 1000,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true,
    priority = 1000,
    transparent = true,
    config = function()
      vim.cmd([[ colorscheme NeoSolarized ]])
    end,
  },
  { "catppuccin/nvim", lazy = true, name = "catppuccin", priority = 1000, opts = {
    flavour = "frappe",
  } },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    opts = {
      style = "night",
      --colors = tokyocolors,
      --transparent = true,
    },
  },
  { "rebelot/kanagawa.nvim", lazy = true, name = "kanagawa" },
  { "savq/melange-nvim", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    -- config = function()
    --   require("bamboo").setup({
    --     -- optional configuration here
    --   })
    --   require("bamboo").load()
    -- end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
