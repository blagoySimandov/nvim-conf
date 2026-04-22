local map = vim.keymap.set
local fzf = require("fzf-lua")

-- =========================
-- Window Management
-- =========================

-- Close left window
map("n", "<leader>wh", function()
  local win = vim.fn.winnr()
  vim.cmd("wincmd h")
  if vim.fn.winnr() ~= win then
    vim.cmd("close")
  else
    vim.notify("No window to the left", vim.log.levels.WARN)
  end
end, { desc = "Close left window" })

-- Close window below
map("n", "<leader>wb", function()
  local win = vim.fn.winnr()
  vim.cmd("wincmd j")
  if vim.fn.winnr() ~= win then
    vim.cmd("close")
  else
    vim.notify("No window below", vim.log.levels.WARN)
  end
end, { desc = "Close bottom window" })

-- =========================
-- Symbol Search (fzf-lua)
-- =========================

-- TreeSitter symbols (current buffer)
-- map("n", "<leader>ss", function()
--   fzf.treesitter()
-- end, { desc = "Goto Symbol (TreeSitter)" })

-- Workspace symbols (LSP)
map("n", "<leader>sS", function()
  -- fzf.lsp_workspace_symbols()
  fzf.lsp_live_workspace_symbols()
end, { desc = "Workspace Symbols" })

-- If you prefer live dynamic filtering instead:

-- =========================
-- File Search
-- =========================

local function files_expand(level)
  level = level or 0
  local base = vim.fn.expand("%:p:h")

  for _ = 1, level do
    base = vim.fn.fnamemodify(base, ":h")
  end

  fzf.files({
    cwd = base,
    prompt = "Files (level " .. level .. "): ",
    actions = {
      -- go up one level
      ["ctrl-h"] = function(_, _)
        files_expand(level + 1)
      end,
      -- go back down one level
      ["ctrl-l"] = function(_, _)
        if level > 0 then
          files_expand(level - 1)
        else
          files_expand(0)
        end
      end,
    },
  })
end

map("n", "<leader>ff", function()
  files_expand(0)
end, { desc = "Find files (C-h expand, C-l shrink)" })

-- =========================
-- Optional: Terminal ESC fix
-- =========================
-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = "*",
--   callback = function()
--     local opts = { buffer = 0, noremap = true, silent = true }
--     vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
--   end,
-- })
