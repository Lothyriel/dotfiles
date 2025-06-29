return {
  "mason.nvim",
  opts = {
    ensure_installed = { "html-lsp", "rust-analyzer" },
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
  },
}
