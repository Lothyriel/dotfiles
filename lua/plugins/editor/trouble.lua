return {
  -- better diagnostics list and others
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<Cmd>TroubleToggle document_diagnostics<Cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>xX", "<Cmd>TroubleToggle workspace_diagnostics<Cr>", desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>xL", "<Cmd>TroubleToggle loclist<Cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<Cmd>TroubleToggle quickfix<Cr>", desc = "Quickfix List (Trouble)" },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
