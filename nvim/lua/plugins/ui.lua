return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			timeout = false,
			triggers = {
				{ "<leader>", mode = { "n", "v" } },
			},
			win = {
				no_overlap = true,
			},
		},
	},
}
