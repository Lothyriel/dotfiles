return {
  "Shatur/neovim-session-manager",
  opts = {
    autoload_mode = "Disabled",
    session_filename_to_dir = function(file)
      print(file)
      return require("utils").get_root()
    end,
    dir_to_session_filename = function(dir)
      print("dir: " .. dir)
      return vim.fn.fnamemodify(dir, ":t")
    end,
  },
  keys = {
    { "<leader>po", "<Cmd>SessionManager load_session<CR>", desc = "Load project session" },
    { "<leader>ps", "<Cmd>SessionManager save_current_session<CR>", desc = "Save current project session" },
  },
}
