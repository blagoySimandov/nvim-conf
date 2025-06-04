return {
  "piersolenski/wtf.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>aw",
      mode = { "n", "x" },
      function()
        require("wtf").ai()
      end,
      desc = "Debug diagnostic with AI",
    },
  },
  config = function()
    local wtf = require("wtf")

    vim.api.nvim_create_user_command("WtfAI", function()
      wtf.ai()
    end, { desc = "Debug diagnostic with AI" })

    vim.api.nvim_create_user_command("WtfSearch", function()
      wtf.search()
    end, { desc = "Search diagnostic with Google" })

    vim.api.nvim_create_user_command("WtfHistory", function()
      wtf.history()
    end, { desc = "Populate the quickfix list with previous chat history" })

    vim.api.nvim_create_user_command("WtfGrepHistory", function()
      wtf.grep_history()
    end, { desc = "Grep previous chat history with Telescope" })
  end,
}
