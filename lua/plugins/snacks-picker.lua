-- snacks.picker keymaps (picker is enabled in snacks.lua)
local map = vim.keymap.set

-- Files
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })

-- Grep
map("n", "<leader>ft", function() Snacks.picker.grep() end, { desc = "Live Grep" })
map({ "n", "x" }, "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "Grep Word / Selection" })
map("n", "<leader>fl", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>fL", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })

-- Git
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })

-- Search
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>fH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
map("n", "<leader>fR", function() Snacks.picker.resume() end, { desc = "Resume" })
map("n", '<leader>f"', function() Snacks.picker.registers() end, { desc = "Registers" })
map("n", "<leader>fa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>f/", function() Snacks.picker.search_history() end, { desc = "Search History" })
map("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>fM", function() Snacks.picker.man() end, { desc = "Man Pages" })
map("n", "<leader>fq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
map("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- Diagnostics
map("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map("n", "<leader>fD", function() Snacks.picker.diagnostics() end, { desc = "Workspace Diagnostics" })
