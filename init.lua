require("config.options")
require("config.keymaps")
require("config.autocommands")
require("config.pack")
require("config.colorscheme")
require("config.statusline")
require("config.lsp")

require("functions.search-projects")

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, {})
