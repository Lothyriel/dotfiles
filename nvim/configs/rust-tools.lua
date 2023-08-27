local lspconfig = require("plugins.configs.lspconfig")
local dap = require('dap')

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"),
      args = {"--port", "${port}"},
      detached = false,
    }
}

return {
    server = {
        on_attach = lspconfig.on_attach,
        capabilities = lspconfig.capabilities,
    }
}
