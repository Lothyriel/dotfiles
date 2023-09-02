local lazy = require("config.lazy")

local load_configs = function()
  local utils = require("utils")

  if vim.fn.argc(-1) == 0 then
    -- autocmds and keymaps can wait to load
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
      pattern = "VeryLazy",
      callback = function()
        utils.load("autocmds")
        utils.load("keymaps")
      end,
    })
  else
    -- load them now so they affect the opened buffers
    utils.load("autocmds")
    utils.load("keymaps")
  end
end

return {
  init_lazy = function()
    lazy.bootstrap()

    load_configs()

    lazy.init()
  end,
}
