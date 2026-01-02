local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-jdtls",
    config = function ()
      require "plugins.configs.jdtls"
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {
      "c",
      "h",
      "cpp",
      "cxx",
      "hxx",
      "cpp",
      "go",
      "gleam",
      "javascript",
      "java",
      "lua",
      "proto",
      "python",
      "rust",
      "typescript",
    },
    opts = function(_, opts)
      return require "custom.configs.null-ls"
		end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "andweeb/presence.nvim",
    event = 'VeryLazy',
    config = function()
      require('presence').setup({
      })
    end,
  },
}

return plugins
