local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/luxurydev/work/install_scripts/jls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  filetypes = { "java" },
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascript.jsx",
    "typescrpt.tsx",
    "javascriptreact",
  },
  settings = {
    javascript = {
    },
    typescript = {
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "c",
    "h",
    "cpp",
    "cxx",
    "hxx",
  },
}

lspconfig.gleam.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gleam", "lsp" },
  filetypes = { "gleam" },
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- filetypes = { "rust" },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      },
    }
  },
}
