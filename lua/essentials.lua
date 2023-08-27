local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.scrolloff = 4 -- Lines of context
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = true
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect" }
option.cursorline = true
option.confirm = true -- Confirm to save changes before exiting modified buffer
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.timeoutlen = 300
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true
option.splitbelow = true -- Put new windows below current

-- Buffer Settings --
buffer.fileenconding = "utf-8"

-- Global Settings --
global.mapleader = ","

-- Key mappings --
vim.keymap.set("n", "H", "<cmd>bp<CR>")
vim.keymap.set("n", "L", "<cmd>bn<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", {desc = '[Q]uit Buffer', silent = true})
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "q", "<ESC>")
vim.keymap.set({"n", "v"}, "<C-s>", "<cmd>wa<CR>")
vim.keymap.set("i", "<C-s>", "<ESC><cmd>wa<CR>a")
vim.keymap.set({"n", "v"}, "<C-q>", "<cmd>wqall<CR>")
vim.keymap.set({"n", "v"}, "<ESC>", "<cmd>noh<CR>")

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better paste
vim.keymap.set({ "v", "n" }, "<leader>p", "\"0p", { desc = "[p]aste latest"})
vim.keymap.set({ "v", "n" }, "<leader>P", "\"0P", { desc = "[P]aste latest"})

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "[N]ew File" })
