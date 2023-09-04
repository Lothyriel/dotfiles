return {
  "aaditeynair/conduct.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  presets = {
    "*.sln",
    "package.json",
  },
  cmd = {
    "ConductNewProject",
    "ConductLoadProject",
    "ConductLoadLastProject",
    "ConductLoadProjectConfig",
    "ConductReloadProjectConfig",
    "ConductDeleteProject",
    "ConductRenameProject",
    "ConductProjectNewSession",
    "ConductProjectLoadSession",
    "ConductProjectDeleteSession",
    "ConductProjectRenameSession",
  },
  keys = {
    { "<leader>po", "<Cmd>Telescope conduct projects<CR>", mode = "n", desc = "Open projects" },
  },
  config = function()
    require("telescope").load_extension("conduct")
  end,
}
