return {
	{
		"nvim-telescope/telescope.nvim",
		-- branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					preview = {
						treesitter = false,
					},
					mappings = {
						i = {
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-q>"] = require("telescope.actions").send_selected_to_qflist
								+ require("telescope.actions").open_qflist,
						},
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
			})

			pcall(telescope.load_extension, "fzf")

			--keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help Tags" })
			vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Find in Current File" })
		end,
	},
}
