return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- branch = "master",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"gleam",
				"zig",
				"python",
				"java",
				"c",
				"cpp",
				"asm",
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
				use_languagetree = true,
			},
			indent = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	},
}
