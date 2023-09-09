local utils = require("utils")
local map = utils.map

map("n", "<leader>gc", function()
  require("telescope.builtin").git_bcommits({ use_file_path = true })
end, { desc = "Git commits (current file)" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<Cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<Cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<Cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><Cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><Cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<Cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<Cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

map("n", "<leader>bb", "<Cmd>e #<CR>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<Cmd>noh<CR><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / clear hlsearch / diff update" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<Cmd>w<cr><esc>", { desc = "Save file" })

--keywordprg
map("n", "<leader>K", "<Cmd>norm! K<cr>", { desc = "Keywordprg" })

-- lazy
map("n", "<leader>l", "<Cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<Cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<Cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<Cmd>copen<cr>", { desc = "Quickfix List" })

-- diagnostics
map("n", "<leader>ud", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })

-- quit
map("n", "<leader>q", "<Cmd>qa<CR>", { desc = "Quit all" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to left window" })
map("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to lower window" })
map("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to upper window" })
map("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to right window" })
map("t", "<C-/>", "<Cmd>close<CR>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<Cmd>close<CR>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>wb", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wr", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<Cmd>tablast<CR>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<Cmd>tabfirst<CR>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<Cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<Cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<Cmd>tabclose<CR>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<Cmd>tabprevious<CR>", { desc = "Previous Tab" })

local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3

map("n", "<leader>uc", function()
  utils.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

if vim.lsp.inlay_hint then
  map("n", "<leader>uh", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle Inlay Hints" })
end
