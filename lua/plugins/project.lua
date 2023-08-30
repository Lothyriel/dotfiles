return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern" },
    patterns = {
      "package.json",
      "Cargo.toml",
      "*.sln",
      "init.lua",
    },
    exclude_dirs = {
      ".git",
      "node_modules",
      "target",
      "bin",
      "obj",
    },
  },
}
