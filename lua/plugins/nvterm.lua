local handler = function()
  require("nvterm.terminal").toggle("horizontal")
end

return {
  "NvChad/nvterm",
  config = function()
    require("nvterm").setup()
  end,
  keys = {
    { "<leader>h", handler, desc = "Open terminal horizontally" },
  },
}
