local function extendTable(tab1, tab2)
	return vim.tbl_extend("force", tab1 or {}, tab2 or {})
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					-- automatic_enable = true,
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set(
					"n",
					"<leader>jdc",
					vim.lsp.buf.declaration,
					extendTable(bufopts, { desc = "Jump to Declaration" })
				)
				vim.keymap.set(
					"n",
					"<leader>jdf",
					vim.lsp.buf.definition,
					extendTable(bufopts, { desc = "Jump to Definition" })
				)
				vim.keymap.set(
					"n",
					"<leader>ji",
					vim.lsp.buf.implementation,
					extendTable(bufopts, { desc = "Jump to Implementation" })
				)
				vim.keymap.set(
					"n",
					"<leader>jtd",
					vim.lsp.buf.type_definition,
					extendTable(bufopts, { desc = "Jump to Type Defs" })
				)
				vim.keymap.set(
					"n",
					"<leader>jr",
					vim.lsp.buf.references,
					extendTable(bufopts, { desc = "Jump to References" })
				)
				vim.keymap.set(
					"n",
					"<leader>jc",
					vim.lsp.buf.code_action,
					extendTable(bufopts, { desc = "Jump to Code Action" })
				)

				vim.keymap.set("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
				end, extendTable(bufopts, { desc = "Toggle Inlay Hints" }))
			end

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
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("ts_ls", {
				root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("clangd", {
				capabilities = extendTable(capabilities, {
					offsetEncoding = { "utf-16" },
				}),
				on_attach = on_attach,
				root_markers = { ".clang-format", "compile_commands.json", ".git", "compile_flags.txt" },
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- enable servers
			vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "zls", "asm_lsp", "gleam", "rust_analyzer", "jdtls", "clangd" })
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			local lsp_sig = require("lsp_signature")

			lsp_sig.setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
				doc_lines = 10,
				-- hi_parameter = "LspSignatureActiveParameter",

				hint_enable = true,
				hint_prefix = "Arg: ",
			})
		end,
	},
}
