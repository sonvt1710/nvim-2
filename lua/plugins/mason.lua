require("mason").setup({
  ui = {
    border = "rounded",
  },
})

require("mason-tool-installer").setup({
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

    "oxlint",
    "stylua",
    "black",
    "isort",
    "pylint",
    "shellcheck",
    "shfmt",
  },
})
