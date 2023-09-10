function LoadResession()
  require("resession").load()
end

return {
  "stevearc/resession.nvim",
  opts = {
    autosave = {
      enabled = true,
      interval = 60,
      notify = false,
    },
  },
  keys = {
    {
      "<leader>pp",
      LoadResession,
      desc = "Load project session",
    },
    {
      "<leader>ps",
      function()
        require("resession").save()
      end,
      desc = "Save current project session",
    },
    {
      "<leader>pd",
      function()
        require("resession").delete()
      end,
      desc = "Delete project session",
    },
  },
}
