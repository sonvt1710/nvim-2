require("snacks").setup({
	-- enabled
	indent = { enabled = true },
	picker = { enabled = true },
	bigfile = { enabled = true },
	quickfile = { enabled = true },
	notifier = { enabled = true },
	input = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true, debounce = 50 },
	-- disabled (have alternatives or unused)
	dashboard = { enabled = false },
	explorer = { enabled = false },
	scroll = { enabled = false },
})

local map = vim.keymap.set

-- Git
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })

-- Terminal
map("n", "<leader>tT", function() Snacks.terminal() end, { desc = "Toggle Terminal" })

-- Scratch
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })

-- Zen mode
map("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })

-- LSP rename file (different from symbol rename)
map("n", "<leader>lR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })

-- Buffer delete (preserves window layout)
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })

-- Notifier
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss Notifications" })
map("n", "<leader>fn", function() Snacks.picker.notifications() end, { desc = "Notification History" })

-- LSP reference navigation (requires words module)
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next LSP Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev LSP Reference" })
