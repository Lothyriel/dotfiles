local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      function ()
        local widgets = require('dap.ui.widgets')
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar"
    },
    ["<F5>"] = {
      "<cmd> RustDebuggables <CR>",
      "Debuggables"
    },
    ["<F9>"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<F10>"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over"
    },
    ["<F11>"] = {
      "<cmd> DapStepInto <CR>",
      "Step Into"
    },
    ["<leader>gt"] = {
      "<cmd> Git diffthis <CR>",
      "Git diff this"
    },
  }
}

return M
