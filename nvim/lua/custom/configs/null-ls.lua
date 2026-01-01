local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.black.with({
      filetypes = {
        "python"
      }
    }),
    null_ls.builtins.formatting.clang_format.with({
      filetypes = { "c", "cpp", "java", "h", "cxx", "hxx", "cs", "cuda", "proto" },
    }),
    null_ls.builtins.formatting.dxfmt.with({
      filetypes = { "rust" },
    }),
    null_ls.builtins.formatting.gleam_format.with({
      filetypes = { "gleam" },
    }),
    null_ls.builtins.formatting.gofumpt.with({
      filetypes = { "go" },
    }),
    null_ls.builtins.formatting.goimports_reviser.with({
      filetypes = { "go" },
    }),
    null_ls.builtins.formatting.golines.with({
      filetypes = { "go" },
    }),
    null_ls.builtins.formatting.leptosfmt.with({
      filetypes = { "rust" },
    }),
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "md",
        "txt",
      },
    }),
  },
   on_attach = function(client, bufnr)
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
