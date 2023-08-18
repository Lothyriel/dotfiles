local lspconfig = require("plugins.configs.lspconfig")

return {
    server = {
        on_attach = lspconfig.on_attach,
        capabilities = lspconfig.capabilities,
    }
}