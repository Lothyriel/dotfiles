-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local handler = function()
  require("nvterm.terminal").toggle("horizontal")
end

vim.keymap.set("n", "<leader>h", handler, { desc = "Open terminal horizontally }", remap = true })
