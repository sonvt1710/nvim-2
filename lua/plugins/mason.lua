require("mason").setup({
  ui = {
    border = "rounded",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "tailwindcss",
    "rust_analyzer",
    "gopls",
    "html",
    "cssls",
    "basedpyright",
    "bashls",
    "css_variables",
    "cssmodules_ls",
    "dockerls",
    "jsonls",
    "lemminx",
    "marksman",
    "nginx_language_server",
    "taplo",
    "yamlls",
  },
  -- Automatically calls vim.lsp.enable() on installed servers (Neovim 0.11+)
  automatic_enable = true,
})

-- mason-tool-installer handles non-LSP tools (formatters, linters)
require("mason-tool-installer").setup({
  ensure_installed = {
    "oxlint",
    "stylua",
    "black",
    "isort",
    "pylint",
    "shellcheck",
    "shfmt",
  },
})
