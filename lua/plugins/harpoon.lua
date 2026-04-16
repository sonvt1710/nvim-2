local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "m", function()
	harpoon:list():add()
	vim.notify("󱡅  marked file")
end)

vim.keymap.set("n", "<S-m>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
