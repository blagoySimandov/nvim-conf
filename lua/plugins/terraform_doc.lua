return {
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    cmd = "Telescope terraform_doc",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("terraform_doc")
    end,
  },
}
