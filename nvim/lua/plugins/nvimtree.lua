return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeOpen<cr>", desc = "Open File Explorer" },
		},
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- open files
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "o", api.node.open.edit, opts("Open/Toggle directories"))

				-- file ops(cut, copy, etc)
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete (with confirmation)"))

				-- utility
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				view = {
					adaptive_size = true,
					side = "right",
					relativenumber = true,
					number = true,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},
}
