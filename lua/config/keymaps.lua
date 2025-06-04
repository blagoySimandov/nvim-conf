vim.api.nvim_set_keymap(
  "n",
  "<leader>ota",
  ":Telescope terraform_doc full_name=hashicorp/azurerm<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>otr",
  ":Telescope terraform_doc full_name=hashicorp/azuread<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>otd", ":Telescope terraform_doc<cr>", { noremap = true, silent = true })

-- Clsoe left window
local map = vim.keymap.set

map("n", "<leader>wl", function()
  local win = vim.fn.winnr()
  vim.cmd("wincmd h")
  if vim.fn.winnr() ~= win then
    vim.cmd("close")
  else
    vim.notify("No window to the left", vim.log.levels.WARN)
  end
end, { desc = "Close left window" })

-- Close the window below
map("n", "<leader>wb", function()
  local win = vim.fn.winnr()
  vim.cmd("wincmd j") -- go down
  if vim.fn.winnr() ~= win then
    vim.cmd("close")
  else
    vim.notify("No window below", vim.log.levels.WARN)
  end
end, { desc = "Close bottom window" })

--TELESCOPE SYMBOL SEARCH VIA TREESITTER
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ss", telescope.treesitter, { desc = "Goto Symbol (TreeSitter)" })

-- for global search use lsp since treesitter is per buffer
vim.keymap.set(
  "n",
  "<leader>sS",
  require("telescope.builtin").lsp_workspace_symbols,
  { desc = "Goto Symbol (Workspace)" }
)
