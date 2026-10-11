local verilog_fts = { "verilog", "systemverilog" }

local function run_in_dir(cmd)
  local dir = vim.fn.expand("%:p:h")
  Snacks.terminal(cmd, { cwd = dir, interactive = false, auto_close = false })
end

local function sources()
  local dir = vim.fn.expand("%:p:h")
  local files = vim.list_extend(vim.fn.glob(dir .. "/*.v", false, true), vim.fn.glob(dir .. "/*.sv", false, true))
  return table.concat(vim.tbl_map(vim.fn.shellescape, files), " ")
end

local function simulate()
  vim.cmd("write")
  run_in_dir("iverilog -g2012 -Wall -o .sim.vvp " .. sources() .. " && vvp -n .sim.vvp")
end

local function synthesize()
  vim.cmd("write")
  local file = vim.fn.expand("%:t")
  run_in_dir(string.format("yosys -p 'read_verilog -sv %s; synth -auto-top; stat'", file))
end

local function lint()
  vim.cmd("write")
  run_in_dir("verilator --lint-only -Wall --timing " .. sources())
end

local function waves()
  local dir = vim.fn.expand("%:p:h")
  local vcd = vim.fn.glob(dir .. "/*.vcd", false, true)[1]
  if not vcd then
    return vim.notify("No .vcd file in " .. dir, vim.log.levels.WARN)
  end
  vim.system({ "surfer", vcd }, { detach = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = verilog_fts,
  callback = function(ev)
    local map = function(lhs, fn, desc)
      vim.keymap.set("n", lhs, fn, { buffer = ev.buf, desc = desc })
    end
    map("<leader>vs", simulate, "Verilog: simulate (iverilog)")
    map("<leader>vy", synthesize, "Verilog: synth (yosys)")
    map("<leader>vl", lint, "Verilog: lint (verilator)")
    map("<leader>vw", waves, "Verilog: waves (surfer)")
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "systemverilog" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          cmd = { "verible-verilog-ls", "--rules_config_search" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "verible" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        verilog = { "verible" },
        systemverilog = { "verible" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = { spec = { { "<leader>v", group = "verilog", icon = "󰍛" } } },
  },
}
