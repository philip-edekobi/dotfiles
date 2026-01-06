-- disable leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- leader key

-- use display navigation instead of line by line
vim.keymap.set({ "n", "v" }, "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { expr = true, silent = true })

-- commenting
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- clear hl
vim.keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- show errors
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics popup" })

-- terminal things
local terminal = require("nvterm.terminal")
vim.keymap.set({ "n", "t" }, "<leader>h", function()
	terminal.toggle("horizontal")
end, { noremap = true, silent = true, desc = "Open Horizontal Terminal" }) -- horizontal terminal
vim.keymap.set({ "n", "t" }, "<leader>v", function()
	terminal.toggle("vertical")
end, { noremap = true, silent = true, desc = "Open Vertical Terminal" }) -- vertical terminal
vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true, silent = true }) -- go to Normal mode from Term

-- window nav from ANY mode (Normal, Insert, Terminal)
local navmodes = { "n", "i", "t" }
local navopts = { noremap = true, silent = true }

vim.keymap.set(navmodes, "<A-h>", [[<C-\><C-n><C-w>h]], navopts) -- Move Left
vim.keymap.set(navmodes, "<A-j>", [[<C-\><C-n><C-w>j]], navopts) -- Move Down
vim.keymap.set(navmodes, "<A-k>", [[<C-\><C-n><C-w>k]], navopts) -- Move Up
vim.keymap.set(navmodes, "<A-l>", [[<C-\><C-n><C-w>l]], navopts) -- Move Right

-- jump back after jumping to def or ref
vim.keymap.set("n", "<leader>jb", "<C-t>", { desc = "Jump back" })
