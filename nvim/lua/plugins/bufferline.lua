return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
					show_buffer_close_icons = true,
					show_close_icon = false,
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "nvim-tree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
							side = "right",
						},
					},
				},
			})

			-- navigation keymaps
			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })

			-- close file
			vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = "Close Buffer" })
		end,
	},
}
