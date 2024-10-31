return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>o", group = "open" },
      { "<leader>ot", group = "terraform" },
      {
        "<leader>ota",
        ":Telescope terraform_doc full_name=hashicorp/azurerm<cr>",
        desc = "Open Terraform azurerm doc",
      },
      { "<leader>otd", ":Telescope terraform_doc<cr>", desc = "Open Terraform doc" },
      {
        "<leader>otr",
        ":Telescope terraform_doc full_name=hashicorp/azuread<cr>",
        desc = "Open Terraform azuread doc",
      },
    },
  },
}
