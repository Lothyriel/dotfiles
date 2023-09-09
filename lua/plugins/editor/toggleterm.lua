return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    local terminal = Terminal:new({ hidden = true })

    local toggle_git = function()
      lazygit:toggle()
    end

    local toggle_terminal = function()
      terminal:toggle()
    end

    -- lazygit
    require("utils").map("n", "<leader>g", toggle_git, { desc = "Lazygit" })

    require("utils").map("n", "<leader>h", toggle_terminal, { desc = "Open terminal horizontally", remap = true })

    require("toggleterm").setup()
  end,
}
