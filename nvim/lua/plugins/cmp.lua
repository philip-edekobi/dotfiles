return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- Load only when you start typing
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Source for LSP results
			"hrsh7th/cmp-buffer", -- Source for text in current buffer
			"hrsh7th/cmp-path", -- Source for file system paths
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Prioritize LSP
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
