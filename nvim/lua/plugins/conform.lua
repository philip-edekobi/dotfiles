return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofumpt", "goimports" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettier" },
				zig = { "zigfmt" },
				gleam = { "gleam" },
				asm = { "asmfmt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
