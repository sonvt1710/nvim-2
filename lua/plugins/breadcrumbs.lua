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

-- Update winbar immediately on buffer enter and LSP attach
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "LspAttach" }, {
  callback = function()
    local ok = pcall(require("breadcrumbs").get_winbar)
    if not ok then
      return
    end
  end,
})
