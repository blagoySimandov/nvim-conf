return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
    servers = {
      ruff = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}
