return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        never_show = {
          ".git",
          "node_modules",
          "target",
          ".vs",
          ".vscode",
        },
      },
    },
  },
}
