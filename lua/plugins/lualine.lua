return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_b = {}
    opts.sections.lualine_z = {}
    local lazy_status = require("lazy.status")
    opts.sections.lualine_x = vim.tbl_filter(function(component)
      if type(component) == "table" then
        if component.cond == lazy_status.has_updates then
          return false
        end
        if component[1] == lazy_status.updates then
          return false
        end
      end
      return true
    end, opts.sections.lualine_x or {})
    return opts
  end,
}
