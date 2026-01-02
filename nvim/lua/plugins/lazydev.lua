return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/lux/library", words = { "vim%.uv" } },
			},
		},
	},
}
