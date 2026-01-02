return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"javascript",
				"typescript",
				"markdown",
				"rust",
				"go",
				"markdown_inline",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	},
}
