return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern" },
    patterns = {
      "package.json",
      "Cargo.toml",
      "*.sln",
    },
    exclude_dirs = {
      ".git",
      "node_modules",
      "target",
      "bin",
      "obj",
      "nvim-data",
    },
  },
}
