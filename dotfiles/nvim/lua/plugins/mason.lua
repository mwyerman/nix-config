return {
  "williamboman/mason.nvim",
  enabled = false,
  -- keys = {
  --   { "<leader>lI", "<cmd>Mason<cr>", desc = "mason installer" }
  -- },
  -- cmd = {
  --   "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonInstallAll",
  --   "MasonUpdateAll", "MasonUninstallAll", "MasonLog" },
  -- lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  -- cond = not vim.g.vscode,
  config = function()
    local lspconfig = require("lspconfig")

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      -- Default handler (optional)
      function(server_name)
        lspconfig[server_name].setup({})
      end,

      ["pylsp"] = function()
        lspconfig["pylsp"].setup(
          require("plugins.lsp.pylsp")
        )
      end,

      ["pyright"] = function()
        lspconfig["pyright"].setup(
          require("plugins.lsp.pyright")
        )
      end,

      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup(
          require("plugins.lsp.lua_ls")
        )
      end,

      ["clangd"] = function()
        lspconfig["clangd"].setup(
          require("plugins.lsp.clangd")
        )
      end,
    })
  end,
}
