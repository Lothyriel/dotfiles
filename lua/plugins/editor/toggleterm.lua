local terminals = {}

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

    local toggle_terminal_root = function()
      local key = utils.get_root()

      terminals[key] = terminals[key] or Terminal:new({ hidden = true, dir = key })

      terminals[key]:toggle()
    end

    local toggle_terminal_root = function()
      local key = utils.get_root()

      terminals[key] = terminals[key] or Terminal:new({ hidden = true, dir = key })

      terminals[key]:toggle()
    end

    local toggle_terminal_cwd = function()
      local key = vim.loop.cwd()

      terminals[key] = terminals[key] or Terminal:new({ hidden = true, dir = key })

      terminals[key]:toggle()
    end

    -- lazygit
    require("utils").map("n", "<leader>gg", toggle_git, { desc = "Lazygit" })

    require("utils").map("n", "<leader>h", toggle_terminal_root, { desc = "Open terminal horizontally (root)", remap = true })

    require("utils").map("n", "<leader>ft", toggle_terminal_cwd, { desc = "Open terminal horizontally (cwd)", remap = true })

    require("toggleterm").setup()
  end,
}
