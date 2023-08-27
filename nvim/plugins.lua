local plugins = {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
         -- your configuration comes here
         -- or leave it empty to use the default settings
         -- refer to the configuration section below
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "html-lsp",
                "tsserver"
            },
        },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "custom.configs.rust-tools"
        end,
        config = function(_, opts)
            local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/") or ""
            local codelldb_path = path .. "adapter/codelldb"
            local liblldb_path = path .. "lldb/lib/liblldb.so"
            
            if vim.fn.filereadable(codelldb_path) and vim.fn.filereadable(liblldb_path) then
              opts.dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
              }
            else
              local msg = "Either codelldb or liblldb is not readable."
                .. "\n codelldb: "
                .. codelldb_path
                .. "\n liblldb: "
                .. liblldb_path
              vim.notify(msg, vim.log.levels.ERROR)
            end
          
            require('rust-tools').setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
      'saecki/crates.nvim',
      ft = {"rust", "toml"},
      config = function (_, opts)
        local crates = require('crates')
        crates.setup(opts)
        crates.show()
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      opts = function ()
        local M = require "plugins.configs.cmp"
        table.insert(M.sources, {name="crates"})
        return M
      end,
  }
}
return plugins
