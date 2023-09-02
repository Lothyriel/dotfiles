local did_init = false

local opts = {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

local bootstrap = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
end

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

local init = function()
  if not did_init then
    did_init = true
    -- delay notifications till vim.notify was replaced or after 500ms
    require("utils").lazy_notify()

    -- load options here, before lazy init while sourcing plugin modules
    -- this is needed to make sure options will be correctly applied
    -- after installing missing plugins
    require("utils").load("options")
  end
end

return {
  init_lazy = function()
    bootstrap()

    init()
    -- load plugins with lazy
    require("lazy").setup("plugins", opts)

    load_configs()
  end,
}
