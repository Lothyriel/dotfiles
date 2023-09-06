local utils = require("utils")

return {
  -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<leader>,", "<Cmd>Telescope buffers show_all_buffers=true<CR>", desc = "Switch Buffer" },
    { "<leader>/", utils.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>:", "<Cmd>Telescope command_history<CR>", desc = "Command History" },
    { "<leader><space>", utils.telescope("files"), desc = "Find Files (root dir)" },
    -- find
    { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>ff", utils.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent" },
    { "<leader>fR", utils.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    -- search
    { '<leader>s"', "<Cmd>Telescope registers<CR>", desc = "Registers" },
    { "<leader>sa", "<Cmd>Telescope autocommands<CR>", desc = "Auto Commands" },
    { "<leader>sb", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer" },
    { "<leader>sc", "<Cmd>Telescope command_history<CR>", desc = "Command History" },
    { "<leader>sC", "<Cmd>Telescope commands<CR>", desc = "Commands" },
    { "<leader>sd", "<Cmd>Telescope diagnostics bufnr=0<CR>", desc = "Document diagnostics" },
    { "<leader>sD", "<Cmd>Telescope diagnostics<CR>", desc = "Workspace diagnostics" },
    { "<leader>sg", utils.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>sG", utils.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>sh", "<Cmd>Telescope help_tags<CR>", desc = "Help Pages" },
    { "<leader>sH", "<Cmd>Telescope highlights<CR>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<Cmd>Telescope keymaps<CR>", desc = "Key Maps" },
    { "<leader>sM", "<Cmd>Telescope man_pages<CR>", desc = "Man Pages" },
    { "<leader>sm", "<Cmd>Telescope marks<CR>", desc = "Jump to Mark" },
    { "<leader>so", "<Cmd>Telescope vim_options<CR>", desc = "Options" },
    { "<leader>sR", "<Cmd>Telescope resume<CR>", desc = "Resume" },
    { "<leader>sw", utils.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
    { "<leader>sW", utils.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
    { "<leader>sw", utils.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
    { "<leader>sW", utils.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
    { "<leader>uC", utils.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    {
      "<leader>ss",
      utils.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      utils.telescope("lsp_dynamic_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            utils.telescope("find_files", { no_ignore = true, default_text = line })()
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            utils.telescope("find_files", { hidden = true, default_text = line })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
