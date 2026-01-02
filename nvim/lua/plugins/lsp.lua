return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					automatic_enable = true,
					ensure_installed = {
						"lua_ls",
						"gopls",
						"rust_analyzer",
						"ts_ls",
						"jdtls",
						"clangd",
						"zls",
						"asm_lsp",
					},
				},
			},
		},
		config = function()
			-- lsp servers... (remember to add them to the enable() call below
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("gleam", {
				cmd = { "gleam", "lsp" },
				filetypes = { "gleam" },
				root_markers = { "gleam.toml", ".git" },
			})

			vim.lsp.config("rust_analyzer", {
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- enable servers
			vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "zls", "asm_lsp", "gleam", "rust_analyzer", "jdtls", "clangd" })
		end,
	},
}
