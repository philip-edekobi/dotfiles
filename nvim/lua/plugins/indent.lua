return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = {
				char = "|",
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				injected_languages = true,
				highlight = { "Function", "Label" },
			},
			exclude = {
				filetypes = { "help", "nvim-tree", "lazy", "mason" },
			},
		},
	},
}
