local icons = require("config.icons")

-- navic wants trailing spaces on icons
local navic_icons = {}
for k, v in pairs(icons) do
  navic_icons[k] = v .. " "
end

require("nvim-navic").setup({
  icons = navic_icons,
  highlight = true,
  lsp = {
    auto_attach = true,
    preference = {
      "templ",
      "ts_ls",
    },
  },
  click = true,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})

require("breadcrumbs").setup()
