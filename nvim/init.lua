-- Hide splash screen for non-empty dirs
local current_dir = vim.fn.getcwd()
local dir_content = vim.fn.readdir(current_dir)

if #dir_content > 0 then
	vim.opt.shortmess:append("I")
end

-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.timeoutlen = 300

-- syntax hl and file type detect
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.opt.mouse = "a"

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- highlight current line
vim.opt.cursorline = true

-- allow cusor to wraparound
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- hack to explicitly start treesitter when i'm working with gleam files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gleam",
	callback = function()
		vim.treesitter.start()
	end,
})

-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- means a plugin dir must exist for lazy to use
	spec = {
		{ import = "plugins" },
	},
})

-- vim.cmd.colorscheme("decay")
vim.cmd.colorscheme("nightfox")

-- force bg transparency
local groups = { "Normal", "NormalFloat", "Pmenu", "FloatBorder" }
for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

require("keymaps")
