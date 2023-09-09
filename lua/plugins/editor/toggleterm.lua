return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local utils = require("utils")

    local toggle_git = function()
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        dir = utils.get_root(),
      })

      lazygit:toggle()
    end

    local toggle_terminal = function()
      local terminal = Terminal:new({ hidden = true, dir = utils.get_root() })
      terminal:toggle()
    end

    -- lazygit
    require("utils").map("n", "<leader>g", toggle_git, { desc = "Lazygit" })

    require("utils").map("n", "<leader>h", toggle_terminal, { desc = "Open terminal horizontally", remap = true })

    require("toggleterm").setup()
  end,
}
