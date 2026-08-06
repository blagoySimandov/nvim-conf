return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
    servers = {
      gopls = {
        cmd = { "gopls", "-remote=auto" },
      },
      ruff = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}
