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
