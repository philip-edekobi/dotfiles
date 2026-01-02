return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		opts = {
			options = {
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
				},
			},
		},
	},

	{
		"decaycs/decay.nvim",
		name = "decay",
		priority = 1000,
		config = function()
			require("decay").setup({
				style = "dark",
				transparent = true,
			})
		end,
	},
}
